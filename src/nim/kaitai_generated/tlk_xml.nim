import kaitai_struct_nim_runtime
import options

type
  TlkXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[TlkXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TlkXml



##[
TLK XML format is a human-readable XML representation of TLK (Talk Table) binary files.
Provides easier editing and translation than binary TLK format.

References:
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/tlk.py
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/io_tlk_xml.py
- https://github.com/seedhartha/reone/tree/master/src/libs/resource/format/tlkreader.cpp
- https://github.com/OldRepublicDevs/PyKotor/wiki/TLK-File-Format.md
- https://github.com/xoreos/xoreos/tree/master/src/aurora/talktable.cpp

- ../GFF/GFF
- ../GFF/XML/GFF_XML
- ../TLK/TLK

]##
proc read*(_: typedesc[TlkXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TlkXml =
  template this: untyped = result
  this = new(TlkXml)
  let root = if root == nil: cast[TlkXml](this) else: cast[TlkXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[TlkXml], filename: string): TlkXml =
  TlkXml.read(newKaitaiFileStream(filename), nil, nil)

