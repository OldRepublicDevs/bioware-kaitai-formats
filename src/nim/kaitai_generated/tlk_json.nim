import kaitai_struct_nim_runtime
import options

type
  TlkJson* = ref object of KaitaiStruct
    `jsonContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[TlkJson], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TlkJson



##[
TLK JSON format is a human-readable JSON representation of TLK (Talk Table) binary files.
Provides easier editing and translation than binary TLK format.

References:
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/io_tlk_xml.py

]##
proc read*(_: typedesc[TlkJson], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TlkJson =
  template this: untyped = result
  this = new(TlkJson)
  let root = if root == nil: cast[TlkJson](this) else: cast[TlkJson](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  JSON document content as UTF-8 text
  ]##
  let jsonContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.jsonContent = jsonContentExpr

proc fromFile*(_: typedesc[TlkJson], filename: string): TlkJson =
  TlkJson.read(newKaitaiFileStream(filename), nil, nil)

