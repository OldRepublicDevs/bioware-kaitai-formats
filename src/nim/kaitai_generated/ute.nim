import kaitai_struct_nim_runtime
import options
import gff

type
  Ute* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Ute], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ute

proc fileTypeValid*(this: Ute): bool
proc versionValid*(this: Ute): bool


##[
UTE (Encounter Template) files define spawn encounters with creature lists and probabilities.

This format inherits the complete GFF structure from gff.ksy.

UTE Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Encounter name
- CreatureList (List): Creatures to spawn with probabilities
- Difficulty, MaxCreatures, RecCreatures, SpawnOption: Spawn behavior
- Script hooks: OnEntered, OnExhausted, OnExit, OnHeartbeat, OnUserDefined

]##
proc read*(_: typedesc[Ute], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ute =
  template this: untyped = result
  this = new(Ute)
  let root = if root == nil: cast[Ute](this) else: cast[Ute](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Ute): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "UTE ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Ute): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Ute], filename: string): Ute =
  Ute.read(newKaitaiFileStream(filename), nil, nil)

