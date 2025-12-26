import kaitai_struct_nim_runtime
import options

type
  UttXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[UttXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UttXml



##[
Human-readable XML representation of UTT (Trigger Template) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../utt/utt.ksy

References:
- PyKotor wiki (GFF-UTT.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[UttXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UttXml =
  template this: untyped = result
  this = new(UttXml)
  let root = if root == nil: cast[UttXml](this) else: cast[UttXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[UttXml], filename: string): UttXml =
  UttXml.read(newKaitaiFileStream(filename), nil, nil)

