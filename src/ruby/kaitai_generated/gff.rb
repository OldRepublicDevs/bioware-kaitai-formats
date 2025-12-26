# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'bioware_common'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# GFF (Generic File Format) is BioWare's universal container format for structured game data.
# It is used by many KotOR file types including UTC (creature), UTI (item), DLG (dialogue),
# ARE (area), GIT (game instance template), IFO (module info), and many others.
# 
# GFF uses a hierarchical structure with structs containing fields, which can be simple values,
# nested structs, or lists of structs. The format supports version V3.2 (KotOR) and later
# versions (V3.3, V4.0, V4.1) used in other BioWare games.
# 
# Binary Format Structure:
# - File Header (56 bytes): File type signature (FourCC), version, counts, and offsets to all
#   data tables (structs, fields, labels, field_data, field_indices, list_indices)
# - Label Array: Array of 16-byte null-padded field name labels
# - Struct Array: Array of struct entries (12 bytes each) - struct_id, data_or_offset, field_count
# - Field Array: Array of field entries (12 bytes each) - field_type, label_index, data_or_offset
# - Field Data: Storage area for complex field types (strings, binary, vectors, etc.)
# - Field Indices Array: Array of field index arrays (used when structs have multiple fields)
# - List Indices Array: Array of list entry structures (count + struct indices)
# 
# Field Types:
# - Simple types (0-5, 8): Stored inline in data_or_offset (uint8, int8, uint16, int16, uint32,
#   int32, float)
# - Complex types (6-7, 9-13, 16-17): Offset to field_data section (uint64, int64, double, string,
#   resref, localized_string, binary, vector4, vector3)
# - Struct (14): Struct index stored inline (nested struct)
# - List (15): Offset to list_indices_array (list of structs)
# 
# Struct Access Pattern:
# 1. Root struct is always at struct_array index 0
# 2. If struct.field_count == 1: data_or_offset contains direct field index
# 3. If struct.field_count > 1: data_or_offset contains offset into field_indices_array
# 4. Use field_index to access field_array entry
# 5. Use field.label_index to get field name from label_array
# 6. Use field.data_or_offset based on field_type (inline, offset, struct index, list offset)
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md - Complete GFF format documentation
# - https://github.com/OldRepublicDevs/PyKotor/wiki/Bioware-Aurora-GFF.md - Official BioWare Aurora GFF specification
# - https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/itp.html - Tim Smith/Torlack's GFF/ITP documentation
# - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/gffreader.cpp - Complete C++ GFF reader implementation
# - https://github.com/xoreos/xoreos/blob/master/src/aurora/gff3file.cpp - Generic Aurora GFF implementation (shared format)
# - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/GFFObject.ts - TypeScript GFF parser
# - https://github.com/KotOR-Community-Patches/KotOR-Unity/blob/master/Assets/Scripts/FileObjects/GFFObject.cs - C# Unity GFF loader
# - https://github.com/KotOR-Community-Patches/Kotor.NET/tree/master/Kotor.NET/Formats/KotorGFF/ - .NET GFF reader/writer
# - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff.py - PyKotor binary reader/writer
# - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/gff_data.py - GFF data model
class Gff < Kaitai::Struct::Struct

  GFF_FIELD_TYPE = {
    0 => :gff_field_type_uint8,
    1 => :gff_field_type_int8,
    2 => :gff_field_type_uint16,
    3 => :gff_field_type_int16,
    4 => :gff_field_type_uint32,
    5 => :gff_field_type_int32,
    6 => :gff_field_type_uint64,
    7 => :gff_field_type_int64,
    8 => :gff_field_type_single,
    9 => :gff_field_type_double,
    10 => :gff_field_type_string,
    11 => :gff_field_type_resref,
    12 => :gff_field_type_localized_string,
    13 => :gff_field_type_binary,
    14 => :gff_field_type_struct,
    15 => :gff_field_type_list,
    16 => :gff_field_type_vector4,
    17 => :gff_field_type_vector3,
  }
  I__GFF_FIELD_TYPE = GFF_FIELD_TYPE.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @header = GffHeader.new(@_io, self, @_root)
    self
  end
  class FieldArray < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      (_root.header.field_count).times { |i|
        @entries << FieldEntry.new(@_io, self, @_root)
      }
      self
    end

    ##
    # Array of field entries (12 bytes each)
    attr_reader :entries
  end
  class FieldData < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @raw_data = @_io.read_bytes(_root.header.field_data_count)
      self
    end

    ##
    # Raw field data storage. Individual field data entries are accessed via
    # field_entry.field_data_offset_value offsets. The structure of each entry
    # depends on the field_type:
    # - UInt64/Int64/Double: 8 bytes
    # - String: 4-byte length + string bytes
    # - ResRef: 1-byte length + string bytes (max 16)
    # - LocalizedString: variable (see bioware_common::bioware_locstring type)
    # - Binary: 4-byte length + binary bytes
    # - Vector3: 12 bytes (3×float)
    # - Vector4: 16 bytes (4×float)
    attr_reader :raw_data
  end
  class FieldEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @field_type = Kaitai::Struct::Stream::resolve_enum(Gff::GFF_FIELD_TYPE, @_io.read_u4le)
      @label_index = @_io.read_u4le
      @data_or_offset = @_io.read_u4le
      self
    end

    ##
    # Absolute file offset to field data for complex types
    def field_data_offset_value
      return @field_data_offset_value unless @field_data_offset_value.nil?
      if is_complex_type
        @field_data_offset_value = _root.header.field_data_offset + data_or_offset
      end
      @field_data_offset_value
    end

    ##
    # True if field stores data in field_data section
    def is_complex_type
      return @is_complex_type unless @is_complex_type.nil?
      @is_complex_type =  ((field_type == :gff_field_type_uint64) || (field_type == :gff_field_type_int64) || (field_type == :gff_field_type_double) || (field_type == :gff_field_type_string) || (field_type == :gff_field_type_resref) || (field_type == :gff_field_type_localized_string) || (field_type == :gff_field_type_binary) || (field_type == :gff_field_type_vector4) || (field_type == :gff_field_type_vector3)) 
      @is_complex_type
    end

    ##
    # True if field is a list of structs
    def is_list_type
      return @is_list_type unless @is_list_type.nil?
      @is_list_type = field_type == :gff_field_type_list
      @is_list_type
    end

    ##
    # True if field stores data inline (simple types)
    def is_simple_type
      return @is_simple_type unless @is_simple_type.nil?
      @is_simple_type =  ((field_type == :gff_field_type_uint8) || (field_type == :gff_field_type_int8) || (field_type == :gff_field_type_uint16) || (field_type == :gff_field_type_int16) || (field_type == :gff_field_type_uint32) || (field_type == :gff_field_type_int32) || (field_type == :gff_field_type_single)) 
      @is_simple_type
    end

    ##
    # True if field is a nested struct
    def is_struct_type
      return @is_struct_type unless @is_struct_type.nil?
      @is_struct_type = field_type == :gff_field_type_struct
      @is_struct_type
    end

    ##
    # Absolute file offset to list indices for list type fields
    def list_indices_offset_value
      return @list_indices_offset_value unless @list_indices_offset_value.nil?
      if is_list_type
        @list_indices_offset_value = _root.header.list_indices_offset + data_or_offset
      end
      @list_indices_offset_value
    end

    ##
    # Struct index for struct type fields
    def struct_index_value
      return @struct_index_value unless @struct_index_value.nil?
      if is_struct_type
        @struct_index_value = data_or_offset
      end
      @struct_index_value
    end

    ##
    # Field data type (see gff_field_type enum):
    # - 0-5, 8: Simple types (stored inline in data_or_offset)
    # - 6-7, 9-13, 16-17: Complex types (offset to field_data in data_or_offset)
    # - 14: Struct (struct index in data_or_offset)
    # - 15: List (offset to list_indices_array in data_or_offset)
    attr_reader :field_type

    ##
    # Index into label_array for field name
    attr_reader :label_index

    ##
    # Inline data (simple types) or offset/index (complex types):
    # - Simple types (0-5, 8): Value stored directly (1-4 bytes, sign/zero extended to 4 bytes)
    # - Complex types (6-7, 9-13, 16-17): Byte offset into field_data section (relative to field_data_offset)
    # - Struct (14): Struct index (index into struct_array)
    # - List (15): Byte offset into list_indices_array (relative to list_indices_offset)
    attr_reader :data_or_offset
  end
  class FieldIndicesArray < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @indices = []
      (_root.header.field_indices_count).times { |i|
        @indices << @_io.read_u4le
      }
      self
    end

    ##
    # Array of field indices. When a struct has multiple fields, it stores an offset
    # into this array, and the next N consecutive u4 values (where N = struct.field_count)
    # are the field indices for that struct.
    attr_reader :indices
  end
  class GffHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_type = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
      @file_version = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
      @struct_offset = @_io.read_u4le
      @struct_count = @_io.read_u4le
      @field_offset = @_io.read_u4le
      @field_count = @_io.read_u4le
      @label_offset = @_io.read_u4le
      @label_count = @_io.read_u4le
      @field_data_offset = @_io.read_u4le
      @field_data_count = @_io.read_u4le
      @field_indices_offset = @_io.read_u4le
      @field_indices_count = @_io.read_u4le
      @list_indices_offset = @_io.read_u4le
      @list_indices_count = @_io.read_u4le
      self
    end

    ##
    # File type signature (FourCC). Examples: "GFF ", "UTC ", "UTI ", "DLG ", "ARE ", etc.
    # Must match a valid GFFContent enum value.
    attr_reader :file_type

    ##
    # File format version. Must be "V3.2" for KotOR games.
    # Later BioWare games use "V3.3", "V4.0", or "V4.1".
    # Valid values: "V3.2" (KotOR), "V3.3", "V4.0", "V4.1" (other BioWare games)
    attr_reader :file_version

    ##
    # Byte offset to struct array from beginning of file
    attr_reader :struct_offset

    ##
    # Number of struct entries in struct array
    attr_reader :struct_count

    ##
    # Byte offset to field array from beginning of file
    attr_reader :field_offset

    ##
    # Number of field entries in field array
    attr_reader :field_count

    ##
    # Byte offset to label array from beginning of file
    attr_reader :label_offset

    ##
    # Number of labels in label array
    attr_reader :label_count

    ##
    # Byte offset to field data section from beginning of file
    attr_reader :field_data_offset

    ##
    # Size of field data section in bytes
    attr_reader :field_data_count

    ##
    # Byte offset to field indices array from beginning of file
    attr_reader :field_indices_offset

    ##
    # Number of field indices (total count across all structs with multiple fields)
    attr_reader :field_indices_count

    ##
    # Byte offset to list indices array from beginning of file
    attr_reader :list_indices_offset

    ##
    # Number of list indices entries
    attr_reader :list_indices_count
  end
  class LabelArray < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @labels = []
      (_root.header.label_count).times { |i|
        @labels << LabelEntry.new(@_io, self, @_root)
      }
      self
    end

    ##
    # Array of label entries (16 bytes each)
    attr_reader :labels
  end
  class LabelEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = (@_io.read_bytes(16)).force_encoding("ASCII").encode('UTF-8')
      self
    end

    ##
    # Field name label (null-padded to 16 bytes, null-terminated).
    # The actual label length is determined by the first null byte.
    # Application code should trim trailing null bytes when using this field.
    attr_reader :name
  end

  ##
  # Label entry as a null-terminated ASCII string within a fixed 16-byte field.
  # This avoids leaking trailing `\0` bytes into generated-code consumers.
  class LabelEntryTerminated < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(16), 0, false)).force_encoding("ASCII").encode('UTF-8')
      self
    end
    attr_reader :name
  end
  class ListEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_struct_indices = @_io.read_u4le
      @struct_indices = []
      (num_struct_indices).times { |i|
        @struct_indices << @_io.read_u4le
      }
      self
    end

    ##
    # Number of struct indices in this list
    attr_reader :num_struct_indices

    ##
    # Array of struct indices (indices into struct_array)
    attr_reader :struct_indices
  end
  class ListIndicesArray < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @raw_data = @_io.read_bytes(_root.header.list_indices_count)
      self
    end

    ##
    # Raw list indices data. List entries are accessed via offsets stored in
    # list-type field entries (field_entry.list_indices_offset_value).
    # Each entry starts with a count (u4), followed by that many struct indices (u4 each).
    # 
    # Note: This is a raw data block. In practice, list entries are accessed via
    # offsets stored in list-type field entries, not as a sequential array.
    # Use list_entry type to parse individual entries at specific offsets.
    attr_reader :raw_data
  end

  ##
  # A decoded field: includes resolved label string and decoded typed value.
  # Exactly one `value_*` instance (or one of `value_struct` / `list_*`) will be non-null.
  class ResolvedField < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil, field_index)
      super(_io, _parent, _root)
      @field_index = field_index
      _read
    end

    def _read
      self
    end

    ##
    # Raw field entry at field_index
    def entry
      return @entry unless @entry.nil?
      _pos = @_io.pos
      @_io.seek(_root.header.field_offset + field_index * 12)
      @entry = FieldEntry.new(@_io, self, @_root)
      @_io.seek(_pos)
      @entry
    end

    ##
    # Absolute file offset of this field entry (start of 12-byte record)
    def field_entry_pos
      return @field_entry_pos unless @field_entry_pos.nil?
      @field_entry_pos = _root.header.field_offset + field_index * 12
      @field_entry_pos
    end

    ##
    # Resolved field label string
    def label
      return @label unless @label.nil?
      _pos = @_io.pos
      @_io.seek(_root.header.label_offset + entry.label_index * 16)
      @label = LabelEntryTerminated.new(@_io, self, @_root)
      @_io.seek(_pos)
      @label
    end

    ##
    # Parsed list entry at offset (list indices)
    def list_entry
      return @list_entry unless @list_entry.nil?
      if entry.field_type == :gff_field_type_list
        _pos = @_io.pos
        @_io.seek(_root.header.list_indices_offset + entry.data_or_offset)
        @list_entry = ListEntry.new(@_io, self, @_root)
        @_io.seek(_pos)
      end
      @list_entry
    end

    ##
    # Resolved structs referenced by this list
    def list_structs
      return @list_structs unless @list_structs.nil?
      if entry.field_type == :gff_field_type_list
        @list_structs = []
        (list_entry.num_struct_indices).times { |i|
          @list_structs << ResolvedStruct.new(@_io, self, @_root, list_entry.struct_indices[i])
        }
      end
      @list_structs
    end
    def value_binary
      return @value_binary unless @value_binary.nil?
      if entry.field_type == :gff_field_type_binary
        _pos = @_io.pos
        @_io.seek(_root.header.field_data_offset + entry.data_or_offset)
        @value_binary = BiowareCommon::BiowareBinaryData.new(@_io)
        @_io.seek(_pos)
      end
      @value_binary
    end
    def value_double
      return @value_double unless @value_double.nil?
      if entry.field_type == :gff_field_type_double
        _pos = @_io.pos
        @_io.seek(_root.header.field_data_offset + entry.data_or_offset)
        @value_double = @_io.read_f8le
        @_io.seek(_pos)
      end
      @value_double
    end
    def value_int16
      return @value_int16 unless @value_int16.nil?
      if entry.field_type == :gff_field_type_int16
        _pos = @_io.pos
        @_io.seek(field_entry_pos + 8)
        @value_int16 = @_io.read_s2le
        @_io.seek(_pos)
      end
      @value_int16
    end
    def value_int32
      return @value_int32 unless @value_int32.nil?
      if entry.field_type == :gff_field_type_int32
        _pos = @_io.pos
        @_io.seek(field_entry_pos + 8)
        @value_int32 = @_io.read_s4le
        @_io.seek(_pos)
      end
      @value_int32
    end
    def value_int64
      return @value_int64 unless @value_int64.nil?
      if entry.field_type == :gff_field_type_int64
        _pos = @_io.pos
        @_io.seek(_root.header.field_data_offset + entry.data_or_offset)
        @value_int64 = @_io.read_s8le
        @_io.seek(_pos)
      end
      @value_int64
    end
    def value_int8
      return @value_int8 unless @value_int8.nil?
      if entry.field_type == :gff_field_type_int8
        _pos = @_io.pos
        @_io.seek(field_entry_pos + 8)
        @value_int8 = @_io.read_s1
        @_io.seek(_pos)
      end
      @value_int8
    end
    def value_localized_string
      return @value_localized_string unless @value_localized_string.nil?
      if entry.field_type == :gff_field_type_localized_string
        _pos = @_io.pos
        @_io.seek(_root.header.field_data_offset + entry.data_or_offset)
        @value_localized_string = BiowareCommon::BiowareLocstring.new(@_io)
        @_io.seek(_pos)
      end
      @value_localized_string
    end
    def value_resref
      return @value_resref unless @value_resref.nil?
      if entry.field_type == :gff_field_type_resref
        _pos = @_io.pos
        @_io.seek(_root.header.field_data_offset + entry.data_or_offset)
        @value_resref = BiowareCommon::BiowareResref.new(@_io)
        @_io.seek(_pos)
      end
      @value_resref
    end
    def value_single
      return @value_single unless @value_single.nil?
      if entry.field_type == :gff_field_type_single
        _pos = @_io.pos
        @_io.seek(field_entry_pos + 8)
        @value_single = @_io.read_f4le
        @_io.seek(_pos)
      end
      @value_single
    end
    def value_string
      return @value_string unless @value_string.nil?
      if entry.field_type == :gff_field_type_string
        _pos = @_io.pos
        @_io.seek(_root.header.field_data_offset + entry.data_or_offset)
        @value_string = BiowareCommon::BiowareCexoString.new(@_io)
        @_io.seek(_pos)
      end
      @value_string
    end

    ##
    # Nested struct (struct index = entry.data_or_offset)
    def value_struct
      return @value_struct unless @value_struct.nil?
      if entry.field_type == :gff_field_type_struct
        @value_struct = ResolvedStruct.new(@_io, self, @_root, entry.data_or_offset)
      end
      @value_struct
    end
    def value_uint16
      return @value_uint16 unless @value_uint16.nil?
      if entry.field_type == :gff_field_type_uint16
        _pos = @_io.pos
        @_io.seek(field_entry_pos + 8)
        @value_uint16 = @_io.read_u2le
        @_io.seek(_pos)
      end
      @value_uint16
    end
    def value_uint32
      return @value_uint32 unless @value_uint32.nil?
      if entry.field_type == :gff_field_type_uint32
        _pos = @_io.pos
        @_io.seek(field_entry_pos + 8)
        @value_uint32 = @_io.read_u4le
        @_io.seek(_pos)
      end
      @value_uint32
    end
    def value_uint64
      return @value_uint64 unless @value_uint64.nil?
      if entry.field_type == :gff_field_type_uint64
        _pos = @_io.pos
        @_io.seek(_root.header.field_data_offset + entry.data_or_offset)
        @value_uint64 = @_io.read_u8le
        @_io.seek(_pos)
      end
      @value_uint64
    end
    def value_uint8
      return @value_uint8 unless @value_uint8.nil?
      if entry.field_type == :gff_field_type_uint8
        _pos = @_io.pos
        @_io.seek(field_entry_pos + 8)
        @value_uint8 = @_io.read_u1
        @_io.seek(_pos)
      end
      @value_uint8
    end
    def value_vector3
      return @value_vector3 unless @value_vector3.nil?
      if entry.field_type == :gff_field_type_vector3
        _pos = @_io.pos
        @_io.seek(_root.header.field_data_offset + entry.data_or_offset)
        @value_vector3 = BiowareCommon::BiowareVector3.new(@_io)
        @_io.seek(_pos)
      end
      @value_vector3
    end
    def value_vector4
      return @value_vector4 unless @value_vector4.nil?
      if entry.field_type == :gff_field_type_vector4
        _pos = @_io.pos
        @_io.seek(_root.header.field_data_offset + entry.data_or_offset)
        @value_vector4 = BiowareCommon::BiowareVector4.new(@_io)
        @_io.seek(_pos)
      end
      @value_vector4
    end

    ##
    # Index into field_array
    attr_reader :field_index
  end

  ##
  # A decoded struct node: resolves field indices -> field entries -> typed values,
  # and recursively resolves nested structs and lists.
  class ResolvedStruct < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil, struct_index)
      super(_io, _parent, _root)
      @struct_index = struct_index
      _read
    end

    def _read
      self
    end

    ##
    # Raw struct entry at struct_index
    def entry
      return @entry unless @entry.nil?
      _pos = @_io.pos
      @_io.seek(_root.header.struct_offset + struct_index * 12)
      @entry = StructEntry.new(@_io, self, @_root)
      @_io.seek(_pos)
      @entry
    end

    ##
    # Field indices for this struct (only present when field_count > 1).
    # When field_count == 1, the single field index is stored directly in entry.data_or_offset.
    def field_indices
      return @field_indices unless @field_indices.nil?
      if entry.field_count > 1
        _pos = @_io.pos
        @_io.seek(_root.header.field_indices_offset + entry.data_or_offset)
        @field_indices = []
        (entry.field_count).times { |i|
          @field_indices << @_io.read_u4le
        }
        @_io.seek(_pos)
      end
      @field_indices
    end

    ##
    # Resolved fields (multi-field struct)
    def fields
      return @fields unless @fields.nil?
      if entry.field_count > 1
        @fields = []
        (entry.field_count).times { |i|
          @fields << ResolvedField.new(@_io, self, @_root, field_indices[i])
        }
      end
      @fields
    end

    ##
    # Resolved field (single-field struct)
    def single_field
      return @single_field unless @single_field.nil?
      if entry.field_count == 1
        @single_field = ResolvedField.new(@_io, self, @_root, entry.data_or_offset)
      end
      @single_field
    end

    ##
    # Index into struct_array
    attr_reader :struct_index
  end
  class StructArray < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      (_root.header.struct_count).times { |i|
        @entries << StructEntry.new(@_io, self, @_root)
      }
      self
    end

    ##
    # Array of struct entries (12 bytes each)
    attr_reader :entries
  end
  class StructEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @struct_id = @_io.read_s4le
      @data_or_offset = @_io.read_u4le
      @field_count = @_io.read_u4le
      self
    end

    ##
    # Byte offset into field_indices_array when struct has multiple fields
    def field_indices_offset
      return @field_indices_offset unless @field_indices_offset.nil?
      if has_multiple_fields
        @field_indices_offset = data_or_offset
      end
      @field_indices_offset
    end

    ##
    # True if struct has multiple fields (offset to field indices in data_or_offset)
    def has_multiple_fields
      return @has_multiple_fields unless @has_multiple_fields.nil?
      @has_multiple_fields = field_count > 1
      @has_multiple_fields
    end

    ##
    # True if struct has exactly one field (direct field index in data_or_offset)
    def has_single_field
      return @has_single_field unless @has_single_field.nil?
      @has_single_field = field_count == 1
      @has_single_field
    end

    ##
    # Direct field index when struct has exactly one field
    def single_field_index
      return @single_field_index unless @single_field_index.nil?
      if has_single_field
        @single_field_index = data_or_offset
      end
      @single_field_index
    end

    ##
    # Structure type identifier. Often 0xFFFFFFFF (-1) for generic structs.
    # Used to identify struct types in schema-aware parsers.
    attr_reader :struct_id

    ##
    # Field index (if field_count == 1) or byte offset to field indices array (if field_count > 1).
    # If field_count == 0, this value is unused.
    attr_reader :data_or_offset

    ##
    # Number of fields in this struct:
    # - 0: No fields
    # - 1: Single field, data_or_offset contains the field index directly
    # - >1: Multiple fields, data_or_offset contains byte offset into field_indices_array
    attr_reader :field_count
  end

  ##
  # Array of field entries (12 bytes each)
  def field_array
    return @field_array unless @field_array.nil?
    if header.field_count > 0
      _pos = @_io.pos
      @_io.seek(header.field_offset)
      @field_array = FieldArray.new(@_io, self, @_root)
      @_io.seek(_pos)
    end
    @field_array
  end

  ##
  # Storage area for complex field types (strings, binary, vectors, etc.)
  def field_data
    return @field_data unless @field_data.nil?
    if header.field_data_count > 0
      _pos = @_io.pos
      @_io.seek(header.field_data_offset)
      @field_data = FieldData.new(@_io, self, @_root)
      @_io.seek(_pos)
    end
    @field_data
  end

  ##
  # Array of field index arrays (used when structs have multiple fields)
  def field_indices_array
    return @field_indices_array unless @field_indices_array.nil?
    if header.field_indices_count > 0
      _pos = @_io.pos
      @_io.seek(header.field_indices_offset)
      @field_indices_array = FieldIndicesArray.new(@_io, self, @_root)
      @_io.seek(_pos)
    end
    @field_indices_array
  end

  ##
  # Array of 16-byte null-padded field name labels
  def label_array
    return @label_array unless @label_array.nil?
    if header.label_count > 0
      _pos = @_io.pos
      @_io.seek(header.label_offset)
      @label_array = LabelArray.new(@_io, self, @_root)
      @_io.seek(_pos)
    end
    @label_array
  end

  ##
  # Array of list entry structures (count + struct indices)
  def list_indices_array
    return @list_indices_array unless @list_indices_array.nil?
    if header.list_indices_count > 0
      _pos = @_io.pos
      @_io.seek(header.list_indices_offset)
      @list_indices_array = ListIndicesArray.new(@_io, self, @_root)
      @_io.seek(_pos)
    end
    @list_indices_array
  end

  ##
  # Convenience "decoded" view of the root struct (struct_array[0]).
  # This resolves field indices to field entries, resolves labels to strings,
  # and decodes field values (including nested structs and lists) into typed instances.
  def root_struct_resolved
    return @root_struct_resolved unless @root_struct_resolved.nil?
    @root_struct_resolved = ResolvedStruct.new(@_io, self, @_root, 0)
    @root_struct_resolved
  end

  ##
  # Array of struct entries (12 bytes each)
  def struct_array
    return @struct_array unless @struct_array.nil?
    if header.struct_count > 0
      _pos = @_io.pos
      @_io.seek(header.struct_offset)
      @struct_array = StructArray.new(@_io, self, @_root)
      @_io.seek(_pos)
    end
    @struct_array
  end

  ##
  # GFF file header (56 bytes total)
  attr_reader :header
end
