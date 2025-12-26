import kaitai_struct_nim_runtime
import options

type
  UtmXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[UtmXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtmXml



##[
Human-readable XML representation of UTM (Store/Merchant Template) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../utm/utm.ksy

References:
- PyKotor wiki (GFF-UTM.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[UtmXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtmXml =
  template this: untyped = result
  this = new(UtmXml)
  let root = if root == nil: cast[UtmXml](this) else: cast[UtmXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[UtmXml], filename: string): UtmXml =
  UtmXml.read(newKaitaiFileStream(filename), nil, nil)

