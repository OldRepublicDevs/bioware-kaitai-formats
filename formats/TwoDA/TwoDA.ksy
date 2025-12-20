meta:
  id: twoda
  title: BioWare TwoDA (2D Array) File Format
  license: MIT
  endian: le
  file-extension:
    - 2da
  xref:
    pykotor: vendor/PyKotor/Libraries/PyKotor/src/pykotor/resource/formats/twoda/
    reone: vendor/reone/src/libs/resource/format/2dareader.cpp
    xoreos: vendor/xoreos/src/aurora/2dafile.cpp
    kotor_js: vendor/KotOR.js/src/resource/TwoDAObject.ts
    kotor_unity: vendor/KotOR-Unity/Assets/Scripts/FileObjects/2DAObject.cs
    kotor_net: vendor/Kotor.NET/Kotor.NET/Formats/Kotor2DA/
    tslpatcher: vendor/TSLPatcher/lib/site/Bioware/TwoDA.pm
    holopatcher: vendor/PyKotor/wiki/TSLPatcher-2DAList-Syntax.md
    wiki: vendor/PyKotor/wiki/2DA-File-Format.md
    bioware_aurora: vendor/PyKotor/wiki/Bioware-Aurora-2DA.md
doc: |
  TwoDA (2D Array) files store tabular game data in a compact format used by the KotOR game engine.
  Files use version "V2.b" and have the .2da extension. TwoDA files store tabular data in a binary
  format used by BioWare games including Knights of the Old Republic (KotOR) and The Sith Lords (TSL).

  TwoDA files are essentially two-dimensional arrays (tables) with:
  - Column headers (first row defines column names)
  - Row labels (first column defines row identifiers)
  - Cell values (data at row/column intersections)

  Binary Format Structure:
  - File Header (9 bytes): Magic "2DA " (space-padded) or "2DA\t" (tab-padded), version "V2.b",
    and newline character (0x0A)
  - Column Headers Section: Tab-separated column names, terminated by null byte. Each column name
    is terminated by a tab character (0x09). The entire header list is terminated by a null byte (0x00)
  - Row Count (4 bytes): uint32 indicating number of data rows (little-endian)
  - Row Labels Section: Tab-separated row labels (one per row). Each row label is read as a
    tab-terminated string. Row labels are usually numeric ("0", "1", "2"...) but can be arbitrary
    strings. The row label list is NOT terminated by a null byte - the reader must consume exactly
    row_count labels based on the count field
  - Cell Offsets Array: Array of uint16 offsets (rowCount * columnCount entries, little-endian).
    Each cell has a 16-bit unsigned integer offset pointing to its string value in the cell data
    string table. Offsets are stored in row-major order (all cells of row 0, then all cells of row 1, etc.)
  - Data Size (2 bytes): uint16 indicating total size of cell data section (little-endian)
  - Cell Values Section: Null-terminated strings at offsets specified in offsets array. The cell
    data string table begins immediately after the cell_data_size field. Each string is null-terminated
    (0x00). Blank or empty cells are typically stored as empty strings (immediately null-terminated)
    or the string "****". The string table is deduplicated - multiple cells with the same value
    share the same offset, reducing file size

  The format uses an offset-based string table for cell values, allowing efficient storage of
  duplicate values (shared strings are stored once and referenced by offset).

  Cell Value Types:
  All cell values are stored as strings in the 2DA file, but are interpreted as different types
  by the game engine:
  - Integers: Numeric strings parsed as int32 - used for numeric identifiers, counts, and enumerated values
  - Floats: Decimal strings parsed as float - used for calculations like damage multipliers, timers, percentages
  - ResRefs: Resource references (max 16 characters, no extension) - point to other game resources
    like models, textures, or scripts
  - StrRefs: String references into dialog.tlk (typically negative values like -1 indicate no reference) -
    used for localized text display
  - Boolean: "0" or "1" (sometimes "TRUE"/"FALSE") - control feature flags and settings
  - Empty Cells: Represented as "****" - treated as null/undefined by the engine

  The game engine parses cell values based on context and expected data type for each column.

  References:
  - vendor/PyKotor/wiki/2DA-File-Format.md - Complete KotOR 2DA format documentation
  - vendor/PyKotor/wiki/Bioware-Aurora-2DA.md - Official BioWare Aurora 2DA format specification
  - vendor/reone/src/libs/resource/format/2dareader.cpp:29-32 - KotOR-specific header validation
  - vendor/xoreos/src/aurora/2dafile.cpp:48-51 - Generic Aurora engine header constants
  - vendor/KotOR-Unity/Assets/Scripts/FileObjects/2DAObject.cs:25-32 - KotOR-specific header reading
  - vendor/KotOR.js/src/resource/TwoDAObject.ts:69-145 - TypeScript 2DA parser with memory-efficient caching
  - vendor/Kotor.NET/Kotor.NET/Formats/Kotor2DA/Kotor2DA.cs - .NET 2DA reader/writer
  - vendor/TSLPatcher/lib/site/Bioware/TwoDA.pm - TSLPatcher Perl 2DA implementation
  - Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py:12-106 - PyKotor binary reader
  - Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py:109-174 - PyKotor binary writer
  - Libraries/PyKotor/src/pykotor/resource/formats/twoda/twoda_data.py:77-119 - TwoDA class implementation

seq:
  - id: header
    type: twoda_header
    doc: TwoDA file header (9 bytes) - magic "2DA ", version "V2.b", and newline character

  - id: column_headers_raw
    type: strz
    encoding: ASCII
    doc: |
      Column headers section as a single null-terminated string.
      Contains tab-separated column names. The null terminator marks the end.
      Column names can be extracted by splitting on tab characters (0x09).
      Example: "col1\tcol2\tcol3\0" represents three columns: "col1", "col2", "col3"

  - id: row_count
    type: u4
    doc: |
      Number of data rows in the TwoDA table.
      This count determines how many row labels and how many cell entries per column.

  - id: row_labels_section
    type: row_labels_section
    doc: Row labels section - tab-separated row labels (one per row)

  - id: cell_offsets_array
    type: cell_offsets_array
    doc: |
      Array of cell value offsets (uint16 per cell).
      Total entries = row_count * column_count (where column_count = number of tab-separated parts in column_headers_raw).
      Each offset points to a null-terminated string in the cell values section.

  - id: len_cell_values_section
    type: u2
    doc: |
      Total size in bytes of the cell values data section.
      This is the size of all unique cell value strings combined (including null terminators).
      Not used during reading but stored for format consistency.

  - id: cell_values_section
    type: cell_values_section
    size: len_cell_values_section
    doc: |
      Cell values data section containing all unique cell value strings.
      Each string is null-terminated. Offsets from cell_offsets_array point into this section.
      The section starts immediately after len_cell_values_section field and has size = len_cell_values_section bytes.

types:
  twoda_header:
    seq:
      - id: magic
        type: str
        encoding: ASCII
        size: 4
        doc: |
          File type signature. Must be "2DA " (space-padded).
          Bytes: 0x32 0x44 0x41 0x20
          The space after "2DA" is significant and must be present.

      - id: version
        type: str
        encoding: ASCII
        size: 4
        doc: |
          File format version. Always "V2.b" for KotOR/TSL TwoDA files.
          Bytes: 0x56 0x32 0x2E 0x62
          This is the binary version identifier (V2.b = Version 2 binary).

      - id: newline
        type: u1
        doc: |
          Newline character (0x0A = '\n').
          Separates header from column headers section.

    instances:
      is_valid_twoda:
        value: magic == "2DA " and version == "V2.b" and newline == 0x0A
        doc: |
          Validation check that the file is a valid TwoDA file.
          All header fields must match expected values.

  row_labels_section:
    seq:
      - id: labels
        type: row_label_entry
        repeat: expr
        repeat-expr: _root.row_count
        doc: |
          Array of row label entries, one per row.
          Each label is terminated by tab character (0x09).
          Total count equals row_count from the header.
          Row labels typically identify each data row (e.g., numeric IDs, names, etc.).

  row_label_entry:
    seq:
      - id: label_value
        type: str
        encoding: ASCII
        terminator: 0x09
        include: false
        consume: true
        eos-error: false
        doc: |
          Row label value (ASCII string terminated by tab character 0x09).
          Tab terminator is consumed but not included in the string value.
          Row labels uniquely identify each row in the table.
          Often numeric (e.g., "0", "1", "2") but can be any string identifier.

  cell_offsets_array:
    seq:
      - id: offsets
        type: u2
        repeat: until
        repeat-until: _io.pos >= _io.size - 2
        doc: |
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

  cell_values_section:
    seq:
      - id: raw_data
        type: str
        encoding: ASCII
        size: _root.len_cell_values_section
        doc: |
          Raw cell values data as a single string.
          Contains all null-terminated cell value strings concatenated together.
          Individual strings can be extracted using offsets from cell_offsets_array.
          Note: To read a specific cell value, seek to (cell_values_section start + offset) and read a null-terminated string.
