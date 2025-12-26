// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;


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
public class Gff extends KaitaiStruct {
    public static Gff fromFile(String fileName) throws IOException {
        return new Gff(new ByteBufferKaitaiStream(fileName));
    }

    public enum GffFieldType {
        UINT8(0),
        INT8(1),
        UINT16(2),
        INT16(3),
        UINT32(4),
        INT32(5),
        UINT64(6),
        INT64(7),
        SINGLE(8),
        DOUBLE(9),
        STRING(10),
        RESREF(11),
        LOCALIZED_STRING(12),
        BINARY(13),
        STRUCT(14),
        LIST(15),
        VECTOR4(16),
        VECTOR3(17);

        private final long id;
        GffFieldType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, GffFieldType> byId = new HashMap<Long, GffFieldType>(18);
        static {
            for (GffFieldType e : GffFieldType.values())
                byId.put(e.id(), e);
        }
        public static GffFieldType byId(long id) { return byId.get(id); }
    }

    public Gff(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Gff(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Gff(KaitaiStream _io, KaitaiStruct _parent, Gff _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new GffHeader(this._io, this, _root);
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        fieldArray();
        if (this.fieldArray != null) {
            this.fieldArray._fetchInstances();
        }
        fieldData();
        if (this.fieldData != null) {
            this.fieldData._fetchInstances();
        }
        fieldIndicesArray();
        if (this.fieldIndicesArray != null) {
            this.fieldIndicesArray._fetchInstances();
        }
        labelArray();
        if (this.labelArray != null) {
            this.labelArray._fetchInstances();
        }
        listIndicesArray();
        if (this.listIndicesArray != null) {
            this.listIndicesArray._fetchInstances();
        }
        structArray();
        if (this.structArray != null) {
            this.structArray._fetchInstances();
        }
    }
    public static class FieldArray extends KaitaiStruct {
        public static FieldArray fromFile(String fileName) throws IOException {
            return new FieldArray(new ByteBufferKaitaiStream(fileName));
        }

        public FieldArray(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FieldArray(KaitaiStream _io, Gff _parent) {
            this(_io, _parent, null);
        }

        public FieldArray(KaitaiStream _io, Gff _parent, Gff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<FieldEntry>();
            for (int i = 0; i < _root().header().fieldCount(); i++) {
                this.entries.add(new FieldEntry(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<FieldEntry> entries;
        private Gff _root;
        private Gff _parent;

        /**
         * Array of field entries (12 bytes each)
         */
        public List<FieldEntry> entries() { return entries; }
        public Gff _root() { return _root; }
        public Gff _parent() { return _parent; }
    }
    public static class FieldData extends KaitaiStruct {
        public static FieldData fromFile(String fileName) throws IOException {
            return new FieldData(new ByteBufferKaitaiStream(fileName));
        }

        public FieldData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FieldData(KaitaiStream _io, Gff _parent) {
            this(_io, _parent, null);
        }

        public FieldData(KaitaiStream _io, Gff _parent, Gff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.rawData = this._io.readBytes(_root().header().fieldDataCount());
        }

        public void _fetchInstances() {
        }
        private byte[] rawData;
        private Gff _root;
        private Gff _parent;

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
        public byte[] rawData() { return rawData; }
        public Gff _root() { return _root; }
        public Gff _parent() { return _parent; }
    }
    public static class FieldEntry extends KaitaiStruct {
        public static FieldEntry fromFile(String fileName) throws IOException {
            return new FieldEntry(new ByteBufferKaitaiStream(fileName));
        }

        public FieldEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FieldEntry(KaitaiStream _io, Gff.FieldArray _parent) {
            this(_io, _parent, null);
        }

        public FieldEntry(KaitaiStream _io, Gff.FieldArray _parent, Gff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fieldType = Gff.GffFieldType.byId(this._io.readU4le());
            this.labelIndex = this._io.readU4le();
            this.dataOrOffset = this._io.readU4le();
        }

        public void _fetchInstances() {
        }
        private Integer fieldDataOffsetValue;

        /**
         * Absolute file offset to field data for complex types
         */
        public Integer fieldDataOffsetValue() {
            if (this.fieldDataOffsetValue != null)
                return this.fieldDataOffsetValue;
            if (isComplexType()) {
                this.fieldDataOffsetValue = ((Number) (_root().header().fieldDataOffset() + dataOrOffset())).intValue();
            }
            return this.fieldDataOffsetValue;
        }
        private Boolean isComplexType;

        /**
         * True if field stores data in field_data section
         */
        public Boolean isComplexType() {
            if (this.isComplexType != null)
                return this.isComplexType;
            this.isComplexType =  ((fieldType() == Gff.GffFieldType.UINT64) || (fieldType() == Gff.GffFieldType.INT64) || (fieldType() == Gff.GffFieldType.DOUBLE) || (fieldType() == Gff.GffFieldType.STRING) || (fieldType() == Gff.GffFieldType.RESREF) || (fieldType() == Gff.GffFieldType.LOCALIZED_STRING) || (fieldType() == Gff.GffFieldType.BINARY) || (fieldType() == Gff.GffFieldType.VECTOR4) || (fieldType() == Gff.GffFieldType.VECTOR3)) ;
            return this.isComplexType;
        }
        private Boolean isListType;

        /**
         * True if field is a list of structs
         */
        public Boolean isListType() {
            if (this.isListType != null)
                return this.isListType;
            this.isListType = fieldType() == Gff.GffFieldType.LIST;
            return this.isListType;
        }
        private Boolean isSimpleType;

        /**
         * True if field stores data inline (simple types)
         */
        public Boolean isSimpleType() {
            if (this.isSimpleType != null)
                return this.isSimpleType;
            this.isSimpleType =  ((fieldType() == Gff.GffFieldType.UINT8) || (fieldType() == Gff.GffFieldType.INT8) || (fieldType() == Gff.GffFieldType.UINT16) || (fieldType() == Gff.GffFieldType.INT16) || (fieldType() == Gff.GffFieldType.UINT32) || (fieldType() == Gff.GffFieldType.INT32) || (fieldType() == Gff.GffFieldType.SINGLE)) ;
            return this.isSimpleType;
        }
        private Boolean isStructType;

        /**
         * True if field is a nested struct
         */
        public Boolean isStructType() {
            if (this.isStructType != null)
                return this.isStructType;
            this.isStructType = fieldType() == Gff.GffFieldType.STRUCT;
            return this.isStructType;
        }
        private Integer listIndicesOffsetValue;

        /**
         * Absolute file offset to list indices for list type fields
         */
        public Integer listIndicesOffsetValue() {
            if (this.listIndicesOffsetValue != null)
                return this.listIndicesOffsetValue;
            if (isListType()) {
                this.listIndicesOffsetValue = ((Number) (_root().header().listIndicesOffset() + dataOrOffset())).intValue();
            }
            return this.listIndicesOffsetValue;
        }
        private Long structIndexValue;

        /**
         * Struct index for struct type fields
         */
        public Long structIndexValue() {
            if (this.structIndexValue != null)
                return this.structIndexValue;
            if (isStructType()) {
                this.structIndexValue = ((Number) (dataOrOffset())).longValue();
            }
            return this.structIndexValue;
        }
        private GffFieldType fieldType;
        private long labelIndex;
        private long dataOrOffset;
        private Gff _root;
        private Gff.FieldArray _parent;

        /**
         * Field data type (see gff_field_type enum):
         * - 0-5, 8: Simple types (stored inline in data_or_offset)
         * - 6-7, 9-13, 16-17: Complex types (offset to field_data in data_or_offset)
         * - 14: Struct (struct index in data_or_offset)
         * - 15: List (offset to list_indices_array in data_or_offset)
         */
        public GffFieldType fieldType() { return fieldType; }

        /**
         * Index into label_array for field name
         */
        public long labelIndex() { return labelIndex; }

        /**
         * Inline data (simple types) or offset/index (complex types):
         * - Simple types (0-5, 8): Value stored directly (1-4 bytes, sign/zero extended to 4 bytes)
         * - Complex types (6-7, 9-13, 16-17): Byte offset into field_data section (relative to field_data_offset)
         * - Struct (14): Struct index (index into struct_array)
         * - List (15): Byte offset into list_indices_array (relative to list_indices_offset)
         */
        public long dataOrOffset() { return dataOrOffset; }
        public Gff _root() { return _root; }
        public Gff.FieldArray _parent() { return _parent; }
    }
    public static class FieldIndicesArray extends KaitaiStruct {
        public static FieldIndicesArray fromFile(String fileName) throws IOException {
            return new FieldIndicesArray(new ByteBufferKaitaiStream(fileName));
        }

        public FieldIndicesArray(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FieldIndicesArray(KaitaiStream _io, Gff _parent) {
            this(_io, _parent, null);
        }

        public FieldIndicesArray(KaitaiStream _io, Gff _parent, Gff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.indices = new ArrayList<Long>();
            for (int i = 0; i < _root().header().fieldIndicesCount(); i++) {
                this.indices.add(this._io.readU4le());
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.indices.size(); i++) {
            }
        }
        private List<Long> indices;
        private Gff _root;
        private Gff _parent;

        /**
         * Array of field indices. When a struct has multiple fields, it stores an offset
         * into this array, and the next N consecutive u4 values (where N = struct.field_count)
         * are the field indices for that struct.
         */
        public List<Long> indices() { return indices; }
        public Gff _root() { return _root; }
        public Gff _parent() { return _parent; }
    }
    public static class GffHeader extends KaitaiStruct {
        public static GffHeader fromFile(String fileName) throws IOException {
            return new GffHeader(new ByteBufferKaitaiStream(fileName));
        }

        public GffHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public GffHeader(KaitaiStream _io, Gff _parent) {
            this(_io, _parent, null);
        }

        public GffHeader(KaitaiStream _io, Gff _parent, Gff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fileType = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this.fileVersion = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
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

        public void _fetchInstances() {
        }
        private String fileType;
        private String fileVersion;
        private long structOffset;
        private long structCount;
        private long fieldOffset;
        private long fieldCount;
        private long labelOffset;
        private long labelCount;
        private long fieldDataOffset;
        private long fieldDataCount;
        private long fieldIndicesOffset;
        private long fieldIndicesCount;
        private long listIndicesOffset;
        private long listIndicesCount;
        private Gff _root;
        private Gff _parent;

        /**
         * File type signature (FourCC). Examples: "GFF ", "UTC ", "UTI ", "DLG ", "ARE ", etc.
         * Must match a valid GFFContent enum value.
         */
        public String fileType() { return fileType; }

        /**
         * File format version. Must be "V3.2" for KotOR games.
         * Later BioWare games use "V3.3", "V4.0", or "V4.1".
         * Valid values: "V3.2" (KotOR), "V3.3", "V4.0", "V4.1" (other BioWare games)
         */
        public String fileVersion() { return fileVersion; }

        /**
         * Byte offset to struct array from beginning of file
         */
        public long structOffset() { return structOffset; }

        /**
         * Number of struct entries in struct array
         */
        public long structCount() { return structCount; }

        /**
         * Byte offset to field array from beginning of file
         */
        public long fieldOffset() { return fieldOffset; }

        /**
         * Number of field entries in field array
         */
        public long fieldCount() { return fieldCount; }

        /**
         * Byte offset to label array from beginning of file
         */
        public long labelOffset() { return labelOffset; }

        /**
         * Number of labels in label array
         */
        public long labelCount() { return labelCount; }

        /**
         * Byte offset to field data section from beginning of file
         */
        public long fieldDataOffset() { return fieldDataOffset; }

        /**
         * Size of field data section in bytes
         */
        public long fieldDataCount() { return fieldDataCount; }

        /**
         * Byte offset to field indices array from beginning of file
         */
        public long fieldIndicesOffset() { return fieldIndicesOffset; }

        /**
         * Number of field indices (total count across all structs with multiple fields)
         */
        public long fieldIndicesCount() { return fieldIndicesCount; }

        /**
         * Byte offset to list indices array from beginning of file
         */
        public long listIndicesOffset() { return listIndicesOffset; }

        /**
         * Number of list indices entries
         */
        public long listIndicesCount() { return listIndicesCount; }
        public Gff _root() { return _root; }
        public Gff _parent() { return _parent; }
    }
    public static class LabelArray extends KaitaiStruct {
        public static LabelArray fromFile(String fileName) throws IOException {
            return new LabelArray(new ByteBufferKaitaiStream(fileName));
        }

        public LabelArray(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LabelArray(KaitaiStream _io, Gff _parent) {
            this(_io, _parent, null);
        }

        public LabelArray(KaitaiStream _io, Gff _parent, Gff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.labels = new ArrayList<LabelEntry>();
            for (int i = 0; i < _root().header().labelCount(); i++) {
                this.labels.add(new LabelEntry(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.labels.size(); i++) {
                this.labels.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<LabelEntry> labels;
        private Gff _root;
        private Gff _parent;

        /**
         * Array of label entries (16 bytes each)
         */
        public List<LabelEntry> labels() { return labels; }
        public Gff _root() { return _root; }
        public Gff _parent() { return _parent; }
    }
    public static class LabelEntry extends KaitaiStruct {
        public static LabelEntry fromFile(String fileName) throws IOException {
            return new LabelEntry(new ByteBufferKaitaiStream(fileName));
        }

        public LabelEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LabelEntry(KaitaiStream _io, Gff.LabelArray _parent) {
            this(_io, _parent, null);
        }

        public LabelEntry(KaitaiStream _io, Gff.LabelArray _parent, Gff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.name = new String(this._io.readBytes(16), StandardCharsets.US_ASCII);
        }

        public void _fetchInstances() {
        }
        private String name;
        private Gff _root;
        private Gff.LabelArray _parent;

        /**
         * Field name label (null-padded to 16 bytes, null-terminated).
         * The actual label length is determined by the first null byte.
         * Application code should trim trailing null bytes when using this field.
         */
        public String name() { return name; }
        public Gff _root() { return _root; }
        public Gff.LabelArray _parent() { return _parent; }
    }
    public static class ListEntry extends KaitaiStruct {
        public static ListEntry fromFile(String fileName) throws IOException {
            return new ListEntry(new ByteBufferKaitaiStream(fileName));
        }

        public ListEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ListEntry(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public ListEntry(KaitaiStream _io, KaitaiStruct _parent, Gff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numStructIndices = this._io.readU4le();
            this.structIndices = new ArrayList<Long>();
            for (int i = 0; i < numStructIndices(); i++) {
                this.structIndices.add(this._io.readU4le());
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.structIndices.size(); i++) {
            }
        }
        private long numStructIndices;
        private List<Long> structIndices;
        private Gff _root;
        private KaitaiStruct _parent;

        /**
         * Number of struct indices in this list
         */
        public long numStructIndices() { return numStructIndices; }

        /**
         * Array of struct indices (indices into struct_array)
         */
        public List<Long> structIndices() { return structIndices; }
        public Gff _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class ListIndicesArray extends KaitaiStruct {
        public static ListIndicesArray fromFile(String fileName) throws IOException {
            return new ListIndicesArray(new ByteBufferKaitaiStream(fileName));
        }

        public ListIndicesArray(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ListIndicesArray(KaitaiStream _io, Gff _parent) {
            this(_io, _parent, null);
        }

        public ListIndicesArray(KaitaiStream _io, Gff _parent, Gff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.rawData = this._io.readBytes(_root().header().listIndicesCount());
        }

        public void _fetchInstances() {
        }
        private byte[] rawData;
        private Gff _root;
        private Gff _parent;

        /**
         * Raw list indices data. List entries are accessed via offsets stored in
         * list-type field entries (field_entry.list_indices_offset_value).
         * Each entry starts with a count (u4), followed by that many struct indices (u4 each).
         * 
         * Note: This is a raw data block. In practice, list entries are accessed via
         * offsets stored in list-type field entries, not as a sequential array.
         * Use list_entry type to parse individual entries at specific offsets.
         */
        public byte[] rawData() { return rawData; }
        public Gff _root() { return _root; }
        public Gff _parent() { return _parent; }
    }
    public static class StructArray extends KaitaiStruct {
        public static StructArray fromFile(String fileName) throws IOException {
            return new StructArray(new ByteBufferKaitaiStream(fileName));
        }

        public StructArray(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StructArray(KaitaiStream _io, Gff _parent) {
            this(_io, _parent, null);
        }

        public StructArray(KaitaiStream _io, Gff _parent, Gff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<StructEntry>();
            for (int i = 0; i < _root().header().structCount(); i++) {
                this.entries.add(new StructEntry(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<StructEntry> entries;
        private Gff _root;
        private Gff _parent;

        /**
         * Array of struct entries (12 bytes each)
         */
        public List<StructEntry> entries() { return entries; }
        public Gff _root() { return _root; }
        public Gff _parent() { return _parent; }
    }
    public static class StructEntry extends KaitaiStruct {
        public static StructEntry fromFile(String fileName) throws IOException {
            return new StructEntry(new ByteBufferKaitaiStream(fileName));
        }

        public StructEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StructEntry(KaitaiStream _io, Gff.StructArray _parent) {
            this(_io, _parent, null);
        }

        public StructEntry(KaitaiStream _io, Gff.StructArray _parent, Gff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.structId = this._io.readS4le();
            this.dataOrOffset = this._io.readU4le();
            this.fieldCount = this._io.readU4le();
        }

        public void _fetchInstances() {
        }
        private Long fieldIndicesOffset;

        /**
         * Byte offset into field_indices_array when struct has multiple fields
         */
        public Long fieldIndicesOffset() {
            if (this.fieldIndicesOffset != null)
                return this.fieldIndicesOffset;
            if (hasMultipleFields()) {
                this.fieldIndicesOffset = ((Number) (dataOrOffset())).longValue();
            }
            return this.fieldIndicesOffset;
        }
        private Boolean hasMultipleFields;

        /**
         * True if struct has multiple fields (offset to field indices in data_or_offset)
         */
        public Boolean hasMultipleFields() {
            if (this.hasMultipleFields != null)
                return this.hasMultipleFields;
            this.hasMultipleFields = fieldCount() > 1;
            return this.hasMultipleFields;
        }
        private Boolean hasSingleField;

        /**
         * True if struct has exactly one field (direct field index in data_or_offset)
         */
        public Boolean hasSingleField() {
            if (this.hasSingleField != null)
                return this.hasSingleField;
            this.hasSingleField = fieldCount() == 1;
            return this.hasSingleField;
        }
        private Long singleFieldIndex;

        /**
         * Direct field index when struct has exactly one field
         */
        public Long singleFieldIndex() {
            if (this.singleFieldIndex != null)
                return this.singleFieldIndex;
            if (hasSingleField()) {
                this.singleFieldIndex = ((Number) (dataOrOffset())).longValue();
            }
            return this.singleFieldIndex;
        }
        private int structId;
        private long dataOrOffset;
        private long fieldCount;
        private Gff _root;
        private Gff.StructArray _parent;

        /**
         * Structure type identifier. Often 0xFFFFFFFF (-1) for generic structs.
         * Used to identify struct types in schema-aware parsers.
         */
        public int structId() { return structId; }

        /**
         * Field index (if field_count == 1) or byte offset to field indices array (if field_count > 1).
         * If field_count == 0, this value is unused.
         */
        public long dataOrOffset() { return dataOrOffset; }

        /**
         * Number of fields in this struct:
         * - 0: No fields
         * - 1: Single field, data_or_offset contains the field index directly
         * - >1: Multiple fields, data_or_offset contains byte offset into field_indices_array
         */
        public long fieldCount() { return fieldCount; }
        public Gff _root() { return _root; }
        public Gff.StructArray _parent() { return _parent; }
    }
    private FieldArray fieldArray;

    /**
     * Array of field entries (12 bytes each)
     */
    public FieldArray fieldArray() {
        if (this.fieldArray != null)
            return this.fieldArray;
        if (header().fieldCount() > 0) {
            long _pos = this._io.pos();
            this._io.seek(header().fieldOffset());
            this.fieldArray = new FieldArray(this._io, this, _root);
            this._io.seek(_pos);
        }
        return this.fieldArray;
    }
    private FieldData fieldData;

    /**
     * Storage area for complex field types (strings, binary, vectors, etc.)
     */
    public FieldData fieldData() {
        if (this.fieldData != null)
            return this.fieldData;
        if (header().fieldDataCount() > 0) {
            long _pos = this._io.pos();
            this._io.seek(header().fieldDataOffset());
            this.fieldData = new FieldData(this._io, this, _root);
            this._io.seek(_pos);
        }
        return this.fieldData;
    }
    private FieldIndicesArray fieldIndicesArray;

    /**
     * Array of field index arrays (used when structs have multiple fields)
     */
    public FieldIndicesArray fieldIndicesArray() {
        if (this.fieldIndicesArray != null)
            return this.fieldIndicesArray;
        if (header().fieldIndicesCount() > 0) {
            long _pos = this._io.pos();
            this._io.seek(header().fieldIndicesOffset());
            this.fieldIndicesArray = new FieldIndicesArray(this._io, this, _root);
            this._io.seek(_pos);
        }
        return this.fieldIndicesArray;
    }
    private LabelArray labelArray;

    /**
     * Array of 16-byte null-padded field name labels
     */
    public LabelArray labelArray() {
        if (this.labelArray != null)
            return this.labelArray;
        if (header().labelCount() > 0) {
            long _pos = this._io.pos();
            this._io.seek(header().labelOffset());
            this.labelArray = new LabelArray(this._io, this, _root);
            this._io.seek(_pos);
        }
        return this.labelArray;
    }
    private ListIndicesArray listIndicesArray;

    /**
     * Array of list entry structures (count + struct indices)
     */
    public ListIndicesArray listIndicesArray() {
        if (this.listIndicesArray != null)
            return this.listIndicesArray;
        if (header().listIndicesCount() > 0) {
            long _pos = this._io.pos();
            this._io.seek(header().listIndicesOffset());
            this.listIndicesArray = new ListIndicesArray(this._io, this, _root);
            this._io.seek(_pos);
        }
        return this.listIndicesArray;
    }
    private StructArray structArray;

    /**
     * Array of struct entries (12 bytes each)
     */
    public StructArray structArray() {
        if (this.structArray != null)
            return this.structArray;
        if (header().structCount() > 0) {
            long _pos = this._io.pos();
            this._io.seek(header().structOffset());
            this.structArray = new StructArray(this._io, this, _root);
            this._io.seek(_pos);
        }
        return this.structArray;
    }
    private GffHeader header;
    private Gff _root;
    private KaitaiStruct _parent;

    /**
     * GFF file header (56 bytes total)
     */
    public GffHeader header() { return header; }
    public Gff _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
