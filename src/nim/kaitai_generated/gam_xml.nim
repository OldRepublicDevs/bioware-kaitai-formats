import kaitai_struct_nim_runtime
import options

type
  GamXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[GamXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GamXml



##[
Human-readable XML representation of GAM (Game State) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../gam/gam.ksy

References:
- PyKotor wiki (GFF-GAM.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[GamXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GamXml =
  template this: untyped = result
  this = new(GamXml)
  let root = if root == nil: cast[GamXml](this) else: cast[GamXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[GamXml], filename: string): GamXml =
  GamXml.read(newKaitaiFileStream(filename), nil, nil)

