import kaitai_struct_nim_runtime
import options

type
  AreXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[AreXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AreXml



##[
Human-readable XML representation of ARE (Area) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../are/are.ksy

References:
- PyKotor wiki (GFF-ARE.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[AreXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AreXml =
  template this: untyped = result
  this = new(AreXml)
  let root = if root == nil: cast[AreXml](this) else: cast[AreXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[AreXml], filename: string): AreXml =
  AreXml.read(newKaitaiFileStream(filename), nil, nil)

