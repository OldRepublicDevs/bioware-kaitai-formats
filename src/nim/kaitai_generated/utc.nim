import kaitai_struct_nim_runtime
import options
import gff

type
  Utc* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Utc], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utc

proc fileTypeValid*(this: Utc): bool
proc versionValid*(this: Utc): bool


##[
UTC (Creature Template) files are GFF-based format files that store creature definitions
including stats, appearance, inventory, feats, and script hooks. UTC files are used to
define NPCs, party members, enemies, and the player character in Knights of the Old Republic.

This format inherits the complete GFF structure from gff.ksy and adds UTC-specific
validation and documentation.

UTC Root Struct Fields (Common):
- "TemplateResRef" (ResRef): Blueprint identifier
- "Tag" (String): Unique instance identifier
- "FirstName", "LastName" (LocalizedString): Creature name
- "Appearance_Type" (UInt32): Appearance ID (appearance.2da)
- "PortraitId" (UInt16): Portrait index (portraits.2da)
- "Gender", "Race" (UInt8/UInt16): Character attributes
- "Str", "Dex", "Con", "Int", "Wis", "Cha" (UInt8): Ability scores
- "HitPoints", "MaxHitPoints", "ForcePoints" (Int16): Health/Force stats
- "ClassList" (List): Character classes with levels
- "FeatList" (List): Known feats
- "SkillList" (List): Skill ranks
- "ItemList" (List): Inventory items
- "Equip_ItemList" (List): Equipped items with slots
- Script hooks: "ScriptAttacked", "ScriptDamaged", "ScriptDeath", etc. (ResRef)

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTC.md
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
- https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utc.py
- https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/utc.cpp

]##
proc read*(_: typedesc[Utc], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utc =
  template this: untyped = result
  this = new(Utc)
  let root = if root == nil: cast[Utc](this) else: cast[Utc](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Complete GFF structure. UTC files use standard GFF format with "UTC " file type.
Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.

  ]##
  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Utc): bool = 

  ##[
  Validates that this is a UTC file (file type must be "UTC ")
  ]##
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "UTC ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Utc): bool = 

  ##[
  Validates GFF version is supported
  ]##
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Utc], filename: string): Utc =
  Utc.read(newKaitaiFileStream(filename), nil, nil)

