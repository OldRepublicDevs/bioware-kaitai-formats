import kaitai_struct_nim_runtime
import options

type
  GffXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[GffXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GffXml



##[
GFF XML format is a human-readable XML representation of GFF (Generic File Format) binary files.
Used by xoreos-tools and other modding tools for easier editing than binary GFF format.

The XML format represents the hierarchical GFF structure using XML elements:
- Root element: <gff3>
- Contains a <struct> element with id attribute
- Struct contains field elements (byte, uint32, exostring, locstring, resref, list, etc.)
- Each field has a label attribute
- Lists contain nested <struct> elements

References:
- https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
- https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffdumper.cpp
- https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffcreator.cpp

]##
proc read*(_: typedesc[GffXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GffXml =
  template this: untyped = result
  this = new(GffXml)
  let root = if root == nil: cast[GffXml](this) else: cast[GffXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text.
Structure: <gff3><struct id="...">...</struct></gff3>
Note: Kaitai Struct has limited XML parsing capabilities. For full XML parsing,
use an XML parser library. This definition serves as a format identifier.

  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[GffXml], filename: string): GffXml =
  GffXml.read(newKaitaiFileStream(filename), nil, nil)

