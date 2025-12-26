import kaitai_struct_nim_runtime
import options
import gff

type
  Utp* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Utp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utp

proc fileTypeValid*(this: Utp): bool
proc versionValid*(this: Utp): bool


##[
UTP (Placeable Template) files define placeable objects (containers, furniture, etc.).

This format inherits the complete GFF structure from gff.ksy.

UTP Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Placeable name
- Appearance (UInt32): Placeable appearance ID
- HasInventory, ItemList (List): Container contents
- Locked, KeyRequired, Trap: Security settings
- Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnHeartbeat, etc.

]##
proc read*(_: typedesc[Utp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utp =
  template this: untyped = result
  this = new(Utp)
  let root = if root == nil: cast[Utp](this) else: cast[Utp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Utp): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "UTP ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Utp): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Utp], filename: string): Utp =
  Utp.read(newKaitaiFileStream(filename), nil, nil)

