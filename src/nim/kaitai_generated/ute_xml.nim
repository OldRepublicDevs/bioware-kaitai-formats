import kaitai_struct_nim_runtime
import options

type
  UteXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[UteXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UteXml



##[
Human-readable XML representation of UTE (Encounter Template) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../ute/ute.ksy

References:
- PyKotor wiki (GFF-UTE.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[UteXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UteXml =
  template this: untyped = result
  this = new(UteXml)
  let root = if root == nil: cast[UteXml](this) else: cast[UteXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[UteXml], filename: string): UteXml =
  UteXml.read(newKaitaiFileStream(filename), nil, nil)

