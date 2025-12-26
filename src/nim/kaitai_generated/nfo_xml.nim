import kaitai_struct_nim_runtime
import options

type
  NfoXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[NfoXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NfoXml



##[
Human-readable XML representation of NFO (Module Info) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../nfo/nfo.ksy

References:
- PyKotor wiki (GFF-NFO.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[NfoXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NfoXml =
  template this: untyped = result
  this = new(NfoXml)
  let root = if root == nil: cast[NfoXml](this) else: cast[NfoXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[NfoXml], filename: string): NfoXml =
  NfoXml.read(newKaitaiFileStream(filename), nil, nil)

