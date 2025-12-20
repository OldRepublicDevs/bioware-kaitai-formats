meta:
  id: utc
  title: BioWare UTC (Creature Template) File
  license: MIT
  endian: le
  file-extension: utc
  xref:
    pykotor: Libraries/PyKotor/src/pykotor/resource/generics/utc.py
    reone: vendor/reone/src/libs/resource/parser/gff/utc.cpp
    xoreos: vendor/xoreos/src/aurora/gff3file.cpp
doc: |
  UTC (Creature Template) files are GFF-based format files that store creature definitions
  including stats, appearance, inventory, feats, and script hooks. UTC files are used to
  define NPCs, party members, enemies, and the player character in Knights of the Old Republic.

  UTC files follow the standard GFF (Generic File Format) structure with file type signature
  "UTC " and contain a hierarchical structure of structs and fields defining creature properties.

  The root struct (struct index 0) contains all creature data fields including:
  - Core identity: TemplateResRef, Tag, FirstName, LastName, Comment
  - Appearance: Appearance_Type, PortraitId, Gender, Race, BodyVariation, TextureVar
  - Stats: Str, Dex, Con, Int, Wis, Cha, HitPoints, MaxHitPoints, ForcePoints
  - Classes: ClassList (list of class structs with levels and powers)
  - Feats: FeatList (list of feat identifiers)
  - Skills: SkillList (list of skill ranks)
  - Inventory: ItemList (list of inventory items)
  - Equipment: Equip_ItemList (list of equipped items with slots)
  - Scripts: ScriptAttacked, ScriptDamaged, ScriptDeath, ScriptHeartbeat, etc.

  References:
  - vendor/PyKotor/wiki/Bioware-Aurora-Creature.md - Complete UTC/Creature format documentation
  - vendor/PyKotor/Libraries/PyKotor/src/pykotor/resource/generics/utc.py - PyKotor UTC parser
  - vendor/reone/src/libs/resource/parser/gff/utc.cpp - Complete C++ UTC parser implementation
  - vendor/reone/include/reone/resource/parser/gff/utc.h - UTC parser header
  - vendor/xoreos/src/aurora/gff3file.cpp - Generic Aurora GFF implementation
  - Libraries/PyKotor/src/pykotor/resource/formats/gff/ - GFF format implementation (UTC uses GFF)

seq:
  - id: header
    type: gff_header
    doc: GFF file header (56 bytes total). Must have file_type "UTC ".

  - id: label_array
    type: label_array
    if: header.label_count > 0
    pos: header.label_offset
    doc: Array of 16-byte null-padded field name labels

  - id: struct_array
    type: struct_array
    if: header.struct_count > 0
    pos: header.struct_offset
    doc: Array of struct entries (12 bytes each). Struct 0 is the root UTC struct.

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
          File type signature. Must be "UTC " for UTC (Creature Template) files.
          This is a space-padded FourCC identifier.
        valid: "UTC "

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
    instances:
      name_trimmed:
        value: name.rstrip('\x00')
        doc: Label name with trailing nulls removed

  struct_array:
    seq:
      - id: entries
        type: struct_entry
        repeat: expr
        repeat-expr: _root.header.struct_count
        doc: Array of struct entries (12 bytes each). Entry 0 is the root UTC struct.

  struct_entry:
    seq:
      - id: struct_id
        type: s4
        doc: |
          Structure type identifier. Often 0xFFFFFFFF (-1) for generic structs.
          For UTC files:
          - Root struct (index 0): Typically 0xFFFFFFFF (-1)
          - ClassList entries: Struct ID 2
          - FeatList entries: Struct ID 1
          - ItemList entries: Struct ID varies (usually 0)
          - Equip_ItemList entries: Struct ID is the equipment slot (e.g., 0x00001 for Head)
          - SkillList entries: Struct ID 0
          - KnownList0 entries (powers): Struct ID 3

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
      label:
        pos: _root.label_offset + (label_index * 16)
        type: label_entry
        doc: Reference to the label entry for this field
      label_name:
        value: label.name_trimmed
        doc: Field name string (convenience accessor)
      is_simple_type:
        value: field_type.value >= 0 && field_type.value <= 5 || field_type.value == 8
        doc: True if field stores data inline (simple types)
      is_complex_type:
        value: field_type.value >= 6 && field_type.value <= 13 || field_type.value >= 16 && field_type.value <= 17
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
      - id: entries
        type: list_entry
        repeat: until
        repeat-until: _io.pos >= (_root.header.list_indices_offset + _root.header.list_indices_count * 4)
        doc: |
          Array of list entries. Each entry starts with a count, followed by that many struct indices.
          Entries are accessed via field_entry.list_indices_offset_value offsets.
    doc: |
      Note: This is a simplified representation. In practice, list entries are accessed
      via offsets stored in list-type field entries, not as a sequential array.

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

  # UTC-specific field data types (used when accessing field_data section)

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

  resref_data:
    seq:
      - id: length
        type: u1
        doc: Length of ResRef string (max 16 characters)
      - id: data
        type: str
        size: length
        encoding: ASCII
        doc: ResRef string data (ASCII, null-padded to 16 bytes in some contexts)

  string_data:
    seq:
      - id: length
        type: u4
        doc: Length of string in bytes
      - id: data
        type: str
        size: length
        encoding: ASCII
        doc: String data (ASCII, null-terminated)

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


