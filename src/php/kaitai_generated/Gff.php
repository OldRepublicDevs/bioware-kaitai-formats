<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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

namespace {
    class Gff extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Gff $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \Gff\GffHeader($this->_io, $this, $this->_root);
        }
        protected $_m_fieldArray;

        /**
         * Array of field entries (12 bytes each)
         */
        public function fieldArray() {
            if ($this->_m_fieldArray !== null)
                return $this->_m_fieldArray;
            if ($this->header()->fieldCount() > 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->header()->fieldOffset());
                $this->_m_fieldArray = new \Gff\FieldArray($this->_io, $this, $this->_root);
                $this->_io->seek($_pos);
            }
            return $this->_m_fieldArray;
        }
        protected $_m_fieldData;

        /**
         * Storage area for complex field types (strings, binary, vectors, etc.)
         */
        public function fieldData() {
            if ($this->_m_fieldData !== null)
                return $this->_m_fieldData;
            if ($this->header()->fieldDataCount() > 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->header()->fieldDataOffset());
                $this->_m_fieldData = new \Gff\FieldData($this->_io, $this, $this->_root);
                $this->_io->seek($_pos);
            }
            return $this->_m_fieldData;
        }
        protected $_m_fieldIndicesArray;

        /**
         * Array of field index arrays (used when structs have multiple fields)
         */
        public function fieldIndicesArray() {
            if ($this->_m_fieldIndicesArray !== null)
                return $this->_m_fieldIndicesArray;
            if ($this->header()->fieldIndicesCount() > 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->header()->fieldIndicesOffset());
                $this->_m_fieldIndicesArray = new \Gff\FieldIndicesArray($this->_io, $this, $this->_root);
                $this->_io->seek($_pos);
            }
            return $this->_m_fieldIndicesArray;
        }
        protected $_m_labelArray;

        /**
         * Array of 16-byte null-padded field name labels
         */
        public function labelArray() {
            if ($this->_m_labelArray !== null)
                return $this->_m_labelArray;
            if ($this->header()->labelCount() > 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->header()->labelOffset());
                $this->_m_labelArray = new \Gff\LabelArray($this->_io, $this, $this->_root);
                $this->_io->seek($_pos);
            }
            return $this->_m_labelArray;
        }
        protected $_m_listIndicesArray;

        /**
         * Array of list entry structures (count + struct indices)
         */
        public function listIndicesArray() {
            if ($this->_m_listIndicesArray !== null)
                return $this->_m_listIndicesArray;
            if ($this->header()->listIndicesCount() > 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->header()->listIndicesOffset());
                $this->_m_listIndicesArray = new \Gff\ListIndicesArray($this->_io, $this, $this->_root);
                $this->_io->seek($_pos);
            }
            return $this->_m_listIndicesArray;
        }
        protected $_m_structArray;

        /**
         * Array of struct entries (12 bytes each)
         */
        public function structArray() {
            if ($this->_m_structArray !== null)
                return $this->_m_structArray;
            if ($this->header()->structCount() > 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->header()->structOffset());
                $this->_m_structArray = new \Gff\StructArray($this->_io, $this, $this->_root);
                $this->_io->seek($_pos);
            }
            return $this->_m_structArray;
        }
        protected $_m_header;

        /**
         * GFF file header (56 bytes total)
         */
        public function header() { return $this->_m_header; }
    }
}

namespace Gff {
    class FieldArray extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gff $_parent = null, ?\Gff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $n = $this->_root()->header()->fieldCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_entries[] = new \Gff\FieldEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_entries;

        /**
         * Array of field entries (12 bytes each)
         */
        public function entries() { return $this->_m_entries; }
    }
}

namespace Gff {
    class FieldData extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gff $_parent = null, ?\Gff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_rawData = $this->_io->readBytes($this->_root()->header()->fieldDataCount());
        }
        protected $_m_rawData;

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
        public function rawData() { return $this->_m_rawData; }
    }
}

namespace Gff {
    class FieldEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gff\FieldArray $_parent = null, ?\Gff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fieldType = $this->_io->readU4le();
            $this->_m_labelIndex = $this->_io->readU4le();
            $this->_m_dataOrOffset = $this->_io->readU4le();
        }
        protected $_m_fieldDataOffsetValue;

        /**
         * Absolute file offset to field data for complex types
         */
        public function fieldDataOffsetValue() {
            if ($this->_m_fieldDataOffsetValue !== null)
                return $this->_m_fieldDataOffsetValue;
            if ($this->isComplexType()) {
                $this->_m_fieldDataOffsetValue = $this->_root()->header()->fieldDataOffset() + $this->dataOrOffset();
            }
            return $this->_m_fieldDataOffsetValue;
        }
        protected $_m_isComplexType;

        /**
         * True if field stores data in field_data section
         */
        public function isComplexType() {
            if ($this->_m_isComplexType !== null)
                return $this->_m_isComplexType;
            $this->_m_isComplexType =  (($this->fieldType() == \Gff\GffFieldType::UINT64) || ($this->fieldType() == \Gff\GffFieldType::INT64) || ($this->fieldType() == \Gff\GffFieldType::DOUBLE) || ($this->fieldType() == \Gff\GffFieldType::STRING) || ($this->fieldType() == \Gff\GffFieldType::RESREF) || ($this->fieldType() == \Gff\GffFieldType::LOCALIZED_STRING) || ($this->fieldType() == \Gff\GffFieldType::BINARY) || ($this->fieldType() == \Gff\GffFieldType::VECTOR4) || ($this->fieldType() == \Gff\GffFieldType::VECTOR3)) ;
            return $this->_m_isComplexType;
        }
        protected $_m_isListType;

        /**
         * True if field is a list of structs
         */
        public function isListType() {
            if ($this->_m_isListType !== null)
                return $this->_m_isListType;
            $this->_m_isListType = $this->fieldType() == \Gff\GffFieldType::LIST;
            return $this->_m_isListType;
        }
        protected $_m_isSimpleType;

        /**
         * True if field stores data inline (simple types)
         */
        public function isSimpleType() {
            if ($this->_m_isSimpleType !== null)
                return $this->_m_isSimpleType;
            $this->_m_isSimpleType =  (($this->fieldType() == \Gff\GffFieldType::UINT8) || ($this->fieldType() == \Gff\GffFieldType::INT8) || ($this->fieldType() == \Gff\GffFieldType::UINT16) || ($this->fieldType() == \Gff\GffFieldType::INT16) || ($this->fieldType() == \Gff\GffFieldType::UINT32) || ($this->fieldType() == \Gff\GffFieldType::INT32) || ($this->fieldType() == \Gff\GffFieldType::SINGLE)) ;
            return $this->_m_isSimpleType;
        }
        protected $_m_isStructType;

        /**
         * True if field is a nested struct
         */
        public function isStructType() {
            if ($this->_m_isStructType !== null)
                return $this->_m_isStructType;
            $this->_m_isStructType = $this->fieldType() == \Gff\GffFieldType::STRUCT;
            return $this->_m_isStructType;
        }
        protected $_m_listIndicesOffsetValue;

        /**
         * Absolute file offset to list indices for list type fields
         */
        public function listIndicesOffsetValue() {
            if ($this->_m_listIndicesOffsetValue !== null)
                return $this->_m_listIndicesOffsetValue;
            if ($this->isListType()) {
                $this->_m_listIndicesOffsetValue = $this->_root()->header()->listIndicesOffset() + $this->dataOrOffset();
            }
            return $this->_m_listIndicesOffsetValue;
        }
        protected $_m_structIndexValue;

        /**
         * Struct index for struct type fields
         */
        public function structIndexValue() {
            if ($this->_m_structIndexValue !== null)
                return $this->_m_structIndexValue;
            if ($this->isStructType()) {
                $this->_m_structIndexValue = $this->dataOrOffset();
            }
            return $this->_m_structIndexValue;
        }
        protected $_m_fieldType;
        protected $_m_labelIndex;
        protected $_m_dataOrOffset;

        /**
         * Field data type (see gff_field_type enum):
         * - 0-5, 8: Simple types (stored inline in data_or_offset)
         * - 6-7, 9-13, 16-17: Complex types (offset to field_data in data_or_offset)
         * - 14: Struct (struct index in data_or_offset)
         * - 15: List (offset to list_indices_array in data_or_offset)
         */
        public function fieldType() { return $this->_m_fieldType; }

        /**
         * Index into label_array for field name
         */
        public function labelIndex() { return $this->_m_labelIndex; }

        /**
         * Inline data (simple types) or offset/index (complex types):
         * - Simple types (0-5, 8): Value stored directly (1-4 bytes, sign/zero extended to 4 bytes)
         * - Complex types (6-7, 9-13, 16-17): Byte offset into field_data section (relative to field_data_offset)
         * - Struct (14): Struct index (index into struct_array)
         * - List (15): Byte offset into list_indices_array (relative to list_indices_offset)
         */
        public function dataOrOffset() { return $this->_m_dataOrOffset; }
    }
}

namespace Gff {
    class FieldIndicesArray extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gff $_parent = null, ?\Gff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_indices = [];
            $n = $this->_root()->header()->fieldIndicesCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_indices[] = $this->_io->readU4le();
            }
        }
        protected $_m_indices;

        /**
         * Array of field indices. When a struct has multiple fields, it stores an offset
         * into this array, and the next N consecutive u4 values (where N = struct.field_count)
         * are the field indices for that struct.
         */
        public function indices() { return $this->_m_indices; }
    }
}

namespace Gff {
    class GffHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gff $_parent = null, ?\Gff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fileType = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            $this->_m_fileVersion = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            $this->_m_structOffset = $this->_io->readU4le();
            $this->_m_structCount = $this->_io->readU4le();
            $this->_m_fieldOffset = $this->_io->readU4le();
            $this->_m_fieldCount = $this->_io->readU4le();
            $this->_m_labelOffset = $this->_io->readU4le();
            $this->_m_labelCount = $this->_io->readU4le();
            $this->_m_fieldDataOffset = $this->_io->readU4le();
            $this->_m_fieldDataCount = $this->_io->readU4le();
            $this->_m_fieldIndicesOffset = $this->_io->readU4le();
            $this->_m_fieldIndicesCount = $this->_io->readU4le();
            $this->_m_listIndicesOffset = $this->_io->readU4le();
            $this->_m_listIndicesCount = $this->_io->readU4le();
        }
        protected $_m_fileType;
        protected $_m_fileVersion;
        protected $_m_structOffset;
        protected $_m_structCount;
        protected $_m_fieldOffset;
        protected $_m_fieldCount;
        protected $_m_labelOffset;
        protected $_m_labelCount;
        protected $_m_fieldDataOffset;
        protected $_m_fieldDataCount;
        protected $_m_fieldIndicesOffset;
        protected $_m_fieldIndicesCount;
        protected $_m_listIndicesOffset;
        protected $_m_listIndicesCount;

        /**
         * File type signature (FourCC). Examples: "GFF ", "UTC ", "UTI ", "DLG ", "ARE ", etc.
         * Must match a valid GFFContent enum value.
         */
        public function fileType() { return $this->_m_fileType; }

        /**
         * File format version. Must be "V3.2" for KotOR games.
         * Later BioWare games use "V3.3", "V4.0", or "V4.1".
         * Valid values: "V3.2" (KotOR), "V3.3", "V4.0", "V4.1" (other BioWare games)
         */
        public function fileVersion() { return $this->_m_fileVersion; }

        /**
         * Byte offset to struct array from beginning of file
         */
        public function structOffset() { return $this->_m_structOffset; }

        /**
         * Number of struct entries in struct array
         */
        public function structCount() { return $this->_m_structCount; }

        /**
         * Byte offset to field array from beginning of file
         */
        public function fieldOffset() { return $this->_m_fieldOffset; }

        /**
         * Number of field entries in field array
         */
        public function fieldCount() { return $this->_m_fieldCount; }

        /**
         * Byte offset to label array from beginning of file
         */
        public function labelOffset() { return $this->_m_labelOffset; }

        /**
         * Number of labels in label array
         */
        public function labelCount() { return $this->_m_labelCount; }

        /**
         * Byte offset to field data section from beginning of file
         */
        public function fieldDataOffset() { return $this->_m_fieldDataOffset; }

        /**
         * Size of field data section in bytes
         */
        public function fieldDataCount() { return $this->_m_fieldDataCount; }

        /**
         * Byte offset to field indices array from beginning of file
         */
        public function fieldIndicesOffset() { return $this->_m_fieldIndicesOffset; }

        /**
         * Number of field indices (total count across all structs with multiple fields)
         */
        public function fieldIndicesCount() { return $this->_m_fieldIndicesCount; }

        /**
         * Byte offset to list indices array from beginning of file
         */
        public function listIndicesOffset() { return $this->_m_listIndicesOffset; }

        /**
         * Number of list indices entries
         */
        public function listIndicesCount() { return $this->_m_listIndicesCount; }
    }
}

namespace Gff {
    class LabelArray extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gff $_parent = null, ?\Gff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_labels = [];
            $n = $this->_root()->header()->labelCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_labels[] = new \Gff\LabelEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_labels;

        /**
         * Array of label entries (16 bytes each)
         */
        public function labels() { return $this->_m_labels; }
    }
}

namespace Gff {
    class LabelEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gff\LabelArray $_parent = null, ?\Gff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(16), "ASCII");
        }
        protected $_m_name;

        /**
         * Field name label (null-padded to 16 bytes, null-terminated).
         * The actual label length is determined by the first null byte.
         * Application code should trim trailing null bytes when using this field.
         */
        public function name() { return $this->_m_name; }
    }
}

namespace Gff {
    class ListEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Gff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numStructIndices = $this->_io->readU4le();
            $this->_m_structIndices = [];
            $n = $this->numStructIndices();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_structIndices[] = $this->_io->readU4le();
            }
        }
        protected $_m_numStructIndices;
        protected $_m_structIndices;

        /**
         * Number of struct indices in this list
         */
        public function numStructIndices() { return $this->_m_numStructIndices; }

        /**
         * Array of struct indices (indices into struct_array)
         */
        public function structIndices() { return $this->_m_structIndices; }
    }
}

namespace Gff {
    class ListIndicesArray extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gff $_parent = null, ?\Gff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_rawData = $this->_io->readBytes($this->_root()->header()->listIndicesCount());
        }
        protected $_m_rawData;

        /**
         * Raw list indices data. List entries are accessed via offsets stored in
         * list-type field entries (field_entry.list_indices_offset_value).
         * Each entry starts with a count (u4), followed by that many struct indices (u4 each).
         * 
         * Note: This is a raw data block. In practice, list entries are accessed via
         * offsets stored in list-type field entries, not as a sequential array.
         * Use list_entry type to parse individual entries at specific offsets.
         */
        public function rawData() { return $this->_m_rawData; }
    }
}

namespace Gff {
    class StructArray extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gff $_parent = null, ?\Gff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $n = $this->_root()->header()->structCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_entries[] = new \Gff\StructEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_entries;

        /**
         * Array of struct entries (12 bytes each)
         */
        public function entries() { return $this->_m_entries; }
    }
}

namespace Gff {
    class StructEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gff\StructArray $_parent = null, ?\Gff $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_structId = $this->_io->readS4le();
            $this->_m_dataOrOffset = $this->_io->readU4le();
            $this->_m_fieldCount = $this->_io->readU4le();
        }
        protected $_m_fieldIndicesOffset;

        /**
         * Byte offset into field_indices_array when struct has multiple fields
         */
        public function fieldIndicesOffset() {
            if ($this->_m_fieldIndicesOffset !== null)
                return $this->_m_fieldIndicesOffset;
            if ($this->hasMultipleFields()) {
                $this->_m_fieldIndicesOffset = $this->dataOrOffset();
            }
            return $this->_m_fieldIndicesOffset;
        }
        protected $_m_hasMultipleFields;

        /**
         * True if struct has multiple fields (offset to field indices in data_or_offset)
         */
        public function hasMultipleFields() {
            if ($this->_m_hasMultipleFields !== null)
                return $this->_m_hasMultipleFields;
            $this->_m_hasMultipleFields = $this->fieldCount() > 1;
            return $this->_m_hasMultipleFields;
        }
        protected $_m_hasSingleField;

        /**
         * True if struct has exactly one field (direct field index in data_or_offset)
         */
        public function hasSingleField() {
            if ($this->_m_hasSingleField !== null)
                return $this->_m_hasSingleField;
            $this->_m_hasSingleField = $this->fieldCount() == 1;
            return $this->_m_hasSingleField;
        }
        protected $_m_singleFieldIndex;

        /**
         * Direct field index when struct has exactly one field
         */
        public function singleFieldIndex() {
            if ($this->_m_singleFieldIndex !== null)
                return $this->_m_singleFieldIndex;
            if ($this->hasSingleField()) {
                $this->_m_singleFieldIndex = $this->dataOrOffset();
            }
            return $this->_m_singleFieldIndex;
        }
        protected $_m_structId;
        protected $_m_dataOrOffset;
        protected $_m_fieldCount;

        /**
         * Structure type identifier. Often 0xFFFFFFFF (-1) for generic structs.
         * Used to identify struct types in schema-aware parsers.
         */
        public function structId() { return $this->_m_structId; }

        /**
         * Field index (if field_count == 1) or byte offset to field indices array (if field_count > 1).
         * If field_count == 0, this value is unused.
         */
        public function dataOrOffset() { return $this->_m_dataOrOffset; }

        /**
         * Number of fields in this struct:
         * - 0: No fields
         * - 1: Single field, data_or_offset contains the field index directly
         * - >1: Multiple fields, data_or_offset contains byte offset into field_indices_array
         */
        public function fieldCount() { return $this->_m_fieldCount; }
    }
}

namespace Gff {
    class GffFieldType {
        const UINT8 = 0;
        const INT8 = 1;
        const UINT16 = 2;
        const INT16 = 3;
        const UINT32 = 4;
        const INT32 = 5;
        const UINT64 = 6;
        const INT64 = 7;
        const SINGLE = 8;
        const DOUBLE = 9;
        const STRING = 10;
        const RESREF = 11;
        const LOCALIZED_STRING = 12;
        const BINARY = 13;
        const STRUCT = 14;
        const LIST = 15;
        const VECTOR4 = 16;
        const VECTOR3 = 17;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 17 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
