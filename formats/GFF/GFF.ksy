meta:
  id: gff
  title: BioWare GFF (Generic File Format) File
  license: MIT
  endian: le
  file-extension: gff
  xref:
    pykotor: Libraries/PyKotor/src/pykotor/resource/formats/gff/
    reone: vendor/reone/src/libs/resource/format/gffreader.cpp
    xoreos: vendor/xoreos/src/aurora/gff3file.cpp
    kotor_js: vendor/KotOR.js/src/resource/GFFObject.ts
    kotor_unity: vendor/KotOR-Unity/Assets/Scripts/FileObjects/GFFObject.cs
    kotor_net: vendor/Kotor.NET/Kotor.NET/Formats/KotorGFF/
    wiki: vendor/PyKotor/wiki/GFF-File-Format.md
    bioware_aurora: vendor/PyKotor/wiki/Bioware-Aurora-GFF.md
    torlack: vendor/xoreos-docs/specs/torlack/itp.html
    holopatcher: vendor/PyKotor/wiki/TSLPatcher-GFFList-Syntax.md
doc: |
  GFF (Generic File Format) is BioWare's universal container format for structured game data.
  It is used by many KotOR file types including UTC (creature), UTI (item), DLG (dialogue),
  ARE (area), GIT (game instance template), IFO (module info), and many others.

  GFF uses a hierarchical structure with structs containing fields, which can be simple values,
  nested structs, or lists of structs. The format supports version V3.2 (KotOR) and later
  versions (V3.3, V4.0, V4.1) used in other BioWare games.

  Binary Format Structure:
  - File Header (56 bytes): File type signature (FourCC), version, counts, and offsets to all
    data tables (structs, fields, labels, field_data, field_indices, list_indices)
  - Label Array: Array of 16-byte null-padded field name labels
  - Struct Array: Array of struct entries (12 bytes each) - struct_id, data_or_offset, field_count
  - Field Array: Array of field entries (12 bytes each) - field_type, label_index, data_or_offset
  - Field Data: Storage area for complex field types (strings, binary, vectors, etc.)
  - Field Indices Array: Array of field index arrays (used when structs have multiple fields)
  - List Indices Array: Array of list entry structures (count + struct indices)

  Field Types:
  - Simple types (0-5, 8): Stored inline in data_or_offset (uint8, int8, uint16, int16, uint32,
    int32, float)
  - Complex types (6-7, 9-13, 16-17): Offset to field_data section (uint64, int64, double, string,
    resref, localized_string, binary, vector4, vector3)
  - Struct (14): Struct index stored inline (nested struct)
  - List (15): Offset to list_indices_array (list of structs)

  Struct Access Pattern:
  1. Root struct is always at struct_array index 0
  2. If struct.field_count == 1: data_or_offset contains direct field index
  3. If struct.field_count > 1: data_or_offset contains offset into field_indices_array
  4. Use field_index to access field_array entry
  5. Use field.label_index to get field name from label_array
  6. Use field.data_or_offset based on field_type (inline, offset, struct index, list offset)

  References:
  - vendor/PyKotor/wiki/GFF-File-Format.md - Complete GFF format documentation
  - vendor/PyKotor/wiki/Bioware-Aurora-GFF.md - Official BioWare Aurora GFF specification
  - vendor/xoreos-docs/specs/torlack/itp.html - Tim Smith/Torlack's GFF/ITP documentation
  - vendor/reone/src/libs/resource/format/gffreader.cpp - Complete C++ GFF reader implementation
  - vendor/xoreos/src/aurora/gff3file.cpp - Generic Aurora GFF implementation (shared format)
  - vendor/KotOR.js/src/resource/GFFObject.ts - TypeScript GFF parser
  - vendor/KotOR-Unity/Assets/Scripts/FileObjects/GFFObject.cs - C# Unity GFF loader
  - vendor/Kotor.NET/Kotor.NET/Formats/KotorGFF/ - .NET GFF reader/writer
  - Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff.py - PyKotor binary reader/writer
  - Libraries/PyKotor/src/pykotor/resource/formats/gff/gff_data.py - GFF data model

seq:
  - id: header
    type: gff_header
    doc: GFF file header (56 bytes total)

  - id: label_array
    type: label_array
    if: header.label_count > 0
    pos: header.label_offset
    doc: Array of 16-byte null-padded field name labels

  - id: struct_array
    type: struct_array
    if: header.struct_count > 0
    pos: header.struct_offset
    doc: Array of struct entries (12 bytes each)

  - id: field_array
    type: field_array
    if: header.field_count > 0
    pos: header.field_offset
    doc: Array of field entries (12 bytes each)

  - id: field_data
    type: field_data
    if: header.field_data_count > 0
    pos: header.field_data_offset
    doc: Storage area for complex field types (strings, binary, vectors, etc.)

  - id: field_indices_array
    type: field_indices_array
    if: header.field_indices_count > 0
    pos: header.field_indices_offset
    doc: Array of field index arrays (used when structs have multiple fields)

  - id: list_indices_array
    type: list_indices_array
    if: header.list_indices_count > 0
    pos: header.list_indices_offset
    doc: Array of list entry structures (count + struct indices)

types:
  gff_header:
    seq:
      - id: file_type
        type: str
        encoding: ASCII
        size: 4
        doc: |
          File type signature (FourCC). Examples: "GFF ", "UTC ", "UTI ", "DLG ", "ARE ", etc.
          Must match a valid GFFContent enum value.

      - id: file_version
        type: str
        encoding: ASCII
        size: 4
        doc: |
          File format version. Must be "V3.2" for KotOR games.
          Later BioWare games use "V3.3", "V4.0", or "V4.1".
          Valid values: "V3.2" (KotOR), "V3.3", "V4.0", "V4.1" (other BioWare games)

      - id: struct_offset
        type: u4
        doc: Byte offset to struct array from beginning of file

      - id: struct_count
        type: u4
        doc: Number of struct entries in struct array

      - id: field_offset
        type: u4
        doc: Byte offset to field array from beginning of file

      - id: field_count
        type: u4
        doc: Number of field entries in field array

      - id: label_offset
        type: u4
        doc: Byte offset to label array from beginning of file

      - id: label_count
        type: u4
        doc: Number of labels in label array

      - id: field_data_offset
        type: u4
        doc: Byte offset to field data section from beginning of file

      - id: field_data_count
        type: u4
        doc: Size of field data section in bytes

      - id: field_indices_offset
        type: u4
        doc: Byte offset to field indices array from beginning of file

      - id: field_indices_count
        type: u4
        doc: Number of field indices (total count across all structs with multiple fields)

      - id: list_indices_offset
        type: u4
        doc: Byte offset to list indices array from beginning of file

      - id: list_indices_count
        type: u4
        doc: Number of list indices entries

  label_array:
    seq:
      - id: labels
        type: label_entry
        repeat: expr
        repeat-expr: _root.header.label_count
        doc: Array of label entries (16 bytes each)

  label_entry:
    seq:
      - id: name
        type: str
        encoding: ASCII
        size: 16
        doc: |
          Field name label (null-padded to 16 bytes, null-terminated).
          The actual label length is determined by the first null byte.
          Application code should trim trailing null bytes when using this field.

  struct_array:
    seq:
      - id: entries
        type: struct_entry
        repeat: expr
        repeat-expr: _root.header.struct_count
        doc: Array of struct entries (12 bytes each)

  struct_entry:
    seq:
      - id: struct_id
        type: s4
        doc: |
          Structure type identifier. Often 0xFFFFFFFF (-1) for generic structs.
          Used to identify struct types in schema-aware parsers.

      - id: data_or_offset
        type: u4
        doc: |
          Field index (if field_count == 1) or byte offset to field indices array (if field_count > 1).
          If field_count == 0, this value is unused.

      - id: field_count
        type: u4
        doc: |
          Number of fields in this struct:
          - 0: No fields
          - 1: Single field, data_or_offset contains the field index directly
          - >1: Multiple fields, data_or_offset contains byte offset into field_indices_array
    instances:
      has_single_field:
        value: field_count == 1
        doc: True if struct has exactly one field (direct field index in data_or_offset)
      has_multiple_fields:
        value: field_count > 1
        doc: True if struct has multiple fields (offset to field indices in data_or_offset)
      single_field_index:
        value: data_or_offset
        if: has_single_field
        doc: Direct field index when struct has exactly one field
      field_indices_offset:
        value: data_or_offset
        if: has_multiple_fields
        doc: Byte offset into field_indices_array when struct has multiple fields

  field_array:
    seq:
      - id: entries
        type: field_entry
        repeat: expr
        repeat-expr: _root.header.field_count
        doc: Array of field entries (12 bytes each)

  field_entry:
    seq:
      - id: field_type
        type: u4
        enum: gff_field_type
        doc: |
          Field data type (see gff_field_type enum):
          - 0-5, 8: Simple types (stored inline in data_or_offset)
          - 6-7, 9-13, 16-17: Complex types (offset to field_data in data_or_offset)
          - 14: Struct (struct index in data_or_offset)
          - 15: List (offset to list_indices_array in data_or_offset)

      - id: label_index
        type: u4
        doc: Index into label_array for field name

      - id: data_or_offset
        type: u4
        doc: |
          Inline data (simple types) or offset/index (complex types):
          - Simple types (0-5, 8): Value stored directly (1-4 bytes, sign/zero extended to 4 bytes)
          - Complex types (6-7, 9-13, 16-17): Byte offset into field_data section (relative to field_data_offset)
          - Struct (14): Struct index (index into struct_array)
          - List (15): Byte offset into list_indices_array (relative to list_indices_offset)
    instances:
      is_simple_type:
        value: (field_type.value >= 0 && field_type.value <= 5) || field_type.value == 8
        doc: True if field stores data inline (simple types)
      is_complex_type:
        value: (field_type.value >= 6 && field_type.value <= 13) || (field_type.value >= 16 && field_type.value <= 17)
        doc: True if field stores data in field_data section
      is_struct_type:
        value: field_type.value == 14
        doc: True if field is a nested struct
      is_list_type:
        value: field_type.value == 15
        doc: True if field is a list of structs
      field_data_offset_value:
        value: _root.header.field_data_offset + data_or_offset
        if: is_complex_type
        doc: Absolute file offset to field data for complex types
      struct_index_value:
        value: data_or_offset
        if: is_struct_type
        doc: Struct index for struct type fields
      list_indices_offset_value:
        value: _root.header.list_indices_offset + data_or_offset
        if: is_list_type
        doc: Absolute file offset to list indices for list type fields

  field_data:
    seq:
      - id: raw_data
        type: str
        size: _root.header.field_data_count
        doc: |
          Raw field data storage. Individual field data entries are accessed via
          field_entry.field_data_offset_value offsets. The structure of each entry
          depends on the field_type:
          - UInt64/Int64/Double: 8 bytes
          - String: 4-byte length + string bytes
          - ResRef: 1-byte length + string bytes (max 16)
          - LocalizedString: variable (see localized_string_data type)
          - Binary: 4-byte length + binary bytes
          - Vector3: 12 bytes (3×float)
          - Vector4: 16 bytes (4×float)

  field_indices_array:
    seq:
      - id: indices
        type: u4
        repeat: expr
        repeat-expr: _root.header.field_indices_count
        doc: |
          Array of field indices. When a struct has multiple fields, it stores an offset
          into this array, and the next N consecutive u4 values (where N = struct.field_count)
          are the field indices for that struct.

  list_indices_array:
    seq:
      - id: raw_data
        type: str
        size: _root.header.list_indices_count
        doc: |
          Raw list indices data. List entries are accessed via offsets stored in
          list-type field entries (field_entry.list_indices_offset_value).
          Each entry starts with a count (u4), followed by that many struct indices (u4 each).

          Note: This is a raw data block. In practice, list entries are accessed via
          offsets stored in list-type field entries, not as a sequential array.
          Use list_entry type to parse individual entries at specific offsets.


  list_entry:
    seq:
      - id: count
        type: u4
        doc: Number of struct indices in this list
      - id: struct_indices
        type: u4
        repeat: expr
        repeat-expr: count
        doc: Array of struct indices (indices into struct_array)

  localized_string_data:
    seq:
      - id: total_size
        type: u4
        doc: |
          Total size of this LocalizedString structure in bytes (not including this count).
          Used for skipping over the structure, but can be calculated from the data.

      - id: string_ref
        type: u4
        doc: |
          String reference ID (StrRef) into dialog.tlk file.
          Value 0xFFFFFFFF indicates no string reference (-1).

      - id: string_count
        type: u4
        doc: Number of language-specific string substrings

      - id: substrings
        type: localized_substring
        repeat: expr
        repeat-expr: string_count
        doc: Array of language-specific string substrings
    instances:
      string_ref_value:
        value: string_ref
        doc: |
          String reference value. Application code should convert 0xFFFFFFFF to -1.
          Note: Kaitai Struct expressions don't support ternary operators, so the conversion
          must be done in application code: if string_ref == 0xFFFFFFFF then -1 else string_ref

  localized_substring:
    seq:
      - id: string_id
        type: u4
        doc: |
          String ID encoding language and gender:
          - Bits 0-7: Gender (0 = Male, 1 = Female)
          - Bits 8-15: Language ID (see Language enum)
          - Bits 16-31: Reserved/unused

      - id: string_length
        type: u4
        doc: Length of string data in bytes

      - id: string_data
        type: str
        size: string_length
        encoding: UTF-8
        doc: |
          String data (encoding depends on language, but UTF-8 is common).
          Trailing null bytes should be trimmed.
    instances:
      language_id:
        value: (string_id >> 8) & 0xFF
        doc: Language ID (extracted from string_id)
      gender_id:
        value: string_id & 0xFF
        doc: Gender ID (0 = Male, 1 = Female)

enums:
  gff_field_type:
    0: uint8
    1: int8
    2: uint16
    3: int16
    4: uint32
    5: int32
    6: uint64
    7: int64
    8: single
    9: double
    10: string
    11: resref
    12: localized_string
    13: binary
    14: struct
    15: list
    16: vector4
    17: vector3

