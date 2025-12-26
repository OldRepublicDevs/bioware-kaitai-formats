import kaitai_struct_nim_runtime
import options

type
  DlgXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[DlgXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DlgXml



##[
Human-readable XML representation of DLG (Dialogue) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../dlg/dlg.ksy

References:
- PyKotor wiki (GFF-DLG.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[DlgXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DlgXml =
  template this: untyped = result
  this = new(DlgXml)
  let root = if root == nil: cast[DlgXml](this) else: cast[DlgXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[DlgXml], filename: string): DlgXml =
  DlgXml.read(newKaitaiFileStream(filename), nil, nil)

