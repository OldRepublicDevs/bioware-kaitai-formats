import kaitai_struct_nim_runtime
import options

type
  UtpXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[UtpXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtpXml



##[
Human-readable XML representation of UTP (Placeable Template) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../utp/utp.ksy

References:
- PyKotor wiki (GFF-UTP.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[UtpXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtpXml =
  template this: untyped = result
  this = new(UtpXml)
  let root = if root == nil: cast[UtpXml](this) else: cast[UtpXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[UtpXml], filename: string): UtpXml =
  UtpXml.read(newKaitaiFileStream(filename), nil, nil)

