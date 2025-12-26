import kaitai_struct_nim_runtime
import options

type
  JrlXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[JrlXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): JrlXml



##[
Human-readable XML representation of JRL (Journal) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../jrl/jrl.ksy

References:
- PyKotor wiki (GFF-JRL.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[JrlXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): JrlXml =
  template this: untyped = result
  this = new(JrlXml)
  let root = if root == nil: cast[JrlXml](this) else: cast[JrlXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[JrlXml], filename: string): JrlXml =
  JrlXml.read(newKaitaiFileStream(filename), nil, nil)

