import kaitai_struct_nim_runtime
import options

type
  Twoda* = ref object of KaitaiStruct
    `header`*: Twoda_TwodaHeader
    `columnHeadersRaw`*: string
    `rowCount`*: uint32
    `rowLabelsSection`*: Twoda_RowLabelsSection
    `cellOffsetsArray`*: Twoda_CellOffsetsArray
    `lenCellValuesSection`*: uint16
    `cellValuesSection`*: Twoda_CellValuesSection
    `parent`*: KaitaiStruct
    `rawCellValuesSection`*: seq[byte]
  Twoda_CellOffsetsArray* = ref object of KaitaiStruct
    `offsets`*: seq[uint16]
    `parent`*: Twoda
  Twoda_CellValuesSection* = ref object of KaitaiStruct
    `rawData`*: string
    `parent`*: Twoda
  Twoda_RowLabelEntry* = ref object of KaitaiStruct
    `labelValue`*: string
    `parent`*: Twoda_RowLabelsSection
  Twoda_RowLabelsSection* = ref object of KaitaiStruct
    `labels`*: seq[Twoda_RowLabelEntry]
    `parent`*: Twoda
  Twoda_TwodaHeader* = ref object of KaitaiStruct
    `magic`*: string
    `version`*: string
    `newline`*: uint8
    `parent`*: Twoda
    `isValidTwodaInst`: bool
    `isValidTwodaInstFlag`: bool

proc read*(_: typedesc[Twoda], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Twoda
proc read*(_: typedesc[Twoda_CellOffsetsArray], io: KaitaiStream, root: KaitaiStruct, parent: Twoda): Twoda_CellOffsetsArray
proc read*(_: typedesc[Twoda_CellValuesSection], io: KaitaiStream, root: KaitaiStruct, parent: Twoda): Twoda_CellValuesSection
proc read*(_: typedesc[Twoda_RowLabelEntry], io: KaitaiStream, root: KaitaiStruct, parent: Twoda_RowLabelsSection): Twoda_RowLabelEntry
proc read*(_: typedesc[Twoda_RowLabelsSection], io: KaitaiStream, root: KaitaiStruct, parent: Twoda): Twoda_RowLabelsSection
proc read*(_: typedesc[Twoda_TwodaHeader], io: KaitaiStream, root: KaitaiStruct, parent: Twoda): Twoda_TwodaHeader

proc isValidTwoda*(this: Twoda_TwodaHeader): bool


##[
TwoDA (2D Array) files store tabular data in a binary format used by BioWare games
including Knights of the Old Republic (KotOR) and The Sith Lords (TSL).

TwoDA files are essentially two-dimensional arrays (tables) with:
- Column headers (first row defines column names)
- Row labels (first column defines row identifiers)
- Cell values (data at row/column intersections)

Binary Format Structure:
- File Header (9 bytes): Magic "2DA " (space-padded), version "V2.b", and newline
- Column Headers Section: Tab-separated column names, terminated by null byte
- Row Count (4 bytes): uint32 indicating number of data rows
- Row Labels Section: Tab-separated row labels (one per row)
- Cell Offsets Array: Array of uint16 offsets (rowCount * columnCount entries)
- Data Size (2 bytes): uint16 indicating total size of cell data section
- Cell Values Section: Null-terminated strings at offsets specified in offsets array

The format uses an offset-based string table for cell values, allowing efficient
storage of duplicate values (shared strings are stored once and referenced by offset).

References:
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/twoda_data.py

]##
proc read*(_: typedesc[Twoda], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Twoda =
  template this: untyped = result
  this = new(Twoda)
  let root = if root == nil: cast[Twoda](this) else: cast[Twoda](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  TwoDA file header (9 bytes) - magic "2DA ", version "V2.b", and newline character
  ]##
  let headerExpr = Twoda_TwodaHeader.read(this.io, this.root, this)
  this.header = headerExpr

  ##[
  Column headers section as a single null-terminated string.
Contains tab-separated column names. The null terminator marks the end.
Column names can be extracted by splitting on tab characters (0x09).
Example: "col1\tcol2\tcol3\0" represents three columns: "col1", "col2", "col3"

  ]##
  let columnHeadersRawExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.columnHeadersRaw = columnHeadersRawExpr

  ##[
  Number of data rows in the TwoDA table.
This count determines how many row labels and how many cell entries per column.

  ]##
  let rowCountExpr = this.io.readU4le()
  this.rowCount = rowCountExpr

  ##[
  Row labels section - tab-separated row labels (one per row)
  ]##
  let rowLabelsSectionExpr = Twoda_RowLabelsSection.read(this.io, this.root, this)
  this.rowLabelsSection = rowLabelsSectionExpr

  ##[
  Array of cell value offsets (uint16 per cell).
Total entries = row_count * column_count (where column_count = number of tab-separated parts in column_headers_raw).
Each offset points to a null-terminated string in the cell values section.

  ]##
  let cellOffsetsArrayExpr = Twoda_CellOffsetsArray.read(this.io, this.root, this)
  this.cellOffsetsArray = cellOffsetsArrayExpr

  ##[
  Total size in bytes of the cell values data section.
This is the size of all unique cell value strings combined (including null terminators).
Not used during reading but stored for format consistency.

  ]##
  let lenCellValuesSectionExpr = this.io.readU2le()
  this.lenCellValuesSection = lenCellValuesSectionExpr

  ##[
  Cell values data section containing all unique cell value strings.
Each string is null-terminated. Offsets from cell_offsets_array point into this section.
The section starts immediately after len_cell_values_section field and has size = len_cell_values_section bytes.

  ]##
  let rawCellValuesSectionExpr = this.io.readBytes(int(this.lenCellValuesSection))
  this.rawCellValuesSection = rawCellValuesSectionExpr
  let rawCellValuesSectionIo = newKaitaiStream(rawCellValuesSectionExpr)
  let cellValuesSectionExpr = Twoda_CellValuesSection.read(rawCellValuesSectionIo, this.root, this)
  this.cellValuesSection = cellValuesSectionExpr

proc fromFile*(_: typedesc[Twoda], filename: string): Twoda =
  Twoda.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Twoda_CellOffsetsArray], io: KaitaiStream, root: KaitaiStruct, parent: Twoda): Twoda_CellOffsetsArray =
  template this: untyped = result
  this = new(Twoda_CellOffsetsArray)
  let root = if root == nil: cast[Twoda](this) else: cast[Twoda](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Array of cell value offsets (uint16, little-endian).
Each offset points to a null-terminated string in the cell_values_section.
Offsets are relative to the start of cell_values_section.

Reading continues until we reach 2 bytes before end of file (where len_cell_values_section field is).
Then len_cell_values_section is read, followed by cell_values_section.

The actual count is: row_count * column_count
where column_count = number of tab-separated parts in column_headers_raw.

Cell access pattern:
- Cell at row i, column j = offsets[i * column_count + j]
- Value = read string at cell_values_section start + offsets[i * column_count + j]

Duplicate cell values share the same offset (string deduplication).

  ]##
  block:
    var i: int
    while true:
      let it = this.io.readU2le()
      this.offsets.add(it)
      if this.io.pos >= this.io.size - 2:
        break
      inc i

proc fromFile*(_: typedesc[Twoda_CellOffsetsArray], filename: string): Twoda_CellOffsetsArray =
  Twoda_CellOffsetsArray.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Twoda_CellValuesSection], io: KaitaiStream, root: KaitaiStruct, parent: Twoda): Twoda_CellValuesSection =
  template this: untyped = result
  this = new(Twoda_CellValuesSection)
  let root = if root == nil: cast[Twoda](this) else: cast[Twoda](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Raw cell values data as a single string.
Contains all null-terminated cell value strings concatenated together.
Individual strings can be extracted using offsets from cell_offsets_array.
Note: To read a specific cell value, seek to (cell_values_section start + offset) and read a null-terminated string.

  ]##
  let rawDataExpr = encode(this.io.readBytes(int(Twoda(this.root).lenCellValuesSection)), "ASCII")
  this.rawData = rawDataExpr

proc fromFile*(_: typedesc[Twoda_CellValuesSection], filename: string): Twoda_CellValuesSection =
  Twoda_CellValuesSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Twoda_RowLabelEntry], io: KaitaiStream, root: KaitaiStruct, parent: Twoda_RowLabelsSection): Twoda_RowLabelEntry =
  template this: untyped = result
  this = new(Twoda_RowLabelEntry)
  let root = if root == nil: cast[Twoda](this) else: cast[Twoda](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Row label value (ASCII string terminated by tab character 0x09).
Tab terminator is consumed but not included in the string value.
Row labels uniquely identify each row in the table.
Often numeric (e.g., "0", "1", "2") but can be any string identifier.

  ]##
  let labelValueExpr = encode(this.io.readBytesTerm(9, false, true, false), "ASCII")
  this.labelValue = labelValueExpr

proc fromFile*(_: typedesc[Twoda_RowLabelEntry], filename: string): Twoda_RowLabelEntry =
  Twoda_RowLabelEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Twoda_RowLabelsSection], io: KaitaiStream, root: KaitaiStruct, parent: Twoda): Twoda_RowLabelsSection =
  template this: untyped = result
  this = new(Twoda_RowLabelsSection)
  let root = if root == nil: cast[Twoda](this) else: cast[Twoda](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Array of row label entries, one per row.
Each label is terminated by tab character (0x09).
Total count equals row_count from the header.
Row labels typically identify each data row (e.g., numeric IDs, names, etc.).

  ]##
  for i in 0 ..< int(Twoda(this.root).rowCount):
    let it = Twoda_RowLabelEntry.read(this.io, this.root, this)
    this.labels.add(it)

proc fromFile*(_: typedesc[Twoda_RowLabelsSection], filename: string): Twoda_RowLabelsSection =
  Twoda_RowLabelsSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Twoda_TwodaHeader], io: KaitaiStream, root: KaitaiStruct, parent: Twoda): Twoda_TwodaHeader =
  template this: untyped = result
  this = new(Twoda_TwodaHeader)
  let root = if root == nil: cast[Twoda](this) else: cast[Twoda](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  File type signature. Must be "2DA " (space-padded).
Bytes: 0x32 0x44 0x41 0x20
The space after "2DA" is significant and must be present.

  ]##
  let magicExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.magic = magicExpr

  ##[
  File format version. Always "V2.b" for KotOR/TSL TwoDA files.
Bytes: 0x56 0x32 0x2E 0x62
This is the binary version identifier (V2.b = Version 2 binary).

  ]##
  let versionExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.version = versionExpr

  ##[
  Newline character (0x0A = '\n').
Separates header from column headers section.

  ]##
  let newlineExpr = this.io.readU1()
  this.newline = newlineExpr

proc isValidTwoda(this: Twoda_TwodaHeader): bool = 

  ##[
  Validation check that the file is a valid TwoDA file.
All header fields must match expected values.

  ]##
  if this.isValidTwodaInstFlag:
    return this.isValidTwodaInst
  let isValidTwodaInstExpr = bool( ((this.magic == "2DA ") and (this.version == "V2.b") and (this.newline == 10)) )
  this.isValidTwodaInst = isValidTwodaInstExpr
  this.isValidTwodaInstFlag = true
  return this.isValidTwodaInst

proc fromFile*(_: typedesc[Twoda_TwodaHeader], filename: string): Twoda_TwodaHeader =
  Twoda_TwodaHeader.read(newKaitaiFileStream(filename), nil, nil)

