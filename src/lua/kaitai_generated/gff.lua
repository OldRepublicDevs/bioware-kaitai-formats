-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("bioware_common")
local enum = require("enum")
local str_decode = require("string_decode")

-- 
-- GFF (Generic File Format) is BioWare's universal container format for structured game data.
-- It is used by many KotOR file types including UTC (creature), UTI (item), DLG (dialogue),
-- ARE (area), GIT (game instance template), IFO (module info), and many others.
-- 
-- GFF uses a hierarchical structure with structs containing fields, which can be simple values,
-- nested structs, or lists of structs. The format supports version V3.2 (KotOR) and later
-- versions (V3.3, V4.0, V4.1) used in other BioWare games.
-- 
-- Binary Format Structure:
-- - File Header (56 bytes): File type signature (FourCC), version, counts, and offsets to all
--   data tables (structs, fields, labels, field_data, field_indices, list_indices)
-- - Label Array: Array of 16-byte null-padded field name labels
-- - Struct Array: Array of struct entries (12 bytes each) - struct_id, data_or_offset, field_count
-- - Field Array: Array of field entries (12 bytes each) - field_type, label_index, data_or_offset
-- - Field Data: Storage area for complex field types (strings, binary, vectors, etc.)
-- - Field Indices Array: Array of field index arrays (used when structs have multiple fields)
-- - List Indices Array: Array of list entry structures (count + struct indices)
-- 
-- Field Types:
-- - Simple types (0-5, 8): Stored inline in data_or_offset (uint8, int8, uint16, int16, uint32,
--   int32, float)
-- - Complex types (6-7, 9-13, 16-17): Offset to field_data section (uint64, int64, double, string,
--   resref, localized_string, binary, vector4, vector3)
-- - Struct (14): Struct index stored inline (nested struct)
-- - List (15): Offset to list_indices_array (list of structs)
-- 
-- Struct Access Pattern:
-- 1. Root struct is always at struct_array index 0
-- 2. If struct.field_count == 1: data_or_offset contains direct field index
-- 3. If struct.field_count > 1: data_or_offset contains offset into field_indices_array
-- 4. Use field_index to access field_array entry
-- 5. Use field.label_index to get field name from label_array
-- 6. Use field.data_or_offset based on field_type (inline, offset, struct index, list offset)
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md - Complete GFF format documentation
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/Bioware-Aurora-GFF.md - Official BioWare Aurora GFF specification
-- - https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/itp.html - Tim Smith/Torlack's GFF/ITP documentation
-- - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/gffreader.cpp - Complete C++ GFF reader implementation
-- - https://github.com/xoreos/xoreos/blob/master/src/aurora/gff3file.cpp - Generic Aurora GFF implementation (shared format)
-- - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/GFFObject.ts - TypeScript GFF parser
-- - https://github.com/KotOR-Community-Patches/KotOR-Unity/blob/master/Assets/Scripts/FileObjects/GFFObject.cs - C# Unity GFF loader
-- - https://github.com/KotOR-Community-Patches/Kotor.NET/tree/master/Kotor.NET/Formats/KotorGFF/ - .NET GFF reader/writer
-- - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff.py - PyKotor binary reader/writer
-- - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/gff_data.py - GFF data model
Gff = class.class(KaitaiStruct)

Gff.GffFieldType = enum.Enum {
  uint8 = 0,
  int8 = 1,
  uint16 = 2,
  int16 = 3,
  uint32 = 4,
  int32 = 5,
  uint64 = 6,
  int64 = 7,
  single = 8,
  double = 9,
  string = 10,
  resref = 11,
  localized_string = 12,
  binary = 13,
  struct = 14,
  list = 15,
  vector4 = 16,
  vector3 = 17,
}

function Gff:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gff:_read()
  self.header = Gff.GffHeader(self._io, self, self._root)
end

-- 
-- Array of field entries (12 bytes each).
Gff.property.field_array = {}
function Gff.property.field_array:get()
  if self._m_field_array ~= nil then
    return self._m_field_array
  end

  if self.header.field_count > 0 then
    local _pos = self._io:pos()
    self._io:seek(self.header.field_offset)
    self._m_field_array = Gff.FieldArray(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_field_array
end

-- 
-- Storage area for complex field types (strings, binary, vectors, etc.).
Gff.property.field_data = {}
function Gff.property.field_data:get()
  if self._m_field_data ~= nil then
    return self._m_field_data
  end

  if self.header.field_data_count > 0 then
    local _pos = self._io:pos()
    self._io:seek(self.header.field_data_offset)
    self._m_field_data = Gff.FieldData(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_field_data
end

-- 
-- Array of field index arrays (used when structs have multiple fields).
Gff.property.field_indices_array = {}
function Gff.property.field_indices_array:get()
  if self._m_field_indices_array ~= nil then
    return self._m_field_indices_array
  end

  if self.header.field_indices_count > 0 then
    local _pos = self._io:pos()
    self._io:seek(self.header.field_indices_offset)
    self._m_field_indices_array = Gff.FieldIndicesArray(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_field_indices_array
end

-- 
-- Array of 16-byte null-padded field name labels.
Gff.property.label_array = {}
function Gff.property.label_array:get()
  if self._m_label_array ~= nil then
    return self._m_label_array
  end

  if self.header.label_count > 0 then
    local _pos = self._io:pos()
    self._io:seek(self.header.label_offset)
    self._m_label_array = Gff.LabelArray(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_label_array
end

-- 
-- Array of list entry structures (count + struct indices).
Gff.property.list_indices_array = {}
function Gff.property.list_indices_array:get()
  if self._m_list_indices_array ~= nil then
    return self._m_list_indices_array
  end

  if self.header.list_indices_count > 0 then
    local _pos = self._io:pos()
    self._io:seek(self.header.list_indices_offset)
    self._m_list_indices_array = Gff.ListIndicesArray(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_list_indices_array
end

-- 
-- Convenience "decoded" view of the root struct (struct_array[0]).
-- This resolves field indices to field entries, resolves labels to strings,
-- and decodes field values (including nested structs and lists) into typed instances.
Gff.property.root_struct_resolved = {}
function Gff.property.root_struct_resolved:get()
  if self._m_root_struct_resolved ~= nil then
    return self._m_root_struct_resolved
  end

  self._m_root_struct_resolved = Gff.ResolvedStruct(0, self._io, self, self._root)
  return self._m_root_struct_resolved
end

-- 
-- Array of struct entries (12 bytes each).
Gff.property.struct_array = {}
function Gff.property.struct_array:get()
  if self._m_struct_array ~= nil then
    return self._m_struct_array
  end

  if self.header.struct_count > 0 then
    local _pos = self._io:pos()
    self._io:seek(self.header.struct_offset)
    self._m_struct_array = Gff.StructArray(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_struct_array
end

-- 
-- GFF file header (56 bytes total).

Gff.FieldArray = class.class(KaitaiStruct)

function Gff.FieldArray:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Gff.FieldArray:_read()
  self.entries = {}
  for i = 0, self._root.header.field_count - 1 do
    self.entries[i + 1] = Gff.FieldEntry(self._io, self, self._root)
  end
end

-- 
-- Array of field entries (12 bytes each).

Gff.FieldData = class.class(KaitaiStruct)

function Gff.FieldData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Gff.FieldData:_read()
  self.raw_data = self._io:read_bytes(self._root.header.field_data_count)
end

-- 
-- Raw field data storage. Individual field data entries are accessed via
-- field_entry.field_data_offset_value offsets. The structure of each entry
-- depends on the field_type:
-- - UInt64/Int64/Double: 8 bytes
-- - String: 4-byte length + string bytes
-- - ResRef: 1-byte length + string bytes (max 16)
-- - LocalizedString: variable (see bioware_common::bioware_locstring type)
-- - Binary: 4-byte length + binary bytes
-- - Vector3: 12 bytes (3×float)
-- - Vector4: 16 bytes (4×float)

Gff.FieldEntry = class.class(KaitaiStruct)

function Gff.FieldEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Gff.FieldEntry:_read()
  self.field_type = Gff.GffFieldType(self._io:read_u4le())
  self.label_index = self._io:read_u4le()
  self.data_or_offset = self._io:read_u4le()
end

-- 
-- Absolute file offset to field data for complex types.
Gff.FieldEntry.property.field_data_offset_value = {}
function Gff.FieldEntry.property.field_data_offset_value:get()
  if self._m_field_data_offset_value ~= nil then
    return self._m_field_data_offset_value
  end

  if self.is_complex_type then
    self._m_field_data_offset_value = self._root.header.field_data_offset + self.data_or_offset
  end
  return self._m_field_data_offset_value
end

-- 
-- True if field stores data in field_data section.
Gff.FieldEntry.property.is_complex_type = {}
function Gff.FieldEntry.property.is_complex_type:get()
  if self._m_is_complex_type ~= nil then
    return self._m_is_complex_type
  end

  self._m_is_complex_type =  ((self.field_type == Gff.GffFieldType.uint64) or (self.field_type == Gff.GffFieldType.int64) or (self.field_type == Gff.GffFieldType.double) or (self.field_type == Gff.GffFieldType.string) or (self.field_type == Gff.GffFieldType.resref) or (self.field_type == Gff.GffFieldType.localized_string) or (self.field_type == Gff.GffFieldType.binary) or (self.field_type == Gff.GffFieldType.vector4) or (self.field_type == Gff.GffFieldType.vector3)) 
  return self._m_is_complex_type
end

-- 
-- True if field is a list of structs.
Gff.FieldEntry.property.is_list_type = {}
function Gff.FieldEntry.property.is_list_type:get()
  if self._m_is_list_type ~= nil then
    return self._m_is_list_type
  end

  self._m_is_list_type = self.field_type == Gff.GffFieldType.list
  return self._m_is_list_type
end

-- 
-- True if field stores data inline (simple types).
Gff.FieldEntry.property.is_simple_type = {}
function Gff.FieldEntry.property.is_simple_type:get()
  if self._m_is_simple_type ~= nil then
    return self._m_is_simple_type
  end

  self._m_is_simple_type =  ((self.field_type == Gff.GffFieldType.uint8) or (self.field_type == Gff.GffFieldType.int8) or (self.field_type == Gff.GffFieldType.uint16) or (self.field_type == Gff.GffFieldType.int16) or (self.field_type == Gff.GffFieldType.uint32) or (self.field_type == Gff.GffFieldType.int32) or (self.field_type == Gff.GffFieldType.single)) 
  return self._m_is_simple_type
end

-- 
-- True if field is a nested struct.
Gff.FieldEntry.property.is_struct_type = {}
function Gff.FieldEntry.property.is_struct_type:get()
  if self._m_is_struct_type ~= nil then
    return self._m_is_struct_type
  end

  self._m_is_struct_type = self.field_type == Gff.GffFieldType.struct
  return self._m_is_struct_type
end

-- 
-- Absolute file offset to list indices for list type fields.
Gff.FieldEntry.property.list_indices_offset_value = {}
function Gff.FieldEntry.property.list_indices_offset_value:get()
  if self._m_list_indices_offset_value ~= nil then
    return self._m_list_indices_offset_value
  end

  if self.is_list_type then
    self._m_list_indices_offset_value = self._root.header.list_indices_offset + self.data_or_offset
  end
  return self._m_list_indices_offset_value
end

-- 
-- Struct index for struct type fields.
Gff.FieldEntry.property.struct_index_value = {}
function Gff.FieldEntry.property.struct_index_value:get()
  if self._m_struct_index_value ~= nil then
    return self._m_struct_index_value
  end

  if self.is_struct_type then
    self._m_struct_index_value = self.data_or_offset
  end
  return self._m_struct_index_value
end

-- 
-- Field data type (see gff_field_type enum):
-- - 0-5, 8: Simple types (stored inline in data_or_offset)
-- - 6-7, 9-13, 16-17: Complex types (offset to field_data in data_or_offset)
-- - 14: Struct (struct index in data_or_offset)
-- - 15: List (offset to list_indices_array in data_or_offset)
-- 
-- Index into label_array for field name.
-- 
-- Inline data (simple types) or offset/index (complex types):
-- - Simple types (0-5, 8): Value stored directly (1-4 bytes, sign/zero extended to 4 bytes)
-- - Complex types (6-7, 9-13, 16-17): Byte offset into field_data section (relative to field_data_offset)
-- - Struct (14): Struct index (index into struct_array)
-- - List (15): Byte offset into list_indices_array (relative to list_indices_offset)

Gff.FieldIndicesArray = class.class(KaitaiStruct)

function Gff.FieldIndicesArray:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Gff.FieldIndicesArray:_read()
  self.indices = {}
  for i = 0, self._root.header.field_indices_count - 1 do
    self.indices[i + 1] = self._io:read_u4le()
  end
end

-- 
-- Array of field indices. When a struct has multiple fields, it stores an offset
-- into this array, and the next N consecutive u4 values (where N = struct.field_count)
-- are the field indices for that struct.

Gff.GffHeader = class.class(KaitaiStruct)

function Gff.GffHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Gff.GffHeader:_read()
  self.file_type = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.file_version = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.struct_offset = self._io:read_u4le()
  self.struct_count = self._io:read_u4le()
  self.field_offset = self._io:read_u4le()
  self.field_count = self._io:read_u4le()
  self.label_offset = self._io:read_u4le()
  self.label_count = self._io:read_u4le()
  self.field_data_offset = self._io:read_u4le()
  self.field_data_count = self._io:read_u4le()
  self.field_indices_offset = self._io:read_u4le()
  self.field_indices_count = self._io:read_u4le()
  self.list_indices_offset = self._io:read_u4le()
  self.list_indices_count = self._io:read_u4le()
end

-- 
-- File type signature (FourCC). Examples: "GFF ", "UTC ", "UTI ", "DLG ", "ARE ", etc.
-- Must match a valid GFFContent enum value.
-- 
-- File format version. Must be "V3.2" for KotOR games.
-- Later BioWare games use "V3.3", "V4.0", or "V4.1".
-- Valid values: "V3.2" (KotOR), "V3.3", "V4.0", "V4.1" (other BioWare games)
-- 
-- Byte offset to struct array from beginning of file.
-- 
-- Number of struct entries in struct array.
-- 
-- Byte offset to field array from beginning of file.
-- 
-- Number of field entries in field array.
-- 
-- Byte offset to label array from beginning of file.
-- 
-- Number of labels in label array.
-- 
-- Byte offset to field data section from beginning of file.
-- 
-- Size of field data section in bytes.
-- 
-- Byte offset to field indices array from beginning of file.
-- 
-- Number of field indices (total count across all structs with multiple fields).
-- 
-- Byte offset to list indices array from beginning of file.
-- 
-- Number of list indices entries.

Gff.LabelArray = class.class(KaitaiStruct)

function Gff.LabelArray:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Gff.LabelArray:_read()
  self.labels = {}
  for i = 0, self._root.header.label_count - 1 do
    self.labels[i + 1] = Gff.LabelEntry(self._io, self, self._root)
  end
end

-- 
-- Array of label entries (16 bytes each).

Gff.LabelEntry = class.class(KaitaiStruct)

function Gff.LabelEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Gff.LabelEntry:_read()
  self.name = str_decode.decode(self._io:read_bytes(16), "ASCII")
end

-- 
-- Field name label (null-padded to 16 bytes, null-terminated).
-- The actual label length is determined by the first null byte.
-- Application code should trim trailing null bytes when using this field.

-- 
-- Label entry as a null-terminated ASCII string within a fixed 16-byte field.
-- This avoids leaking trailing `\0` bytes into generated-code consumers.
Gff.LabelEntryTerminated = class.class(KaitaiStruct)

function Gff.LabelEntryTerminated:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Gff.LabelEntryTerminated:_read()
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(16), 0, false), "ASCII")
end


Gff.ListEntry = class.class(KaitaiStruct)

function Gff.ListEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Gff.ListEntry:_read()
  self.num_struct_indices = self._io:read_u4le()
  self.struct_indices = {}
  for i = 0, self.num_struct_indices - 1 do
    self.struct_indices[i + 1] = self._io:read_u4le()
  end
end

-- 
-- Number of struct indices in this list.
-- 
-- Array of struct indices (indices into struct_array).

Gff.ListIndicesArray = class.class(KaitaiStruct)

function Gff.ListIndicesArray:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Gff.ListIndicesArray:_read()
  self.raw_data = self._io:read_bytes(self._root.header.list_indices_count)
end

-- 
-- Raw list indices data. List entries are accessed via offsets stored in
-- list-type field entries (field_entry.list_indices_offset_value).
-- Each entry starts with a count (u4), followed by that many struct indices (u4 each).
-- 
-- Note: This is a raw data block. In practice, list entries are accessed via
-- offsets stored in list-type field entries, not as a sequential array.
-- Use list_entry type to parse individual entries at specific offsets.

-- 
-- A decoded field: includes resolved label string and decoded typed value.
-- Exactly one `value_*` instance (or one of `value_struct` / `list_*`) will be non-null.
Gff.ResolvedField = class.class(KaitaiStruct)

function Gff.ResolvedField:_init(field_index, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.field_index = field_index
  self:_read()
end

function Gff.ResolvedField:_read()
end

-- 
-- Raw field entry at field_index.
Gff.ResolvedField.property.entry = {}
function Gff.ResolvedField.property.entry:get()
  if self._m_entry ~= nil then
    return self._m_entry
  end

  local _pos = self._io:pos()
  self._io:seek(self._root.header.field_offset + self.field_index * 12)
  self._m_entry = Gff.FieldEntry(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_entry
end

-- 
-- Absolute file offset of this field entry (start of 12-byte record).
Gff.ResolvedField.property.field_entry_pos = {}
function Gff.ResolvedField.property.field_entry_pos:get()
  if self._m_field_entry_pos ~= nil then
    return self._m_field_entry_pos
  end

  self._m_field_entry_pos = self._root.header.field_offset + self.field_index * 12
  return self._m_field_entry_pos
end

-- 
-- Resolved field label string.
Gff.ResolvedField.property.label = {}
function Gff.ResolvedField.property.label:get()
  if self._m_label ~= nil then
    return self._m_label
  end

  local _pos = self._io:pos()
  self._io:seek(self._root.header.label_offset + self.entry.label_index * 16)
  self._m_label = Gff.LabelEntryTerminated(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_label
end

-- 
-- Parsed list entry at offset (list indices).
Gff.ResolvedField.property.list_entry = {}
function Gff.ResolvedField.property.list_entry:get()
  if self._m_list_entry ~= nil then
    return self._m_list_entry
  end

  if self.entry.field_type == Gff.GffFieldType.list then
    local _pos = self._io:pos()
    self._io:seek(self._root.header.list_indices_offset + self.entry.data_or_offset)
    self._m_list_entry = Gff.ListEntry(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_list_entry
end

-- 
-- Resolved structs referenced by this list.
Gff.ResolvedField.property.list_structs = {}
function Gff.ResolvedField.property.list_structs:get()
  if self._m_list_structs ~= nil then
    return self._m_list_structs
  end

  if self.entry.field_type == Gff.GffFieldType.list then
    self._m_list_structs = {}
    for i = 0, self.list_entry.num_struct_indices - 1 do
      self._m_list_structs[i + 1] = Gff.ResolvedStruct(self.list_entry.struct_indices[i + 1], self._io, self, self._root)
    end
  end
  return self._m_list_structs
end

Gff.ResolvedField.property.value_binary = {}
function Gff.ResolvedField.property.value_binary:get()
  if self._m_value_binary ~= nil then
    return self._m_value_binary
  end

  if self.entry.field_type == Gff.GffFieldType.binary then
    local _pos = self._io:pos()
    self._io:seek(self._root.header.field_data_offset + self.entry.data_or_offset)
    self._m_value_binary = BiowareCommon.BiowareBinaryData(self._io)
    self._io:seek(_pos)
  end
  return self._m_value_binary
end

Gff.ResolvedField.property.value_double = {}
function Gff.ResolvedField.property.value_double:get()
  if self._m_value_double ~= nil then
    return self._m_value_double
  end

  if self.entry.field_type == Gff.GffFieldType.double then
    local _pos = self._io:pos()
    self._io:seek(self._root.header.field_data_offset + self.entry.data_or_offset)
    self._m_value_double = self._io:read_f8le()
    self._io:seek(_pos)
  end
  return self._m_value_double
end

Gff.ResolvedField.property.value_int16 = {}
function Gff.ResolvedField.property.value_int16:get()
  if self._m_value_int16 ~= nil then
    return self._m_value_int16
  end

  if self.entry.field_type == Gff.GffFieldType.int16 then
    local _pos = self._io:pos()
    self._io:seek(self.field_entry_pos + 8)
    self._m_value_int16 = self._io:read_s2le()
    self._io:seek(_pos)
  end
  return self._m_value_int16
end

Gff.ResolvedField.property.value_int32 = {}
function Gff.ResolvedField.property.value_int32:get()
  if self._m_value_int32 ~= nil then
    return self._m_value_int32
  end

  if self.entry.field_type == Gff.GffFieldType.int32 then
    local _pos = self._io:pos()
    self._io:seek(self.field_entry_pos + 8)
    self._m_value_int32 = self._io:read_s4le()
    self._io:seek(_pos)
  end
  return self._m_value_int32
end

Gff.ResolvedField.property.value_int64 = {}
function Gff.ResolvedField.property.value_int64:get()
  if self._m_value_int64 ~= nil then
    return self._m_value_int64
  end

  if self.entry.field_type == Gff.GffFieldType.int64 then
    local _pos = self._io:pos()
    self._io:seek(self._root.header.field_data_offset + self.entry.data_or_offset)
    self._m_value_int64 = self._io:read_s8le()
    self._io:seek(_pos)
  end
  return self._m_value_int64
end

Gff.ResolvedField.property.value_int8 = {}
function Gff.ResolvedField.property.value_int8:get()
  if self._m_value_int8 ~= nil then
    return self._m_value_int8
  end

  if self.entry.field_type == Gff.GffFieldType.int8 then
    local _pos = self._io:pos()
    self._io:seek(self.field_entry_pos + 8)
    self._m_value_int8 = self._io:read_s1()
    self._io:seek(_pos)
  end
  return self._m_value_int8
end

Gff.ResolvedField.property.value_localized_string = {}
function Gff.ResolvedField.property.value_localized_string:get()
  if self._m_value_localized_string ~= nil then
    return self._m_value_localized_string
  end

  if self.entry.field_type == Gff.GffFieldType.localized_string then
    local _pos = self._io:pos()
    self._io:seek(self._root.header.field_data_offset + self.entry.data_or_offset)
    self._m_value_localized_string = BiowareCommon.BiowareLocstring(self._io)
    self._io:seek(_pos)
  end
  return self._m_value_localized_string
end

Gff.ResolvedField.property.value_resref = {}
function Gff.ResolvedField.property.value_resref:get()
  if self._m_value_resref ~= nil then
    return self._m_value_resref
  end

  if self.entry.field_type == Gff.GffFieldType.resref then
    local _pos = self._io:pos()
    self._io:seek(self._root.header.field_data_offset + self.entry.data_or_offset)
    self._m_value_resref = BiowareCommon.BiowareResref(self._io)
    self._io:seek(_pos)
  end
  return self._m_value_resref
end

Gff.ResolvedField.property.value_single = {}
function Gff.ResolvedField.property.value_single:get()
  if self._m_value_single ~= nil then
    return self._m_value_single
  end

  if self.entry.field_type == Gff.GffFieldType.single then
    local _pos = self._io:pos()
    self._io:seek(self.field_entry_pos + 8)
    self._m_value_single = self._io:read_f4le()
    self._io:seek(_pos)
  end
  return self._m_value_single
end

Gff.ResolvedField.property.value_string = {}
function Gff.ResolvedField.property.value_string:get()
  if self._m_value_string ~= nil then
    return self._m_value_string
  end

  if self.entry.field_type == Gff.GffFieldType.string then
    local _pos = self._io:pos()
    self._io:seek(self._root.header.field_data_offset + self.entry.data_or_offset)
    self._m_value_string = BiowareCommon.BiowareCexoString(self._io)
    self._io:seek(_pos)
  end
  return self._m_value_string
end

-- 
-- Nested struct (struct index = entry.data_or_offset).
Gff.ResolvedField.property.value_struct = {}
function Gff.ResolvedField.property.value_struct:get()
  if self._m_value_struct ~= nil then
    return self._m_value_struct
  end

  if self.entry.field_type == Gff.GffFieldType.struct then
    self._m_value_struct = Gff.ResolvedStruct(self.entry.data_or_offset, self._io, self, self._root)
  end
  return self._m_value_struct
end

Gff.ResolvedField.property.value_uint16 = {}
function Gff.ResolvedField.property.value_uint16:get()
  if self._m_value_uint16 ~= nil then
    return self._m_value_uint16
  end

  if self.entry.field_type == Gff.GffFieldType.uint16 then
    local _pos = self._io:pos()
    self._io:seek(self.field_entry_pos + 8)
    self._m_value_uint16 = self._io:read_u2le()
    self._io:seek(_pos)
  end
  return self._m_value_uint16
end

Gff.ResolvedField.property.value_uint32 = {}
function Gff.ResolvedField.property.value_uint32:get()
  if self._m_value_uint32 ~= nil then
    return self._m_value_uint32
  end

  if self.entry.field_type == Gff.GffFieldType.uint32 then
    local _pos = self._io:pos()
    self._io:seek(self.field_entry_pos + 8)
    self._m_value_uint32 = self._io:read_u4le()
    self._io:seek(_pos)
  end
  return self._m_value_uint32
end

Gff.ResolvedField.property.value_uint64 = {}
function Gff.ResolvedField.property.value_uint64:get()
  if self._m_value_uint64 ~= nil then
    return self._m_value_uint64
  end

  if self.entry.field_type == Gff.GffFieldType.uint64 then
    local _pos = self._io:pos()
    self._io:seek(self._root.header.field_data_offset + self.entry.data_or_offset)
    self._m_value_uint64 = self._io:read_u8le()
    self._io:seek(_pos)
  end
  return self._m_value_uint64
end

Gff.ResolvedField.property.value_uint8 = {}
function Gff.ResolvedField.property.value_uint8:get()
  if self._m_value_uint8 ~= nil then
    return self._m_value_uint8
  end

  if self.entry.field_type == Gff.GffFieldType.uint8 then
    local _pos = self._io:pos()
    self._io:seek(self.field_entry_pos + 8)
    self._m_value_uint8 = self._io:read_u1()
    self._io:seek(_pos)
  end
  return self._m_value_uint8
end

Gff.ResolvedField.property.value_vector3 = {}
function Gff.ResolvedField.property.value_vector3:get()
  if self._m_value_vector3 ~= nil then
    return self._m_value_vector3
  end

  if self.entry.field_type == Gff.GffFieldType.vector3 then
    local _pos = self._io:pos()
    self._io:seek(self._root.header.field_data_offset + self.entry.data_or_offset)
    self._m_value_vector3 = BiowareCommon.BiowareVector3(self._io)
    self._io:seek(_pos)
  end
  return self._m_value_vector3
end

Gff.ResolvedField.property.value_vector4 = {}
function Gff.ResolvedField.property.value_vector4:get()
  if self._m_value_vector4 ~= nil then
    return self._m_value_vector4
  end

  if self.entry.field_type == Gff.GffFieldType.vector4 then
    local _pos = self._io:pos()
    self._io:seek(self._root.header.field_data_offset + self.entry.data_or_offset)
    self._m_value_vector4 = BiowareCommon.BiowareVector4(self._io)
    self._io:seek(_pos)
  end
  return self._m_value_vector4
end

-- 
-- Index into field_array.

-- 
-- A decoded struct node: resolves field indices -> field entries -> typed values,
-- and recursively resolves nested structs and lists.
Gff.ResolvedStruct = class.class(KaitaiStruct)

function Gff.ResolvedStruct:_init(struct_index, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.struct_index = struct_index
  self:_read()
end

function Gff.ResolvedStruct:_read()
end

-- 
-- Raw struct entry at struct_index.
Gff.ResolvedStruct.property.entry = {}
function Gff.ResolvedStruct.property.entry:get()
  if self._m_entry ~= nil then
    return self._m_entry
  end

  local _pos = self._io:pos()
  self._io:seek(self._root.header.struct_offset + self.struct_index * 12)
  self._m_entry = Gff.StructEntry(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_entry
end

-- 
-- Field indices for this struct (only present when field_count > 1).
-- When field_count == 1, the single field index is stored directly in entry.data_or_offset.
Gff.ResolvedStruct.property.field_indices = {}
function Gff.ResolvedStruct.property.field_indices:get()
  if self._m_field_indices ~= nil then
    return self._m_field_indices
  end

  if self.entry.field_count > 1 then
    local _pos = self._io:pos()
    self._io:seek(self._root.header.field_indices_offset + self.entry.data_or_offset)
    self._m_field_indices = {}
    for i = 0, self.entry.field_count - 1 do
      self._m_field_indices[i + 1] = self._io:read_u4le()
    end
    self._io:seek(_pos)
  end
  return self._m_field_indices
end

-- 
-- Resolved fields (multi-field struct).
Gff.ResolvedStruct.property.fields = {}
function Gff.ResolvedStruct.property.fields:get()
  if self._m_fields ~= nil then
    return self._m_fields
  end

  if self.entry.field_count > 1 then
    self._m_fields = {}
    for i = 0, self.entry.field_count - 1 do
      self._m_fields[i + 1] = Gff.ResolvedField(self.field_indices[i + 1], self._io, self, self._root)
    end
  end
  return self._m_fields
end

-- 
-- Resolved field (single-field struct).
Gff.ResolvedStruct.property.single_field = {}
function Gff.ResolvedStruct.property.single_field:get()
  if self._m_single_field ~= nil then
    return self._m_single_field
  end

  if self.entry.field_count == 1 then
    self._m_single_field = Gff.ResolvedField(self.entry.data_or_offset, self._io, self, self._root)
  end
  return self._m_single_field
end

-- 
-- Index into struct_array.

Gff.StructArray = class.class(KaitaiStruct)

function Gff.StructArray:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Gff.StructArray:_read()
  self.entries = {}
  for i = 0, self._root.header.struct_count - 1 do
    self.entries[i + 1] = Gff.StructEntry(self._io, self, self._root)
  end
end

-- 
-- Array of struct entries (12 bytes each).

Gff.StructEntry = class.class(KaitaiStruct)

function Gff.StructEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Gff.StructEntry:_read()
  self.struct_id = self._io:read_s4le()
  self.data_or_offset = self._io:read_u4le()
  self.field_count = self._io:read_u4le()
end

-- 
-- Byte offset into field_indices_array when struct has multiple fields.
Gff.StructEntry.property.field_indices_offset = {}
function Gff.StructEntry.property.field_indices_offset:get()
  if self._m_field_indices_offset ~= nil then
    return self._m_field_indices_offset
  end

  if self.has_multiple_fields then
    self._m_field_indices_offset = self.data_or_offset
  end
  return self._m_field_indices_offset
end

-- 
-- True if struct has multiple fields (offset to field indices in data_or_offset).
Gff.StructEntry.property.has_multiple_fields = {}
function Gff.StructEntry.property.has_multiple_fields:get()
  if self._m_has_multiple_fields ~= nil then
    return self._m_has_multiple_fields
  end

  self._m_has_multiple_fields = self.field_count > 1
  return self._m_has_multiple_fields
end

-- 
-- True if struct has exactly one field (direct field index in data_or_offset).
Gff.StructEntry.property.has_single_field = {}
function Gff.StructEntry.property.has_single_field:get()
  if self._m_has_single_field ~= nil then
    return self._m_has_single_field
  end

  self._m_has_single_field = self.field_count == 1
  return self._m_has_single_field
end

-- 
-- Direct field index when struct has exactly one field.
Gff.StructEntry.property.single_field_index = {}
function Gff.StructEntry.property.single_field_index:get()
  if self._m_single_field_index ~= nil then
    return self._m_single_field_index
  end

  if self.has_single_field then
    self._m_single_field_index = self.data_or_offset
  end
  return self._m_single_field_index
end

-- 
-- Structure type identifier. Often 0xFFFFFFFF (-1) for generic structs.
-- Used to identify struct types in schema-aware parsers.
-- 
-- Field index (if field_count == 1) or byte offset to field indices array (if field_count > 1).
-- If field_count == 0, this value is unused.
-- 
-- Number of fields in this struct:
-- - 0: No fields
-- - 1: Single field, data_or_offset contains the field index directly
-- - >1: Multiple fields, data_or_offset contains byte offset into field_indices_array

