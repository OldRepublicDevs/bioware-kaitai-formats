#ifndef GFF_H_
#define GFF_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class gff_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

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

class gff_t : public kaitai::kstruct {

public:
    class field_array_t;
    class field_data_t;
    class field_entry_t;
    class field_indices_array_t;
    class gff_header_t;
    class label_array_t;
    class label_entry_t;
    class list_entry_t;
    class list_indices_array_t;
    class struct_array_t;
    class struct_entry_t;

    enum gff_field_type_t {
        GFF_FIELD_TYPE_UINT8 = 0,
        GFF_FIELD_TYPE_INT8 = 1,
        GFF_FIELD_TYPE_UINT16 = 2,
        GFF_FIELD_TYPE_INT16 = 3,
        GFF_FIELD_TYPE_UINT32 = 4,
        GFF_FIELD_TYPE_INT32 = 5,
        GFF_FIELD_TYPE_UINT64 = 6,
        GFF_FIELD_TYPE_INT64 = 7,
        GFF_FIELD_TYPE_SINGLE = 8,
        GFF_FIELD_TYPE_DOUBLE = 9,
        GFF_FIELD_TYPE_STRING = 10,
        GFF_FIELD_TYPE_RESREF = 11,
        GFF_FIELD_TYPE_LOCALIZED_STRING = 12,
        GFF_FIELD_TYPE_BINARY = 13,
        GFF_FIELD_TYPE_STRUCT = 14,
        GFF_FIELD_TYPE_LIST = 15,
        GFF_FIELD_TYPE_VECTOR4 = 16,
        GFF_FIELD_TYPE_VECTOR3 = 17
    };
    static bool _is_defined_gff_field_type_t(gff_field_type_t v);

private:
    static const std::set<gff_field_type_t> _values_gff_field_type_t;
    static std::set<gff_field_type_t> _build_values_gff_field_type_t();

public:

    gff_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, gff_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~gff_t();

    class field_array_t : public kaitai::kstruct {

    public:

        field_array_t(kaitai::kstream* p__io, gff_t* p__parent = 0, gff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~field_array_t();

    private:
        std::vector<field_entry_t*>* m_entries;
        gff_t* m__root;
        gff_t* m__parent;

    public:

        /**
         * Array of field entries (12 bytes each)
         */
        std::vector<field_entry_t*>* entries() const { return m_entries; }
        gff_t* _root() const { return m__root; }
        gff_t* _parent() const { return m__parent; }
    };

    class field_data_t : public kaitai::kstruct {

    public:

        field_data_t(kaitai::kstream* p__io, gff_t* p__parent = 0, gff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~field_data_t();

    private:
        std::string m_raw_data;
        gff_t* m__root;
        gff_t* m__parent;

    public:

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
        std::string raw_data() const { return m_raw_data; }
        gff_t* _root() const { return m__root; }
        gff_t* _parent() const { return m__parent; }
    };

    class field_entry_t : public kaitai::kstruct {

    public:

        field_entry_t(kaitai::kstream* p__io, gff_t::field_array_t* p__parent = 0, gff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~field_entry_t();

    private:
        bool f_field_data_offset_value;
        int32_t m_field_data_offset_value;
        bool n_field_data_offset_value;

    public:
        bool _is_null_field_data_offset_value() { field_data_offset_value(); return n_field_data_offset_value; };

    private:

    public:

        /**
         * Absolute file offset to field data for complex types
         */
        int32_t field_data_offset_value();

    private:
        bool f_is_complex_type;
        bool m_is_complex_type;

    public:

        /**
         * True if field stores data in field_data section
         */
        bool is_complex_type();

    private:
        bool f_is_list_type;
        bool m_is_list_type;

    public:

        /**
         * True if field is a list of structs
         */
        bool is_list_type();

    private:
        bool f_is_simple_type;
        bool m_is_simple_type;

    public:

        /**
         * True if field stores data inline (simple types)
         */
        bool is_simple_type();

    private:
        bool f_is_struct_type;
        bool m_is_struct_type;

    public:

        /**
         * True if field is a nested struct
         */
        bool is_struct_type();

    private:
        bool f_list_indices_offset_value;
        int32_t m_list_indices_offset_value;
        bool n_list_indices_offset_value;

    public:
        bool _is_null_list_indices_offset_value() { list_indices_offset_value(); return n_list_indices_offset_value; };

    private:

    public:

        /**
         * Absolute file offset to list indices for list type fields
         */
        int32_t list_indices_offset_value();

    private:
        bool f_struct_index_value;
        uint32_t m_struct_index_value;
        bool n_struct_index_value;

    public:
        bool _is_null_struct_index_value() { struct_index_value(); return n_struct_index_value; };

    private:

    public:

        /**
         * Struct index for struct type fields
         */
        uint32_t struct_index_value();

    private:
        gff_field_type_t m_field_type;
        uint32_t m_label_index;
        uint32_t m_data_or_offset;
        gff_t* m__root;
        gff_t::field_array_t* m__parent;

    public:

        /**
         * Field data type (see gff_field_type enum):
         * - 0-5, 8: Simple types (stored inline in data_or_offset)
         * - 6-7, 9-13, 16-17: Complex types (offset to field_data in data_or_offset)
         * - 14: Struct (struct index in data_or_offset)
         * - 15: List (offset to list_indices_array in data_or_offset)
         */
        gff_field_type_t field_type() const { return m_field_type; }

        /**
         * Index into label_array for field name
         */
        uint32_t label_index() const { return m_label_index; }

        /**
         * Inline data (simple types) or offset/index (complex types):
         * - Simple types (0-5, 8): Value stored directly (1-4 bytes, sign/zero extended to 4 bytes)
         * - Complex types (6-7, 9-13, 16-17): Byte offset into field_data section (relative to field_data_offset)
         * - Struct (14): Struct index (index into struct_array)
         * - List (15): Byte offset into list_indices_array (relative to list_indices_offset)
         */
        uint32_t data_or_offset() const { return m_data_or_offset; }
        gff_t* _root() const { return m__root; }
        gff_t::field_array_t* _parent() const { return m__parent; }
    };

    class field_indices_array_t : public kaitai::kstruct {

    public:

        field_indices_array_t(kaitai::kstream* p__io, gff_t* p__parent = 0, gff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~field_indices_array_t();

    private:
        std::vector<uint32_t>* m_indices;
        gff_t* m__root;
        gff_t* m__parent;

    public:

        /**
         * Array of field indices. When a struct has multiple fields, it stores an offset
         * into this array, and the next N consecutive u4 values (where N = struct.field_count)
         * are the field indices for that struct.
         */
        std::vector<uint32_t>* indices() const { return m_indices; }
        gff_t* _root() const { return m__root; }
        gff_t* _parent() const { return m__parent; }
    };

    class gff_header_t : public kaitai::kstruct {

    public:

        gff_header_t(kaitai::kstream* p__io, gff_t* p__parent = 0, gff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~gff_header_t();

    private:
        std::string m_file_type;
        std::string m_file_version;
        uint32_t m_struct_offset;
        uint32_t m_struct_count;
        uint32_t m_field_offset;
        uint32_t m_field_count;
        uint32_t m_label_offset;
        uint32_t m_label_count;
        uint32_t m_field_data_offset;
        uint32_t m_field_data_count;
        uint32_t m_field_indices_offset;
        uint32_t m_field_indices_count;
        uint32_t m_list_indices_offset;
        uint32_t m_list_indices_count;
        gff_t* m__root;
        gff_t* m__parent;

    public:

        /**
         * File type signature (FourCC). Examples: "GFF ", "UTC ", "UTI ", "DLG ", "ARE ", etc.
         * Must match a valid GFFContent enum value.
         */
        std::string file_type() const { return m_file_type; }

        /**
         * File format version. Must be "V3.2" for KotOR games.
         * Later BioWare games use "V3.3", "V4.0", or "V4.1".
         * Valid values: "V3.2" (KotOR), "V3.3", "V4.0", "V4.1" (other BioWare games)
         */
        std::string file_version() const { return m_file_version; }

        /**
         * Byte offset to struct array from beginning of file
         */
        uint32_t struct_offset() const { return m_struct_offset; }

        /**
         * Number of struct entries in struct array
         */
        uint32_t struct_count() const { return m_struct_count; }

        /**
         * Byte offset to field array from beginning of file
         */
        uint32_t field_offset() const { return m_field_offset; }

        /**
         * Number of field entries in field array
         */
        uint32_t field_count() const { return m_field_count; }

        /**
         * Byte offset to label array from beginning of file
         */
        uint32_t label_offset() const { return m_label_offset; }

        /**
         * Number of labels in label array
         */
        uint32_t label_count() const { return m_label_count; }

        /**
         * Byte offset to field data section from beginning of file
         */
        uint32_t field_data_offset() const { return m_field_data_offset; }

        /**
         * Size of field data section in bytes
         */
        uint32_t field_data_count() const { return m_field_data_count; }

        /**
         * Byte offset to field indices array from beginning of file
         */
        uint32_t field_indices_offset() const { return m_field_indices_offset; }

        /**
         * Number of field indices (total count across all structs with multiple fields)
         */
        uint32_t field_indices_count() const { return m_field_indices_count; }

        /**
         * Byte offset to list indices array from beginning of file
         */
        uint32_t list_indices_offset() const { return m_list_indices_offset; }

        /**
         * Number of list indices entries
         */
        uint32_t list_indices_count() const { return m_list_indices_count; }
        gff_t* _root() const { return m__root; }
        gff_t* _parent() const { return m__parent; }
    };

    class label_array_t : public kaitai::kstruct {

    public:

        label_array_t(kaitai::kstream* p__io, gff_t* p__parent = 0, gff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~label_array_t();

    private:
        std::vector<label_entry_t*>* m_labels;
        gff_t* m__root;
        gff_t* m__parent;

    public:

        /**
         * Array of label entries (16 bytes each)
         */
        std::vector<label_entry_t*>* labels() const { return m_labels; }
        gff_t* _root() const { return m__root; }
        gff_t* _parent() const { return m__parent; }
    };

    class label_entry_t : public kaitai::kstruct {

    public:

        label_entry_t(kaitai::kstream* p__io, gff_t::label_array_t* p__parent = 0, gff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~label_entry_t();

    private:
        std::string m_name;
        gff_t* m__root;
        gff_t::label_array_t* m__parent;

    public:

        /**
         * Field name label (null-padded to 16 bytes, null-terminated).
         * The actual label length is determined by the first null byte.
         * Application code should trim trailing null bytes when using this field.
         */
        std::string name() const { return m_name; }
        gff_t* _root() const { return m__root; }
        gff_t::label_array_t* _parent() const { return m__parent; }
    };

    class list_entry_t : public kaitai::kstruct {

    public:

        list_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, gff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~list_entry_t();

    private:
        uint32_t m_num_struct_indices;
        std::vector<uint32_t>* m_struct_indices;
        gff_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * Number of struct indices in this list
         */
        uint32_t num_struct_indices() const { return m_num_struct_indices; }

        /**
         * Array of struct indices (indices into struct_array)
         */
        std::vector<uint32_t>* struct_indices() const { return m_struct_indices; }
        gff_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class list_indices_array_t : public kaitai::kstruct {

    public:

        list_indices_array_t(kaitai::kstream* p__io, gff_t* p__parent = 0, gff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~list_indices_array_t();

    private:
        std::string m_raw_data;
        gff_t* m__root;
        gff_t* m__parent;

    public:

        /**
         * Raw list indices data. List entries are accessed via offsets stored in
         * list-type field entries (field_entry.list_indices_offset_value).
         * Each entry starts with a count (u4), followed by that many struct indices (u4 each).
         * 
         * Note: This is a raw data block. In practice, list entries are accessed via
         * offsets stored in list-type field entries, not as a sequential array.
         * Use list_entry type to parse individual entries at specific offsets.
         */
        std::string raw_data() const { return m_raw_data; }
        gff_t* _root() const { return m__root; }
        gff_t* _parent() const { return m__parent; }
    };

    class struct_array_t : public kaitai::kstruct {

    public:

        struct_array_t(kaitai::kstream* p__io, gff_t* p__parent = 0, gff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~struct_array_t();

    private:
        std::vector<struct_entry_t*>* m_entries;
        gff_t* m__root;
        gff_t* m__parent;

    public:

        /**
         * Array of struct entries (12 bytes each)
         */
        std::vector<struct_entry_t*>* entries() const { return m_entries; }
        gff_t* _root() const { return m__root; }
        gff_t* _parent() const { return m__parent; }
    };

    class struct_entry_t : public kaitai::kstruct {

    public:

        struct_entry_t(kaitai::kstream* p__io, gff_t::struct_array_t* p__parent = 0, gff_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~struct_entry_t();

    private:
        bool f_field_indices_offset;
        uint32_t m_field_indices_offset;
        bool n_field_indices_offset;

    public:
        bool _is_null_field_indices_offset() { field_indices_offset(); return n_field_indices_offset; };

    private:

    public:

        /**
         * Byte offset into field_indices_array when struct has multiple fields
         */
        uint32_t field_indices_offset();

    private:
        bool f_has_multiple_fields;
        bool m_has_multiple_fields;

    public:

        /**
         * True if struct has multiple fields (offset to field indices in data_or_offset)
         */
        bool has_multiple_fields();

    private:
        bool f_has_single_field;
        bool m_has_single_field;

    public:

        /**
         * True if struct has exactly one field (direct field index in data_or_offset)
         */
        bool has_single_field();

    private:
        bool f_single_field_index;
        uint32_t m_single_field_index;
        bool n_single_field_index;

    public:
        bool _is_null_single_field_index() { single_field_index(); return n_single_field_index; };

    private:

    public:

        /**
         * Direct field index when struct has exactly one field
         */
        uint32_t single_field_index();

    private:
        int32_t m_struct_id;
        uint32_t m_data_or_offset;
        uint32_t m_field_count;
        gff_t* m__root;
        gff_t::struct_array_t* m__parent;

    public:

        /**
         * Structure type identifier. Often 0xFFFFFFFF (-1) for generic structs.
         * Used to identify struct types in schema-aware parsers.
         */
        int32_t struct_id() const { return m_struct_id; }

        /**
         * Field index (if field_count == 1) or byte offset to field indices array (if field_count > 1).
         * If field_count == 0, this value is unused.
         */
        uint32_t data_or_offset() const { return m_data_or_offset; }

        /**
         * Number of fields in this struct:
         * - 0: No fields
         * - 1: Single field, data_or_offset contains the field index directly
         * - >1: Multiple fields, data_or_offset contains byte offset into field_indices_array
         */
        uint32_t field_count() const { return m_field_count; }
        gff_t* _root() const { return m__root; }
        gff_t::struct_array_t* _parent() const { return m__parent; }
    };

private:
    bool f_field_array;
    field_array_t* m_field_array;
    bool n_field_array;

public:
    bool _is_null_field_array() { field_array(); return n_field_array; };

private:

public:

    /**
     * Array of field entries (12 bytes each)
     */
    field_array_t* field_array();

private:
    bool f_field_data;
    field_data_t* m_field_data;
    bool n_field_data;

public:
    bool _is_null_field_data() { field_data(); return n_field_data; };

private:

public:

    /**
     * Storage area for complex field types (strings, binary, vectors, etc.)
     */
    field_data_t* field_data();

private:
    bool f_field_indices_array;
    field_indices_array_t* m_field_indices_array;
    bool n_field_indices_array;

public:
    bool _is_null_field_indices_array() { field_indices_array(); return n_field_indices_array; };

private:

public:

    /**
     * Array of field index arrays (used when structs have multiple fields)
     */
    field_indices_array_t* field_indices_array();

private:
    bool f_label_array;
    label_array_t* m_label_array;
    bool n_label_array;

public:
    bool _is_null_label_array() { label_array(); return n_label_array; };

private:

public:

    /**
     * Array of 16-byte null-padded field name labels
     */
    label_array_t* label_array();

private:
    bool f_list_indices_array;
    list_indices_array_t* m_list_indices_array;
    bool n_list_indices_array;

public:
    bool _is_null_list_indices_array() { list_indices_array(); return n_list_indices_array; };

private:

public:

    /**
     * Array of list entry structures (count + struct indices)
     */
    list_indices_array_t* list_indices_array();

private:
    bool f_struct_array;
    struct_array_t* m_struct_array;
    bool n_struct_array;

public:
    bool _is_null_struct_array() { struct_array(); return n_struct_array; };

private:

public:

    /**
     * Array of struct entries (12 bytes each)
     */
    struct_array_t* struct_array();

private:
    gff_header_t* m_header;
    gff_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * GFF file header (56 bytes total)
     */
    gff_header_t* header() const { return m_header; }
    gff_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // GFF_H_
