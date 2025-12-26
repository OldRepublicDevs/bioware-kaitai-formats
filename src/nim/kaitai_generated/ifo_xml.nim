import kaitai_struct_nim_runtime
import options

type
  IfoXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[IfoXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): IfoXml



##[
Human-readable XML representation of IFO (Module Information) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../ifo/ifo.ksy

References:
- PyKotor wiki (GFF-IFO.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[IfoXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): IfoXml =
  template this: untyped = result
  this = new(IfoXml)
  let root = if root == nil: cast[IfoXml](this) else: cast[IfoXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[IfoXml], filename: string): IfoXml =
  IfoXml.read(newKaitaiFileStream(filename), nil, nil)

