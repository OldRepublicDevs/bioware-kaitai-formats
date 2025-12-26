// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './BiowareCommon'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./BiowareCommon'));
  } else {
    factory(root.Gff || (root.Gff = {}), root.KaitaiStream, root.BiowareCommon || (root.BiowareCommon = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Gff_, KaitaiStream, BiowareCommon_) {
/**
 * GFF (Generic File Format) is BioWare's universal container format for structured game data.
 * It is used by many KotOR file types including UTC (creature), UTI (item), DLG (dialogue),
 * ARE (area), GIT (game instance template), IFO (module info), and many others.
 * 
 * GFF uses a hierarchical structure with structs containing fields, which can be simple values,
 * nested structs, or lists of structs. The format supports version V3.2 (KotOR) and later
 * versions (V3.3, V4.0, V4.1) used in other BioWare games.
 * 
 * Binary Format Structure:
 * - File Header (56 bytes): File type signature (FourCC), version, counts, and offsets to all
 *   data tables (structs, fields, labels, field_data, field_indices, list_indices)
 * - Label Array: Array of 16-byte null-padded field name labels
 * - Struct Array: Array of struct entries (12 bytes each) - struct_id, data_or_offset, field_count
 * - Field Array: Array of field entries (12 bytes each) - field_type, label_index, data_or_offset
 * - Field Data: Storage area for complex field types (strings, binary, vectors, etc.)
 * - Field Indices Array: Array of field index arrays (used when structs have multiple fields)
 * - List Indices Array: Array of list entry structures (count + struct indices)
 * 
 * Field Types:
 * - Simple types (0-5, 8): Stored inline in data_or_offset (uint8, int8, uint16, int16, uint32,
 *   int32, float)
 * - Complex types (6-7, 9-13, 16-17): Offset to field_data section (uint64, int64, double, string,
 *   resref, localized_string, binary, vector4, vector3)
 * - Struct (14): Struct index stored inline (nested struct)
 * - List (15): Offset to list_indices_array (list of structs)
 * 
 * Struct Access Pattern:
 * 1. Root struct is always at struct_array index 0
 * 2. If struct.field_count == 1: data_or_offset contains direct field index
 * 3. If struct.field_count > 1: data_or_offset contains offset into field_indices_array
 * 4. Use field_index to access field_array entry
 * 5. Use field.label_index to get field name from label_array
 * 6. Use field.data_or_offset based on field_type (inline, offset, struct index, list offset)
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md - Complete GFF format documentation
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/Bioware-Aurora-GFF.md - Official BioWare Aurora GFF specification
 * - https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/itp.html - Tim Smith/Torlack's GFF/ITP documentation
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/gffreader.cpp - Complete C++ GFF reader implementation
 * - https://github.com/xoreos/xoreos/blob/master/src/aurora/gff3file.cpp - Generic Aurora GFF implementation (shared format)
 * - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/GFFObject.ts - TypeScript GFF parser
 * - https://github.com/KotOR-Community-Patches/KotOR-Unity/blob/master/Assets/Scripts/FileObjects/GFFObject.cs - C# Unity GFF loader
 * - https://github.com/KotOR-Community-Patches/Kotor.NET/tree/master/Kotor.NET/Formats/KotorGFF/ - .NET GFF reader/writer
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff.py - PyKotor binary reader/writer
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/gff_data.py - GFF data model
 */

var Gff = (function() {
  Gff.GffFieldType = Object.freeze({
    UINT8: 0,
    INT8: 1,
    UINT16: 2,
    INT16: 3,
    UINT32: 4,
    INT32: 5,
    UINT64: 6,
    INT64: 7,
    SINGLE: 8,
    DOUBLE: 9,
    STRING: 10,
    RESREF: 11,
    LOCALIZED_STRING: 12,
    BINARY: 13,
    STRUCT: 14,
    LIST: 15,
    VECTOR4: 16,
    VECTOR3: 17,

    0: "UINT8",
    1: "INT8",
    2: "UINT16",
    3: "INT16",
    4: "UINT32",
    5: "INT32",
    6: "UINT64",
    7: "INT64",
    8: "SINGLE",
    9: "DOUBLE",
    10: "STRING",
    11: "RESREF",
    12: "LOCALIZED_STRING",
    13: "BINARY",
    14: "STRUCT",
    15: "LIST",
    16: "VECTOR4",
    17: "VECTOR3",
  });

  function Gff(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Gff.prototype._read = function() {
    this.header = new GffHeader(this._io, this, this._root);
  }

  var FieldArray = Gff.FieldArray = (function() {
    function FieldArray(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FieldArray.prototype._read = function() {
      this.entries = [];
      for (var i = 0; i < this._root.header.fieldCount; i++) {
        this.entries.push(new FieldEntry(this._io, this, this._root));
      }
    }

    /**
     * Array of field entries (12 bytes each)
     */

    return FieldArray;
  })();

  var FieldData = Gff.FieldData = (function() {
    function FieldData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FieldData.prototype._read = function() {
      this.rawData = this._io.readBytes(this._root.header.fieldDataCount);
    }

    /**
     * Raw field data storage. Individual field data entries are accessed via
     * field_entry.field_data_offset_value offsets. The structure of each entry
     * depends on the field_type:
     * - UInt64/Int64/Double: 8 bytes
     * - String: 4-byte length + string bytes
     * - ResRef: 1-byte length + string bytes (max 16)
     * - LocalizedString: variable (see bioware_common::bioware_locstring type)
     * - Binary: 4-byte length + binary bytes
     * - Vector3: 12 bytes (3×float)
     * - Vector4: 16 bytes (4×float)
     */

    return FieldData;
  })();

  var FieldEntry = Gff.FieldEntry = (function() {
    function FieldEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FieldEntry.prototype._read = function() {
      this.fieldType = this._io.readU4le();
      this.labelIndex = this._io.readU4le();
      this.dataOrOffset = this._io.readU4le();
    }

    /**
     * Absolute file offset to field data for complex types
     */
    Object.defineProperty(FieldEntry.prototype, 'fieldDataOffsetValue', {
      get: function() {
        if (this._m_fieldDataOffsetValue !== undefined)
          return this._m_fieldDataOffsetValue;
        if (this.isComplexType) {
          this._m_fieldDataOffsetValue = this._root.header.fieldDataOffset + this.dataOrOffset;
        }
        return this._m_fieldDataOffsetValue;
      }
    });

    /**
     * True if field stores data in field_data section
     */
    Object.defineProperty(FieldEntry.prototype, 'isComplexType', {
      get: function() {
        if (this._m_isComplexType !== undefined)
          return this._m_isComplexType;
        this._m_isComplexType =  ((this.fieldType == Gff.GffFieldType.UINT64) || (this.fieldType == Gff.GffFieldType.INT64) || (this.fieldType == Gff.GffFieldType.DOUBLE) || (this.fieldType == Gff.GffFieldType.STRING) || (this.fieldType == Gff.GffFieldType.RESREF) || (this.fieldType == Gff.GffFieldType.LOCALIZED_STRING) || (this.fieldType == Gff.GffFieldType.BINARY) || (this.fieldType == Gff.GffFieldType.VECTOR4) || (this.fieldType == Gff.GffFieldType.VECTOR3)) ;
        return this._m_isComplexType;
      }
    });

    /**
     * True if field is a list of structs
     */
    Object.defineProperty(FieldEntry.prototype, 'isListType', {
      get: function() {
        if (this._m_isListType !== undefined)
          return this._m_isListType;
        this._m_isListType = this.fieldType == Gff.GffFieldType.LIST;
        return this._m_isListType;
      }
    });

    /**
     * True if field stores data inline (simple types)
     */
    Object.defineProperty(FieldEntry.prototype, 'isSimpleType', {
      get: function() {
        if (this._m_isSimpleType !== undefined)
          return this._m_isSimpleType;
        this._m_isSimpleType =  ((this.fieldType == Gff.GffFieldType.UINT8) || (this.fieldType == Gff.GffFieldType.INT8) || (this.fieldType == Gff.GffFieldType.UINT16) || (this.fieldType == Gff.GffFieldType.INT16) || (this.fieldType == Gff.GffFieldType.UINT32) || (this.fieldType == Gff.GffFieldType.INT32) || (this.fieldType == Gff.GffFieldType.SINGLE)) ;
        return this._m_isSimpleType;
      }
    });

    /**
     * True if field is a nested struct
     */
    Object.defineProperty(FieldEntry.prototype, 'isStructType', {
      get: function() {
        if (this._m_isStructType !== undefined)
          return this._m_isStructType;
        this._m_isStructType = this.fieldType == Gff.GffFieldType.STRUCT;
        return this._m_isStructType;
      }
    });

    /**
     * Absolute file offset to list indices for list type fields
     */
    Object.defineProperty(FieldEntry.prototype, 'listIndicesOffsetValue', {
      get: function() {
        if (this._m_listIndicesOffsetValue !== undefined)
          return this._m_listIndicesOffsetValue;
        if (this.isListType) {
          this._m_listIndicesOffsetValue = this._root.header.listIndicesOffset + this.dataOrOffset;
        }
        return this._m_listIndicesOffsetValue;
      }
    });

    /**
     * Struct index for struct type fields
     */
    Object.defineProperty(FieldEntry.prototype, 'structIndexValue', {
      get: function() {
        if (this._m_structIndexValue !== undefined)
          return this._m_structIndexValue;
        if (this.isStructType) {
          this._m_structIndexValue = this.dataOrOffset;
        }
        return this._m_structIndexValue;
      }
    });

    /**
     * Field data type (see gff_field_type enum):
     * - 0-5, 8: Simple types (stored inline in data_or_offset)
     * - 6-7, 9-13, 16-17: Complex types (offset to field_data in data_or_offset)
     * - 14: Struct (struct index in data_or_offset)
     * - 15: List (offset to list_indices_array in data_or_offset)
     */

    /**
     * Index into label_array for field name
     */

    /**
     * Inline data (simple types) or offset/index (complex types):
     * - Simple types (0-5, 8): Value stored directly (1-4 bytes, sign/zero extended to 4 bytes)
     * - Complex types (6-7, 9-13, 16-17): Byte offset into field_data section (relative to field_data_offset)
     * - Struct (14): Struct index (index into struct_array)
     * - List (15): Byte offset into list_indices_array (relative to list_indices_offset)
     */

    return FieldEntry;
  })();

  var FieldIndicesArray = Gff.FieldIndicesArray = (function() {
    function FieldIndicesArray(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FieldIndicesArray.prototype._read = function() {
      this.indices = [];
      for (var i = 0; i < this._root.header.fieldIndicesCount; i++) {
        this.indices.push(this._io.readU4le());
      }
    }

    /**
     * Array of field indices. When a struct has multiple fields, it stores an offset
     * into this array, and the next N consecutive u4 values (where N = struct.field_count)
     * are the field indices for that struct.
     */

    return FieldIndicesArray;
  })();

  var GffHeader = Gff.GffHeader = (function() {
    function GffHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    GffHeader.prototype._read = function() {
      this.fileType = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.fileVersion = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.structOffset = this._io.readU4le();
      this.structCount = this._io.readU4le();
      this.fieldOffset = this._io.readU4le();
      this.fieldCount = this._io.readU4le();
      this.labelOffset = this._io.readU4le();
      this.labelCount = this._io.readU4le();
      this.fieldDataOffset = this._io.readU4le();
      this.fieldDataCount = this._io.readU4le();
      this.fieldIndicesOffset = this._io.readU4le();
      this.fieldIndicesCount = this._io.readU4le();
      this.listIndicesOffset = this._io.readU4le();
      this.listIndicesCount = this._io.readU4le();
    }

    /**
     * File type signature (FourCC). Examples: "GFF ", "UTC ", "UTI ", "DLG ", "ARE ", etc.
     * Must match a valid GFFContent enum value.
     */

    /**
     * File format version. Must be "V3.2" for KotOR games.
     * Later BioWare games use "V3.3", "V4.0", or "V4.1".
     * Valid values: "V3.2" (KotOR), "V3.3", "V4.0", "V4.1" (other BioWare games)
     */

    /**
     * Byte offset to struct array from beginning of file
     */

    /**
     * Number of struct entries in struct array
     */

    /**
     * Byte offset to field array from beginning of file
     */

    /**
     * Number of field entries in field array
     */

    /**
     * Byte offset to label array from beginning of file
     */

    /**
     * Number of labels in label array
     */

    /**
     * Byte offset to field data section from beginning of file
     */

    /**
     * Size of field data section in bytes
     */

    /**
     * Byte offset to field indices array from beginning of file
     */

    /**
     * Number of field indices (total count across all structs with multiple fields)
     */

    /**
     * Byte offset to list indices array from beginning of file
     */

    /**
     * Number of list indices entries
     */

    return GffHeader;
  })();

  var LabelArray = Gff.LabelArray = (function() {
    function LabelArray(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    LabelArray.prototype._read = function() {
      this.labels = [];
      for (var i = 0; i < this._root.header.labelCount; i++) {
        this.labels.push(new LabelEntry(this._io, this, this._root));
      }
    }

    /**
     * Array of label entries (16 bytes each)
     */

    return LabelArray;
  })();

  var LabelEntry = Gff.LabelEntry = (function() {
    function LabelEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    LabelEntry.prototype._read = function() {
      this.name = KaitaiStream.bytesToStr(this._io.readBytes(16), "ASCII");
    }

    /**
     * Field name label (null-padded to 16 bytes, null-terminated).
     * The actual label length is determined by the first null byte.
     * Application code should trim trailing null bytes when using this field.
     */

    return LabelEntry;
  })();

  /**
   * Label entry as a null-terminated ASCII string within a fixed 16-byte field.
   * This avoids leaking trailing `\0` bytes into generated-code consumers.
   */

  var LabelEntryTerminated = Gff.LabelEntryTerminated = (function() {
    function LabelEntryTerminated(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    LabelEntryTerminated.prototype._read = function() {
      this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(16), 0, false), "ASCII");
    }

    return LabelEntryTerminated;
  })();

  var ListEntry = Gff.ListEntry = (function() {
    function ListEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ListEntry.prototype._read = function() {
      this.numStructIndices = this._io.readU4le();
      this.structIndices = [];
      for (var i = 0; i < this.numStructIndices; i++) {
        this.structIndices.push(this._io.readU4le());
      }
    }

    /**
     * Number of struct indices in this list
     */

    /**
     * Array of struct indices (indices into struct_array)
     */

    return ListEntry;
  })();

  var ListIndicesArray = Gff.ListIndicesArray = (function() {
    function ListIndicesArray(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ListIndicesArray.prototype._read = function() {
      this.rawData = this._io.readBytes(this._root.header.listIndicesCount);
    }

    /**
     * Raw list indices data. List entries are accessed via offsets stored in
     * list-type field entries (field_entry.list_indices_offset_value).
     * Each entry starts with a count (u4), followed by that many struct indices (u4 each).
     * 
     * Note: This is a raw data block. In practice, list entries are accessed via
     * offsets stored in list-type field entries, not as a sequential array.
     * Use list_entry type to parse individual entries at specific offsets.
     */

    return ListIndicesArray;
  })();

  /**
   * A decoded field: includes resolved label string and decoded typed value.
   * Exactly one `value_*` instance (or one of `value_struct` / `list_*`) will be non-null.
   */

  var ResolvedField = Gff.ResolvedField = (function() {
    function ResolvedField(_io, _parent, _root, fieldIndex) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.fieldIndex = fieldIndex;

      this._read();
    }
    ResolvedField.prototype._read = function() {
    }

    /**
     * Raw field entry at field_index
     */
    Object.defineProperty(ResolvedField.prototype, 'entry', {
      get: function() {
        if (this._m_entry !== undefined)
          return this._m_entry;
        var _pos = this._io.pos;
        this._io.seek(this._root.header.fieldOffset + this.fieldIndex * 12);
        this._m_entry = new FieldEntry(this._io, this, this._root);
        this._io.seek(_pos);
        return this._m_entry;
      }
    });

    /**
     * Absolute file offset of this field entry (start of 12-byte record)
     */
    Object.defineProperty(ResolvedField.prototype, 'fieldEntryPos', {
      get: function() {
        if (this._m_fieldEntryPos !== undefined)
          return this._m_fieldEntryPos;
        this._m_fieldEntryPos = this._root.header.fieldOffset + this.fieldIndex * 12;
        return this._m_fieldEntryPos;
      }
    });

    /**
     * Resolved field label string
     */
    Object.defineProperty(ResolvedField.prototype, 'label', {
      get: function() {
        if (this._m_label !== undefined)
          return this._m_label;
        var _pos = this._io.pos;
        this._io.seek(this._root.header.labelOffset + this.entry.labelIndex * 16);
        this._m_label = new LabelEntryTerminated(this._io, this, this._root);
        this._io.seek(_pos);
        return this._m_label;
      }
    });

    /**
     * Parsed list entry at offset (list indices)
     */
    Object.defineProperty(ResolvedField.prototype, 'listEntry', {
      get: function() {
        if (this._m_listEntry !== undefined)
          return this._m_listEntry;
        if (this.entry.fieldType == Gff.GffFieldType.LIST) {
          var _pos = this._io.pos;
          this._io.seek(this._root.header.listIndicesOffset + this.entry.dataOrOffset);
          this._m_listEntry = new ListEntry(this._io, this, this._root);
          this._io.seek(_pos);
        }
        return this._m_listEntry;
      }
    });

    /**
     * Resolved structs referenced by this list
     */
    Object.defineProperty(ResolvedField.prototype, 'listStructs', {
      get: function() {
        if (this._m_listStructs !== undefined)
          return this._m_listStructs;
        if (this.entry.fieldType == Gff.GffFieldType.LIST) {
          this._m_listStructs = [];
          for (var i = 0; i < this.listEntry.numStructIndices; i++) {
            this._m_listStructs.push(new ResolvedStruct(this._io, this, this._root, this.listEntry.structIndices[i]));
          }
        }
        return this._m_listStructs;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueBinary', {
      get: function() {
        if (this._m_valueBinary !== undefined)
          return this._m_valueBinary;
        if (this.entry.fieldType == Gff.GffFieldType.BINARY) {
          var _pos = this._io.pos;
          this._io.seek(this._root.header.fieldDataOffset + this.entry.dataOrOffset);
          this._m_valueBinary = new BiowareCommon_.BiowareCommon.BiowareBinaryData(this._io, null, null);
          this._io.seek(_pos);
        }
        return this._m_valueBinary;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueDouble', {
      get: function() {
        if (this._m_valueDouble !== undefined)
          return this._m_valueDouble;
        if (this.entry.fieldType == Gff.GffFieldType.DOUBLE) {
          var _pos = this._io.pos;
          this._io.seek(this._root.header.fieldDataOffset + this.entry.dataOrOffset);
          this._m_valueDouble = this._io.readF8le();
          this._io.seek(_pos);
        }
        return this._m_valueDouble;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueInt16', {
      get: function() {
        if (this._m_valueInt16 !== undefined)
          return this._m_valueInt16;
        if (this.entry.fieldType == Gff.GffFieldType.INT16) {
          var _pos = this._io.pos;
          this._io.seek(this.fieldEntryPos + 8);
          this._m_valueInt16 = this._io.readS2le();
          this._io.seek(_pos);
        }
        return this._m_valueInt16;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueInt32', {
      get: function() {
        if (this._m_valueInt32 !== undefined)
          return this._m_valueInt32;
        if (this.entry.fieldType == Gff.GffFieldType.INT32) {
          var _pos = this._io.pos;
          this._io.seek(this.fieldEntryPos + 8);
          this._m_valueInt32 = this._io.readS4le();
          this._io.seek(_pos);
        }
        return this._m_valueInt32;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueInt64', {
      get: function() {
        if (this._m_valueInt64 !== undefined)
          return this._m_valueInt64;
        if (this.entry.fieldType == Gff.GffFieldType.INT64) {
          var _pos = this._io.pos;
          this._io.seek(this._root.header.fieldDataOffset + this.entry.dataOrOffset);
          this._m_valueInt64 = this._io.readS8le();
          this._io.seek(_pos);
        }
        return this._m_valueInt64;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueInt8', {
      get: function() {
        if (this._m_valueInt8 !== undefined)
          return this._m_valueInt8;
        if (this.entry.fieldType == Gff.GffFieldType.INT8) {
          var _pos = this._io.pos;
          this._io.seek(this.fieldEntryPos + 8);
          this._m_valueInt8 = this._io.readS1();
          this._io.seek(_pos);
        }
        return this._m_valueInt8;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueLocalizedString', {
      get: function() {
        if (this._m_valueLocalizedString !== undefined)
          return this._m_valueLocalizedString;
        if (this.entry.fieldType == Gff.GffFieldType.LOCALIZED_STRING) {
          var _pos = this._io.pos;
          this._io.seek(this._root.header.fieldDataOffset + this.entry.dataOrOffset);
          this._m_valueLocalizedString = new BiowareCommon_.BiowareCommon.BiowareLocstring(this._io, null, null);
          this._io.seek(_pos);
        }
        return this._m_valueLocalizedString;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueResref', {
      get: function() {
        if (this._m_valueResref !== undefined)
          return this._m_valueResref;
        if (this.entry.fieldType == Gff.GffFieldType.RESREF) {
          var _pos = this._io.pos;
          this._io.seek(this._root.header.fieldDataOffset + this.entry.dataOrOffset);
          this._m_valueResref = new BiowareCommon_.BiowareCommon.BiowareResref(this._io, null, null);
          this._io.seek(_pos);
        }
        return this._m_valueResref;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueSingle', {
      get: function() {
        if (this._m_valueSingle !== undefined)
          return this._m_valueSingle;
        if (this.entry.fieldType == Gff.GffFieldType.SINGLE) {
          var _pos = this._io.pos;
          this._io.seek(this.fieldEntryPos + 8);
          this._m_valueSingle = this._io.readF4le();
          this._io.seek(_pos);
        }
        return this._m_valueSingle;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueString', {
      get: function() {
        if (this._m_valueString !== undefined)
          return this._m_valueString;
        if (this.entry.fieldType == Gff.GffFieldType.STRING) {
          var _pos = this._io.pos;
          this._io.seek(this._root.header.fieldDataOffset + this.entry.dataOrOffset);
          this._m_valueString = new BiowareCommon_.BiowareCommon.BiowareCexoString(this._io, null, null);
          this._io.seek(_pos);
        }
        return this._m_valueString;
      }
    });

    /**
     * Nested struct (struct index = entry.data_or_offset)
     */
    Object.defineProperty(ResolvedField.prototype, 'valueStruct', {
      get: function() {
        if (this._m_valueStruct !== undefined)
          return this._m_valueStruct;
        if (this.entry.fieldType == Gff.GffFieldType.STRUCT) {
          this._m_valueStruct = new ResolvedStruct(this._io, this, this._root, this.entry.dataOrOffset);
        }
        return this._m_valueStruct;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueUint16', {
      get: function() {
        if (this._m_valueUint16 !== undefined)
          return this._m_valueUint16;
        if (this.entry.fieldType == Gff.GffFieldType.UINT16) {
          var _pos = this._io.pos;
          this._io.seek(this.fieldEntryPos + 8);
          this._m_valueUint16 = this._io.readU2le();
          this._io.seek(_pos);
        }
        return this._m_valueUint16;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueUint32', {
      get: function() {
        if (this._m_valueUint32 !== undefined)
          return this._m_valueUint32;
        if (this.entry.fieldType == Gff.GffFieldType.UINT32) {
          var _pos = this._io.pos;
          this._io.seek(this.fieldEntryPos + 8);
          this._m_valueUint32 = this._io.readU4le();
          this._io.seek(_pos);
        }
        return this._m_valueUint32;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueUint64', {
      get: function() {
        if (this._m_valueUint64 !== undefined)
          return this._m_valueUint64;
        if (this.entry.fieldType == Gff.GffFieldType.UINT64) {
          var _pos = this._io.pos;
          this._io.seek(this._root.header.fieldDataOffset + this.entry.dataOrOffset);
          this._m_valueUint64 = this._io.readU8le();
          this._io.seek(_pos);
        }
        return this._m_valueUint64;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueUint8', {
      get: function() {
        if (this._m_valueUint8 !== undefined)
          return this._m_valueUint8;
        if (this.entry.fieldType == Gff.GffFieldType.UINT8) {
          var _pos = this._io.pos;
          this._io.seek(this.fieldEntryPos + 8);
          this._m_valueUint8 = this._io.readU1();
          this._io.seek(_pos);
        }
        return this._m_valueUint8;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueVector3', {
      get: function() {
        if (this._m_valueVector3 !== undefined)
          return this._m_valueVector3;
        if (this.entry.fieldType == Gff.GffFieldType.VECTOR3) {
          var _pos = this._io.pos;
          this._io.seek(this._root.header.fieldDataOffset + this.entry.dataOrOffset);
          this._m_valueVector3 = new BiowareCommon_.BiowareCommon.BiowareVector3(this._io, null, null);
          this._io.seek(_pos);
        }
        return this._m_valueVector3;
      }
    });
    Object.defineProperty(ResolvedField.prototype, 'valueVector4', {
      get: function() {
        if (this._m_valueVector4 !== undefined)
          return this._m_valueVector4;
        if (this.entry.fieldType == Gff.GffFieldType.VECTOR4) {
          var _pos = this._io.pos;
          this._io.seek(this._root.header.fieldDataOffset + this.entry.dataOrOffset);
          this._m_valueVector4 = new BiowareCommon_.BiowareCommon.BiowareVector4(this._io, null, null);
          this._io.seek(_pos);
        }
        return this._m_valueVector4;
      }
    });

    /**
     * Index into field_array
     */

    return ResolvedField;
  })();

  /**
   * A decoded struct node: resolves field indices -> field entries -> typed values,
   * and recursively resolves nested structs and lists.
   */

  var ResolvedStruct = Gff.ResolvedStruct = (function() {
    function ResolvedStruct(_io, _parent, _root, structIndex) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.structIndex = structIndex;

      this._read();
    }
    ResolvedStruct.prototype._read = function() {
    }

    /**
     * Raw struct entry at struct_index
     */
    Object.defineProperty(ResolvedStruct.prototype, 'entry', {
      get: function() {
        if (this._m_entry !== undefined)
          return this._m_entry;
        var _pos = this._io.pos;
        this._io.seek(this._root.header.structOffset + this.structIndex * 12);
        this._m_entry = new StructEntry(this._io, this, this._root);
        this._io.seek(_pos);
        return this._m_entry;
      }
    });

    /**
     * Field indices for this struct (only present when field_count > 1).
     * When field_count == 1, the single field index is stored directly in entry.data_or_offset.
     */
    Object.defineProperty(ResolvedStruct.prototype, 'fieldIndices', {
      get: function() {
        if (this._m_fieldIndices !== undefined)
          return this._m_fieldIndices;
        if (this.entry.fieldCount > 1) {
          var _pos = this._io.pos;
          this._io.seek(this._root.header.fieldIndicesOffset + this.entry.dataOrOffset);
          this._m_fieldIndices = [];
          for (var i = 0; i < this.entry.fieldCount; i++) {
            this._m_fieldIndices.push(this._io.readU4le());
          }
          this._io.seek(_pos);
        }
        return this._m_fieldIndices;
      }
    });

    /**
     * Resolved fields (multi-field struct)
     */
    Object.defineProperty(ResolvedStruct.prototype, 'fields', {
      get: function() {
        if (this._m_fields !== undefined)
          return this._m_fields;
        if (this.entry.fieldCount > 1) {
          this._m_fields = [];
          for (var i = 0; i < this.entry.fieldCount; i++) {
            this._m_fields.push(new ResolvedField(this._io, this, this._root, this.fieldIndices[i]));
          }
        }
        return this._m_fields;
      }
    });

    /**
     * Resolved field (single-field struct)
     */
    Object.defineProperty(ResolvedStruct.prototype, 'singleField', {
      get: function() {
        if (this._m_singleField !== undefined)
          return this._m_singleField;
        if (this.entry.fieldCount == 1) {
          this._m_singleField = new ResolvedField(this._io, this, this._root, this.entry.dataOrOffset);
        }
        return this._m_singleField;
      }
    });

    /**
     * Index into struct_array
     */

    return ResolvedStruct;
  })();

  var StructArray = Gff.StructArray = (function() {
    function StructArray(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    StructArray.prototype._read = function() {
      this.entries = [];
      for (var i = 0; i < this._root.header.structCount; i++) {
        this.entries.push(new StructEntry(this._io, this, this._root));
      }
    }

    /**
     * Array of struct entries (12 bytes each)
     */

    return StructArray;
  })();

  var StructEntry = Gff.StructEntry = (function() {
    function StructEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    StructEntry.prototype._read = function() {
      this.structId = this._io.readS4le();
      this.dataOrOffset = this._io.readU4le();
      this.fieldCount = this._io.readU4le();
    }

    /**
     * Byte offset into field_indices_array when struct has multiple fields
     */
    Object.defineProperty(StructEntry.prototype, 'fieldIndicesOffset', {
      get: function() {
        if (this._m_fieldIndicesOffset !== undefined)
          return this._m_fieldIndicesOffset;
        if (this.hasMultipleFields) {
          this._m_fieldIndicesOffset = this.dataOrOffset;
        }
        return this._m_fieldIndicesOffset;
      }
    });

    /**
     * True if struct has multiple fields (offset to field indices in data_or_offset)
     */
    Object.defineProperty(StructEntry.prototype, 'hasMultipleFields', {
      get: function() {
        if (this._m_hasMultipleFields !== undefined)
          return this._m_hasMultipleFields;
        this._m_hasMultipleFields = this.fieldCount > 1;
        return this._m_hasMultipleFields;
      }
    });

    /**
     * True if struct has exactly one field (direct field index in data_or_offset)
     */
    Object.defineProperty(StructEntry.prototype, 'hasSingleField', {
      get: function() {
        if (this._m_hasSingleField !== undefined)
          return this._m_hasSingleField;
        this._m_hasSingleField = this.fieldCount == 1;
        return this._m_hasSingleField;
      }
    });

    /**
     * Direct field index when struct has exactly one field
     */
    Object.defineProperty(StructEntry.prototype, 'singleFieldIndex', {
      get: function() {
        if (this._m_singleFieldIndex !== undefined)
          return this._m_singleFieldIndex;
        if (this.hasSingleField) {
          this._m_singleFieldIndex = this.dataOrOffset;
        }
        return this._m_singleFieldIndex;
      }
    });

    /**
     * Structure type identifier. Often 0xFFFFFFFF (-1) for generic structs.
     * Used to identify struct types in schema-aware parsers.
     */

    /**
     * Field index (if field_count == 1) or byte offset to field indices array (if field_count > 1).
     * If field_count == 0, this value is unused.
     */

    /**
     * Number of fields in this struct:
     * - 0: No fields
     * - 1: Single field, data_or_offset contains the field index directly
     * - >1: Multiple fields, data_or_offset contains byte offset into field_indices_array
     */

    return StructEntry;
  })();

  /**
   * Array of field entries (12 bytes each)
   */
  Object.defineProperty(Gff.prototype, 'fieldArray', {
    get: function() {
      if (this._m_fieldArray !== undefined)
        return this._m_fieldArray;
      if (this.header.fieldCount > 0) {
        var _pos = this._io.pos;
        this._io.seek(this.header.fieldOffset);
        this._m_fieldArray = new FieldArray(this._io, this, this._root);
        this._io.seek(_pos);
      }
      return this._m_fieldArray;
    }
  });

  /**
   * Storage area for complex field types (strings, binary, vectors, etc.)
   */
  Object.defineProperty(Gff.prototype, 'fieldData', {
    get: function() {
      if (this._m_fieldData !== undefined)
        return this._m_fieldData;
      if (this.header.fieldDataCount > 0) {
        var _pos = this._io.pos;
        this._io.seek(this.header.fieldDataOffset);
        this._m_fieldData = new FieldData(this._io, this, this._root);
        this._io.seek(_pos);
      }
      return this._m_fieldData;
    }
  });

  /**
   * Array of field index arrays (used when structs have multiple fields)
   */
  Object.defineProperty(Gff.prototype, 'fieldIndicesArray', {
    get: function() {
      if (this._m_fieldIndicesArray !== undefined)
        return this._m_fieldIndicesArray;
      if (this.header.fieldIndicesCount > 0) {
        var _pos = this._io.pos;
        this._io.seek(this.header.fieldIndicesOffset);
        this._m_fieldIndicesArray = new FieldIndicesArray(this._io, this, this._root);
        this._io.seek(_pos);
      }
      return this._m_fieldIndicesArray;
    }
  });

  /**
   * Array of 16-byte null-padded field name labels
   */
  Object.defineProperty(Gff.prototype, 'labelArray', {
    get: function() {
      if (this._m_labelArray !== undefined)
        return this._m_labelArray;
      if (this.header.labelCount > 0) {
        var _pos = this._io.pos;
        this._io.seek(this.header.labelOffset);
        this._m_labelArray = new LabelArray(this._io, this, this._root);
        this._io.seek(_pos);
      }
      return this._m_labelArray;
    }
  });

  /**
   * Array of list entry structures (count + struct indices)
   */
  Object.defineProperty(Gff.prototype, 'listIndicesArray', {
    get: function() {
      if (this._m_listIndicesArray !== undefined)
        return this._m_listIndicesArray;
      if (this.header.listIndicesCount > 0) {
        var _pos = this._io.pos;
        this._io.seek(this.header.listIndicesOffset);
        this._m_listIndicesArray = new ListIndicesArray(this._io, this, this._root);
        this._io.seek(_pos);
      }
      return this._m_listIndicesArray;
    }
  });

  /**
   * Convenience "decoded" view of the root struct (struct_array[0]).
   * This resolves field indices to field entries, resolves labels to strings,
   * and decodes field values (including nested structs and lists) into typed instances.
   */
  Object.defineProperty(Gff.prototype, 'rootStructResolved', {
    get: function() {
      if (this._m_rootStructResolved !== undefined)
        return this._m_rootStructResolved;
      this._m_rootStructResolved = new ResolvedStruct(this._io, this, this._root, 0);
      return this._m_rootStructResolved;
    }
  });

  /**
   * Array of struct entries (12 bytes each)
   */
  Object.defineProperty(Gff.prototype, 'structArray', {
    get: function() {
      if (this._m_structArray !== undefined)
        return this._m_structArray;
      if (this.header.structCount > 0) {
        var _pos = this._io.pos;
        this._io.seek(this.header.structOffset);
        this._m_structArray = new StructArray(this._io, this, this._root);
        this._io.seek(_pos);
      }
      return this._m_structArray;
    }
  });

  /**
   * GFF file header (56 bytes total)
   */

  return Gff;
})();
Gff_.Gff = Gff;
});
