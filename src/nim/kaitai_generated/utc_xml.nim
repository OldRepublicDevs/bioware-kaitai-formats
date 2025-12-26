import kaitai_struct_nim_runtime
import options

type
  UtcXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[UtcXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtcXml



##[
Human-readable XML representation of UTC (Creature Template) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../utc/utc.ksy

References:
- PyKotor wiki (GFF-UTC.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[UtcXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UtcXml =
  template this: untyped = result
  this = new(UtcXml)
  let root = if root == nil: cast[UtcXml](this) else: cast[UtcXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[UtcXml], filename: string): UtcXml =
  UtcXml.read(newKaitaiFileStream(filename), nil, nil)

