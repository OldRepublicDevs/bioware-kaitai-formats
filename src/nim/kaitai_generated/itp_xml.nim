import kaitai_struct_nim_runtime
import options

type
  ItpXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[ItpXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ItpXml



##[
ITP XML format is a human-readable XML representation of ITP (Palette) binary files.
ITP files use GFF format (FileType "ITP " in GFF header).
Uses GFF XML structure with root element <gff3> containing <struct> elements.
Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).

References:
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/itp/itp.py
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
- https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/gff/itp.cpp
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
- https://github.com/OldRepublicDevs/PyKotor/wiki/ITP-File-Format.md
- https://github.com/xoreos/xoreos/tree/master/src/aurora/gff3file.cpp

]##
proc read*(_: typedesc[ItpXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ItpXml =
  template this: untyped = result
  this = new(ItpXml)
  let root = if root == nil: cast[ItpXml](this) else: cast[ItpXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[ItpXml], filename: string): ItpXml =
  ItpXml.read(newKaitaiFileStream(filename), nil, nil)

