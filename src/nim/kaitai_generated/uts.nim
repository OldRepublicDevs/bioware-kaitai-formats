import kaitai_struct_nim_runtime
import options
import gff

type
  Uts* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Uts], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Uts

proc fileTypeValid*(this: Uts): bool
proc versionValid*(this: Uts): bool


##[
UTS (Sound Template) files define ambient sound sources and properties.

This format inherits the complete GFF structure from gff.ksy.

UTS Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Sound name
- Sounds (List): Sound file references
- Volume, MaxDistance, MinDistance: Audio properties
- Looping, Random, Positional: Sound behavior

]##
proc read*(_: typedesc[Uts], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Uts =
  template this: untyped = result
  this = new(Uts)
  let root = if root == nil: cast[Uts](this) else: cast[Uts](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Uts): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "UTS ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Uts): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Uts], filename: string): Uts =
  Uts.read(newKaitaiFileStream(filename), nil, nil)

