import kaitai_struct_nim_runtime
import options

type
  ResXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[ResXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ResXml



##[
RES XML format is a human-readable XML representation of RES (Save Data) binary files.
Uses GFF XML structure with root element <gff3> containing <struct> elements.
Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).

References:
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py

]##
proc read*(_: typedesc[ResXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ResXml =
  template this: untyped = result
  this = new(ResXml)
  let root = if root == nil: cast[ResXml](this) else: cast[ResXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[ResXml], filename: string): ResXml =
  ResXml.read(newKaitaiFileStream(filename), nil, nil)

