import kaitai_struct_nim_runtime
import options
import gff

type
  Gvt* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Gvt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gvt

proc fileTypeValid*(this: Gvt): bool
proc versionValid*(this: Gvt): bool


##[
GVT (Global Variables Table) files store global game variables.

This format inherits the complete GFF structure from gff.ksy.

GVT Root Struct Fields:
- ValNumber, ValBoolean, ValString lists for different variable types

]##
proc read*(_: typedesc[Gvt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gvt =
  template this: untyped = result
  this = new(Gvt)
  let root = if root == nil: cast[Gvt](this) else: cast[Gvt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Gvt): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "GVT ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Gvt): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Gvt], filename: string): Gvt =
  Gvt.read(newKaitaiFileStream(filename), nil, nil)

