import kaitai_struct_nim_runtime
import options

type
  UtwXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[UtwXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtwXml



##[
Human-readable XML representation of UTW (Waypoint Template) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../utw/utw.ksy

References:
- PyKotor wiki (GFF-UTW.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[UtwXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtwXml =
  template this: untyped = result
  this = new(UtwXml)
  let root = if root == nil: cast[UtwXml](this) else: cast[UtwXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[UtwXml], filename: string): UtwXml =
  UtwXml.read(newKaitaiFileStream(filename), nil, nil)

