import kaitai_struct_nim_runtime
import options

type
  FacXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[FacXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): FacXml



##[
Human-readable XML representation of FAC (Faction) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../fac/fac.ksy

References:
- PyKotor wiki (GFF-FAC.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[FacXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): FacXml =
  template this: untyped = result
  this = new(FacXml)
  let root = if root == nil: cast[FacXml](this) else: cast[FacXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[FacXml], filename: string): FacXml =
  FacXml.read(newKaitaiFileStream(filename), nil, nil)

