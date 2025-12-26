import kaitai_struct_nim_runtime
import options
import gff

type
  Utt* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Utt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utt

proc fileTypeValid*(this: Utt): bool
proc versionValid*(this: Utt): bool


##[
UTT (Trigger Template) files define trigger zones and their properties.

This format inherits the complete GFF structure from gff.ksy.

UTT Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Trigger name
- Geometry (List): Trigger zone vertices
- TriggerType, Cursor, Faction: Trigger behavior
- Script hooks: OnClick, OnDisarm, OnHeartbeat, OnTrapTriggered, OnUserDefined

]##
proc read*(_: typedesc[Utt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utt =
  template this: untyped = result
  this = new(Utt)
  let root = if root == nil: cast[Utt](this) else: cast[Utt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Utt): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "UTT ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Utt): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Utt], filename: string): Utt =
  Utt.read(newKaitaiFileStream(filename), nil, nil)

