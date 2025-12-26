import kaitai_struct_nim_runtime
import options

type
  UtiXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[UtiXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtiXml



##[
Human-readable XML representation of UTI (Item Template) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../uti/uti.ksy

References:
- PyKotor wiki (GFF-UTI.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[UtiXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtiXml =
  template this: untyped = result
  this = new(UtiXml)
  let root = if root == nil: cast[UtiXml](this) else: cast[UtiXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[UtiXml], filename: string): UtiXml =
  UtiXml.read(newKaitaiFileStream(filename), nil, nil)

