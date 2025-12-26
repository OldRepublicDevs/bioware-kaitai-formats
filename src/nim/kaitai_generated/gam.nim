import kaitai_struct_nim_runtime
import options
import gff

type
  Gam* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Gam], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gam

proc fileTypeValid*(this: Gam): bool
proc versionValid*(this: Gam): bool


##[
GAM (Game State) files are GFF-based format files that store game state information
including party members, global variables, game time, and time played.

This format inherits the complete GFF structure from gff.ksy and adds GAM-specific
validation and documentation.

GAM files are used by:
- Aurora Engine (Neverwinter Nights, Neverwinter Nights 2)
- Infinity Engine (Mass Effect, Dragon Age Origins, Dragon Age 2)

NOTE: Odyssey Engine (Knights of the Old Republic) does NOT use GAM format -
it uses NFO format for save games instead.

GAM Root Struct Fields:
- GameTimeHour, GameTimeMinute, GameTimeSecond, GameTimeMillisecond (Int32): Game time
- TimePlayed (Int32): Total playtime in seconds
- PartyList (List): Party member ResRefs
- GlobalBooleans, GlobalNumbers, GlobalStrings (Lists): Global variable storage

Aurora-specific: ModuleName, CurrentArea, PlayerCharacter
Infinity-specific: GameName, Chapter, JournalEntries

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GAM.md
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md

]##
proc read*(_: typedesc[Gam], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gam =
  template this: untyped = result
  this = new(Gam)
  let root = if root == nil: cast[Gam](this) else: cast[Gam](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Complete GFF structure. GAM files use standard GFF format with "GAM " file type.
Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.

  ]##
  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Gam): bool = 

  ##[
  Validates that this is a GAM file (file type must be "GAM ")
  ]##
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "GAM ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Gam): bool = 

  ##[
  Validates GFF version is supported
  ]##
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Gam], filename: string): Gam =
  Gam.read(newKaitaiFileStream(filename), nil, nil)

