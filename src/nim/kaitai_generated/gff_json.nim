import kaitai_struct_nim_runtime
import options

type
  GffJson* = ref object of KaitaiStruct
    `jsonContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[GffJson], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GffJson



##[
GFF JSON format is a human-readable JSON representation of GFF (Generic File Format) binary files.
Provides easier editing and interoperability with modern tools than binary GFF format.

References:
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py

]##
proc read*(_: typedesc[GffJson], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GffJson =
  template this: untyped = result
  this = new(GffJson)
  let root = if root == nil: cast[GffJson](this) else: cast[GffJson](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  JSON document content as UTF-8 text
  ]##
  let jsonContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.jsonContent = jsonContentExpr

proc fromFile*(_: typedesc[GffJson], filename: string): GffJson =
  GffJson.read(newKaitaiFileStream(filename), nil, nil)

