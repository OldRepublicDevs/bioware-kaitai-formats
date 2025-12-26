import kaitai_struct_nim_runtime
import options
import gff

type
  Utw* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Utw], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utw

proc fileTypeValid*(this: Utw): bool
proc versionValid*(this: Utw): bool


##[
UTW (Waypoint Template) files define navigation waypoints and spawn points.

This format inherits the complete GFF structure from gff.ksy.

UTW Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Waypoint name
- Appearance (UInt32): Visual appearance (if visible)
- HasMapNote, MapNote (LocalizedString): Map markers
- LinkedTo (String): Connected waypoint tag

]##
proc read*(_: typedesc[Utw], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utw =
  template this: untyped = result
  this = new(Utw)
  let root = if root == nil: cast[Utw](this) else: cast[Utw](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Utw): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "UTW ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Utw): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Utw], filename: string): Utw =
  Utw.read(newKaitaiFileStream(filename), nil, nil)

