import kaitai_struct_nim_runtime
import options

type
  CnvXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[CnvXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CnvXml



##[
Human-readable XML representation of CNV (Conversation) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../cnv/cnv.ksy

References:
- PyKotor wiki (GFF-CNV.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[CnvXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CnvXml =
  template this: untyped = result
  this = new(CnvXml)
  let root = if root == nil: cast[CnvXml](this) else: cast[CnvXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[CnvXml], filename: string): CnvXml =
  CnvXml.read(newKaitaiFileStream(filename), nil, nil)

