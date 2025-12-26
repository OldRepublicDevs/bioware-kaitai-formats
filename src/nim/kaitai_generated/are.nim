import kaitai_struct_nim_runtime
import options
import gff

type
  Are* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `rootStructResolvedInst`: Gff_ResolvedStruct
    `rootStructResolvedInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Are], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Are

proc fileTypeValid*(this: Are): bool
proc rootStructResolved*(this: Are): Gff_ResolvedStruct
proc versionValid*(this: Are): bool


##[
ARE (Area) files are GFF-based format files that store static area information including
lighting, fog, grass, weather, script hooks, and map data. ARE files use the GFF (Generic File Format)
binary structure with file type signature "ARE ".

This format inherits the complete GFF structure from gff.ksy and adds ARE-specific
validation and documentation.

ARE Root Struct Fields (Common):
- "Tag" (String): Unique area identifier
- "Name" (LocalizedString): Area display name
- "SunAmbientColor", "SunDiffuseColor" (UInt32): Lighting colors (BGR format)
- "SunFogOn", "SunFogNear", "SunFogFar", "SunFogColor": Fog settings
- "Grass_*": Grass rendering properties
- "OnEnter", "OnExit", "OnHeartbeat", "OnUserDefined": Script hooks (ResRef)
- "Map" (Struct): Minimap coordinate mapping
- "Rooms" (List): Audio zones and weather regions

KotOR 2 adds weather fields:
- "ChanceRain", "ChanceSnow", "ChanceLightning" (Int32)
- "Dirty*" fields for dust particle effects

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-ARE.md
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
- https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/are.py
- https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/are.cpp

]##
proc read*(_: typedesc[Are], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Are =
  template this: untyped = result
  this = new(Are)
  let root = if root == nil: cast[Are](this) else: cast[Are](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Complete GFF structure. ARE files use standard GFF format with "ARE " file type.
Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.

  ]##
  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Are): bool = 

  ##[
  Validates that this is an ARE file (file type must be "ARE ")
  ]##
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "ARE ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc rootStructResolved(this: Are): Gff_ResolvedStruct = 

  ##[
  Convenience access to the decoded GFF root struct (struct_array[0]).
Use this to iterate all resolved fields (label + typed value), including:
"Tag", "Name", "AlphaTest", "Map" (struct), "Rooms" (list), and all KotOR2/deprecated keys.
  ]##
  if this.rootStructResolvedInstFlag:
    return this.rootStructResolvedInst
  let rootStructResolvedInstExpr = Gff_ResolvedStruct(this.gffData.rootStructResolved)
  this.rootStructResolvedInst = rootStructResolvedInstExpr
  this.rootStructResolvedInstFlag = true
  return this.rootStructResolvedInst

proc versionValid(this: Are): bool = 

  ##[
  Validates GFF version is supported
  ]##
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Are], filename: string): Are =
  Are.read(newKaitaiFileStream(filename), nil, nil)

