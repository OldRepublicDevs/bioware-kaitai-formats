import kaitai_struct_nim_runtime
import options

type
  PtXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[PtXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PtXml



##[
Human-readable XML representation of PT (Party Table) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../pt/pt.ksy

References:
- PyKotor wiki (GFF-PT.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[PtXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PtXml =
  template this: untyped = result
  this = new(PtXml)
  let root = if root == nil: cast[PtXml](this) else: cast[PtXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[PtXml], filename: string): PtXml =
  PtXml.read(newKaitaiFileStream(filename), nil, nil)

