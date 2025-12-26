import kaitai_struct_nim_runtime
import options

type
  LipXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[LipXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): LipXml



##[
LIP XML format is a human-readable XML representation of LIP (Lipsync) binary files.
Provides easier editing than binary LIP format.

References:
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/lip.py
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/io_lip_xml.py
- https://github.com/seedhartha/reone/tree/master/src/libs/graphics/format/lipreader.cpp
- https://github.com/OldRepublicDevs/PyKotor/wiki/LIP-File-Format.md
- https://github.com/xoreos/xoreos/tree/master/src/graphics/aurora/lipfile.cpp

- ../GFF/GFF
- ../GFF/XML/GFF_XML
- ../LIP/LIP

]##
proc read*(_: typedesc[LipXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): LipXml =
  template this: untyped = result
  this = new(LipXml)
  let root = if root == nil: cast[LipXml](this) else: cast[LipXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[LipXml], filename: string): LipXml =
  LipXml.read(newKaitaiFileStream(filename), nil, nil)

