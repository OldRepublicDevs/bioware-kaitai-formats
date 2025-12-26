import kaitai_struct_nim_runtime
import options
import gff

type
  Ifo* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Ifo], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ifo

proc fileTypeValid*(this: Ifo): bool
proc versionValid*(this: Ifo): bool


##[
IFO (Module Information) files store module metadata including entry points,
starting locations, and module properties.

This format inherits the complete GFF structure from gff.ksy.

IFO Root Struct Fields:
- Mod_ID (ResRef): Module identifier
- Mod_Name (LocalizedString): Module display name
- Mod_Entry_Area (ResRef): Starting area
- Mod_Entry_X, Mod_Entry_Y, Mod_Entry_Z (Float): Starting position
- Mod_Entry_Dir_X, Mod_Entry_Dir_Y (Float): Starting orientation
- Mod_OnHeartbeat, Mod_OnModLoad, Mod_OnModStart (ResRef): Script hooks
- Mod_MinGameVer (String): Minimum game version required

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-IFO.md

]##
proc read*(_: typedesc[Ifo], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ifo =
  template this: untyped = result
  this = new(Ifo)
  let root = if root == nil: cast[Ifo](this) else: cast[Ifo](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Ifo): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "IFO ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Ifo): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Ifo], filename: string): Ifo =
  Ifo.read(newKaitaiFileStream(filename), nil, nil)

