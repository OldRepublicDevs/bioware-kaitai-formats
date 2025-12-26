import kaitai_struct_nim_runtime
import options

type
  TwodaJson* = ref object of KaitaiStruct
    `jsonContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[TwodaJson], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TwodaJson



##[
TwoDA JSON format is a human-readable JSON representation of TwoDA files.
Provides easier editing and interoperability with modern tools than binary TwoDA format.

References:
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py

]##
proc read*(_: typedesc[TwodaJson], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TwodaJson =
  template this: untyped = result
  this = new(TwodaJson)
  let root = if root == nil: cast[TwodaJson](this) else: cast[TwodaJson](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  JSON document content as UTF-8 text
  ]##
  let jsonContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.jsonContent = jsonContentExpr

proc fromFile*(_: typedesc[TwodaJson], filename: string): TwodaJson =
  TwodaJson.read(newKaitaiFileStream(filename), nil, nil)

