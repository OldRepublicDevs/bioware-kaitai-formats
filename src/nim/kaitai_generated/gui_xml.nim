import kaitai_struct_nim_runtime
import options

type
  GuiXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[GuiXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GuiXml



##[
Human-readable XML representation of GUI (Graphical User Interface) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../gui/gui.ksy

References:
- PyKotor wiki (GFF-GUI.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[GuiXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GuiXml =
  template this: untyped = result
  this = new(GuiXml)
  let root = if root == nil: cast[GuiXml](this) else: cast[GuiXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[GuiXml], filename: string): GuiXml =
  GuiXml.read(newKaitaiFileStream(filename), nil, nil)

