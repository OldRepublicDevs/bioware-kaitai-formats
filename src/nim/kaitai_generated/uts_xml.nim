import kaitai_struct_nim_runtime
import options

type
  UtsXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[UtsXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtsXml



##[
Human-readable XML representation of UTS (Sound Template) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../uts/uts.ksy

References:
- PyKotor wiki (GFF-UTS.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[UtsXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtsXml =
  template this: untyped = result
  this = new(UtsXml)
  let root = if root == nil: cast[UtsXml](this) else: cast[UtsXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[UtsXml], filename: string): UtsXml =
  UtsXml.read(newKaitaiFileStream(filename), nil, nil)

