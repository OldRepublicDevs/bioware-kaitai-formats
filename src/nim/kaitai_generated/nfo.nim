import kaitai_struct_nim_runtime
import options
import gff

type
  Nfo* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Nfo], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nfo

proc fileTypeValid*(this: Nfo): bool
proc versionValid*(this: Nfo): bool


##[
NFO (Module Info) files store save game module information for KotOR.

This format inherits the complete GFF structure from gff.ksy.

Note: This is different from IFO files. NFO is used in save games,
while IFO is used in module definitions.

]##
proc read*(_: typedesc[Nfo], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nfo =
  template this: untyped = result
  this = new(Nfo)
  let root = if root == nil: cast[Nfo](this) else: cast[Nfo](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Nfo): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "NFO ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Nfo): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Nfo], filename: string): Nfo =
  Nfo.read(newKaitaiFileStream(filename), nil, nil)

