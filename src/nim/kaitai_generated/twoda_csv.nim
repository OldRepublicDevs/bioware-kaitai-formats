import kaitai_struct_nim_runtime
import options

type
  TwodaCsv* = ref object of KaitaiStruct
    `csvContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[TwodaCsv], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TwodaCsv



##[
TwoDA CSV format is a human-readable CSV (Comma-Separated Values) representation of TwoDA files.
Provides easier editing in spreadsheet applications than binary TwoDA format.

Each row represents a data row, with the first row containing column headers.

References:
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py

]##
proc read*(_: typedesc[TwodaCsv], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TwodaCsv =
  template this: untyped = result
  this = new(TwodaCsv)
  let root = if root == nil: cast[TwodaCsv](this) else: cast[TwodaCsv](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  CSV text content with rows separated by newlines and columns by commas
  ]##
  let csvContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.csvContent = csvContentExpr

proc fromFile*(_: typedesc[TwodaCsv], filename: string): TwodaCsv =
  TwodaCsv.read(newKaitaiFileStream(filename), nil, nil)

