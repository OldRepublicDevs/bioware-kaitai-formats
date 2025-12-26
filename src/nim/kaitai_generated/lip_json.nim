import kaitai_struct_nim_runtime
import options

type
  LipJson* = ref object of KaitaiStruct
    `jsonContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[LipJson], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): LipJson



##[
LIP JSON format is a human-readable JSON representation of LIP (Lipsync) binary files.
Provides easier editing than binary LIP format.

References:
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/io_lip_xml.py

]##
proc read*(_: typedesc[LipJson], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): LipJson =
  template this: untyped = result
  this = new(LipJson)
  let root = if root == nil: cast[LipJson](this) else: cast[LipJson](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  JSON document content as UTF-8 text
  ]##
  let jsonContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.jsonContent = jsonContentExpr

proc fromFile*(_: typedesc[LipJson], filename: string): LipJson =
  LipJson.read(newKaitaiFileStream(filename), nil, nil)

