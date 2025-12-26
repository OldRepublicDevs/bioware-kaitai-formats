import kaitai_struct_nim_runtime
import options

type
  GvtXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[GvtXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GvtXml



##[
Human-readable XML representation of GVT (Global Variables Table) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../gvt/gvt.ksy

References:
- PyKotor wiki (GFF-GVT.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[GvtXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GvtXml =
  template this: untyped = result
  this = new(GvtXml)
  let root = if root == nil: cast[GvtXml](this) else: cast[GvtXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[GvtXml], filename: string): GvtXml =
  GvtXml.read(newKaitaiFileStream(filename), nil, nil)

