import kaitai_struct_nim_runtime
import options

type
  UtdXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[UtdXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtdXml



##[
Human-readable XML representation of UTD (Door Template) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../utd/utd.ksy

References:
- PyKotor wiki (GFF-UTD.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[UtdXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtdXml =
  template this: untyped = result
  this = new(UtdXml)
  let root = if root == nil: cast[UtdXml](this) else: cast[UtdXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[UtdXml], filename: string): UtdXml =
  UtdXml.read(newKaitaiFileStream(filename), nil, nil)

