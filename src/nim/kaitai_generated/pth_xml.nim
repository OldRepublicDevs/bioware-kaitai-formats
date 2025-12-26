import kaitai_struct_nim_runtime
import options

type
  PthXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[PthXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PthXml



##[
Human-readable XML representation of PTH (Path/Pathfinding) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../pth/pth.ksy

References:
- PyKotor wiki (GFF-PTH.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[PthXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PthXml =
  template this: untyped = result
  this = new(PthXml)
  let root = if root == nil: cast[PthXml](this) else: cast[PthXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[PthXml], filename: string): PthXml =
  PthXml.read(newKaitaiFileStream(filename), nil, nil)

