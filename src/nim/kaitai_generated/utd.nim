import kaitai_struct_nim_runtime
import options
import gff

type
  Utd* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Utd], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utd

proc fileTypeValid*(this: Utd): bool
proc versionValid*(this: Utd): bool


##[
UTD (Door Template) files define door properties, scripts, and behavior.

This format inherits the complete GFF structure from gff.ksy.

UTD Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Door name
- Appearance (UInt32): Door appearance ID
- Locked, KeyRequired, Trap, Faction (various): Door state/behavior
- Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnFailToOpen, etc.

]##
proc read*(_: typedesc[Utd], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utd =
  template this: untyped = result
  this = new(Utd)
  let root = if root == nil: cast[Utd](this) else: cast[Utd](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Utd): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "UTD ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Utd): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Utd], filename: string): Utd =
  Utd.read(newKaitaiFileStream(filename), nil, nil)

