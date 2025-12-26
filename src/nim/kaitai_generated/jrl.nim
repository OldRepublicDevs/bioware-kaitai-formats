import kaitai_struct_nim_runtime
import options
import gff

type
  Jrl* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Jrl], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Jrl

proc fileTypeValid*(this: Jrl): bool
proc versionValid*(this: Jrl): bool


##[
JRL (Journal) files store quest journal entries and categories.

This format inherits the complete GFF structure from gff.ksy.

JRL Root Struct Fields:
- Categories (List): Journal categories
- Each category contains quest entries with text, states, priorities

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-JRL.md

]##
proc read*(_: typedesc[Jrl], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Jrl =
  template this: untyped = result
  this = new(Jrl)
  let root = if root == nil: cast[Jrl](this) else: cast[Jrl](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Jrl): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "JRL ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Jrl): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Jrl], filename: string): Jrl =
  Jrl.read(newKaitaiFileStream(filename), nil, nil)

