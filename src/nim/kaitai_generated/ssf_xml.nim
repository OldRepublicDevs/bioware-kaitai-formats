import kaitai_struct_nim_runtime
import options

type
  SsfXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[SsfXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SsfXml



##[
SSF XML format is a human-readable XML representation of SSF (Soundset) binary files.
Provides easier editing than binary SSF format.

References:
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf.py
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/io_ssf_xml.py
- https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/ssf.cpp
- https://github.com/OldRepublicDevs/PyKotor/wiki/SSF-File-Format.md
- https://github.com/xoreos/xoreos/tree/master/src/aurora/ssffile.cpp

]##
proc read*(_: typedesc[SsfXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SsfXml =
  template this: untyped = result
  this = new(SsfXml)
  let root = if root == nil: cast[SsfXml](this) else: cast[SsfXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[SsfXml], filename: string): SsfXml =
  SsfXml.read(newKaitaiFileStream(filename), nil, nil)

