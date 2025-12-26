// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// GFF (Generic File Format) is BioWare's universal container format for structured game data.
    /// It is used by many KotOR file types including UTC (creature), UTI (item), DLG (dialogue),
    /// ARE (area), GIT (game instance template), IFO (module info), and many others.
    /// 
    /// GFF uses a hierarchical structure with structs containing fields, which can be simple values,
    /// nested structs, or lists of structs. The format supports version V3.2 (KotOR) and later
    /// versions (V3.3, V4.0, V4.1) used in other BioWare games.
    /// 
    /// Binary Format Structure:
    /// - File Header (56 bytes): File type signature (FourCC), version, counts, and offsets to all
    ///   data tables (structs, fields, labels, field_data, field_indices, list_indices)
    /// - Label Array: Array of 16-byte null-padded field name labels
    /// - Struct Array: Array of struct entries (12 bytes each) - struct_id, data_or_offset, field_count
    /// - Field Array: Array of field entries (12 bytes each) - field_type, label_index, data_or_offset
    /// - Field Data: Storage area for complex field types (strings, binary, vectors, etc.)
    /// - Field Indices Array: Array of field index arrays (used when structs have multiple fields)
    /// - List Indices Array: Array of list entry structures (count + struct indices)
    /// 
    /// Field Types:
    /// - Simple types (0-5, 8): Stored inline in data_or_offset (uint8, int8, uint16, int16, uint32,
    ///   int32, float)
    /// - Complex types (6-7, 9-13, 16-17): Offset to field_data section (uint64, int64, double, string,
    ///   resref, localized_string, binary, vector4, vector3)
    /// - Struct (14): Struct index stored inline (nested struct)
    /// - List (15): Offset to list_indices_array (list of structs)
    /// 
    /// Struct Access Pattern:
    /// 1. Root struct is always at struct_array index 0
    /// 2. If struct.field_count == 1: data_or_offset contains direct field index
    /// 3. If struct.field_count &gt; 1: data_or_offset contains offset into field_indices_array
    /// 4. Use field_index to access field_array entry
    /// 5. Use field.label_index to get field name from label_array
    /// 6. Use field.data_or_offset based on field_type (inline, offset, struct index, list offset)
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md - Complete GFF format documentation
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/Bioware-Aurora-GFF.md - Official BioWare Aurora GFF specification
    /// - https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/itp.html - Tim Smith/Torlack's GFF/ITP documentation
    /// - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/gffreader.cpp - Complete C++ GFF reader implementation
    /// - https://github.com/xoreos/xoreos/blob/master/src/aurora/gff3file.cpp - Generic Aurora GFF implementation (shared format)
    /// - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/GFFObject.ts - TypeScript GFF parser
    /// - https://github.com/KotOR-Community-Patches/KotOR-Unity/blob/master/Assets/Scripts/FileObjects/GFFObject.cs - C# Unity GFF loader
    /// - https://github.com/KotOR-Community-Patches/Kotor.NET/tree/master/Kotor.NET/Formats/KotorGFF/ - .NET GFF reader/writer
    /// - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff.py - PyKotor binary reader/writer
    /// - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/gff_data.py - GFF data model
    /// </summary>
    public partial class Gff : KaitaiStruct
    {
        public static Gff FromFile(string fileName)
        {
            return new Gff(new KaitaiStream(fileName));
        }


        public enum GffFieldType
        {
            Uint8 = 0,
            Int8 = 1,
            Uint16 = 2,
            Int16 = 3,
            Uint32 = 4,
            Int32 = 5,
            Uint64 = 6,
            Int64 = 7,
            Single = 8,
            Double = 9,
            String = 10,
            Resref = 11,
            LocalizedString = 12,
            Binary = 13,
            Struct = 14,
            List = 15,
            Vector4 = 16,
            Vector3 = 17,
        }
        public Gff(KaitaiStream p__io, KaitaiStruct p__parent = null, Gff p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_fieldArray = false;
            f_fieldData = false;
            f_fieldIndicesArray = false;
            f_labelArray = false;
            f_listIndicesArray = false;
            f_structArray = false;
            _read();
        }
        private void _read()
        {
            _header = new GffHeader(m_io, this, m_root);
        }
        public partial class FieldArray : KaitaiStruct
        {
            public static FieldArray FromFile(string fileName)
            {
                return new FieldArray(new KaitaiStream(fileName));
            }

            public FieldArray(KaitaiStream p__io, Gff p__parent = null, Gff p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<FieldEntry>();
                for (var i = 0; i < M_Root.Header.FieldCount; i++)
                {
                    _entries.Add(new FieldEntry(m_io, this, m_root));
                }
            }
            private List<FieldEntry> _entries;
            private Gff m_root;
            private Gff m_parent;

            /// <summary>
            /// Array of field entries (12 bytes each)
            /// </summary>
            public List<FieldEntry> Entries { get { return _entries; } }
            public Gff M_Root { get { return m_root; } }
            public Gff M_Parent { get { return m_parent; } }
        }
        public partial class FieldData : KaitaiStruct
        {
            public static FieldData FromFile(string fileName)
            {
                return new FieldData(new KaitaiStream(fileName));
            }

            public FieldData(KaitaiStream p__io, Gff p__parent = null, Gff p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _rawData = m_io.ReadBytes(M_Root.Header.FieldDataCount);
            }
            private byte[] _rawData;
            private Gff m_root;
            private Gff m_parent;

            /// <summary>
            /// Raw field data storage. Individual field data entries are accessed via
            /// field_entry.field_data_offset_value offsets. The structure of each entry
            /// depends on the field_type:
            /// - UInt64/Int64/Double: 8 bytes
            /// - String: 4-byte length + string bytes
            /// - ResRef: 1-byte length + string bytes (max 16)
            /// - LocalizedString: variable (see bioware_common::bioware_locstring type)
            /// - Binary: 4-byte length + binary bytes
            /// - Vector3: 12 bytes (3×float)
            /// - Vector4: 16 bytes (4×float)
            /// </summary>
            public byte[] RawData { get { return _rawData; } }
            public Gff M_Root { get { return m_root; } }
            public Gff M_Parent { get { return m_parent; } }
        }
        public partial class FieldEntry : KaitaiStruct
        {
            public static FieldEntry FromFile(string fileName)
            {
                return new FieldEntry(new KaitaiStream(fileName));
            }

            public FieldEntry(KaitaiStream p__io, Gff.FieldArray p__parent = null, Gff p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_fieldDataOffsetValue = false;
                f_isComplexType = false;
                f_isListType = false;
                f_isSimpleType = false;
                f_isStructType = false;
                f_listIndicesOffsetValue = false;
                f_structIndexValue = false;
                _read();
            }
            private void _read()
            {
                _fieldType = ((Gff.GffFieldType) m_io.ReadU4le());
                _labelIndex = m_io.ReadU4le();
                _dataOrOffset = m_io.ReadU4le();
            }
            private bool f_fieldDataOffsetValue;
            private int? _fieldDataOffsetValue;

            /// <summary>
            /// Absolute file offset to field data for complex types
            /// </summary>
            public int? FieldDataOffsetValue
            {
                get
                {
                    if (f_fieldDataOffsetValue)
                        return _fieldDataOffsetValue;
                    f_fieldDataOffsetValue = true;
                    if (IsComplexType) {
                        _fieldDataOffsetValue = (int) (M_Root.Header.FieldDataOffset + DataOrOffset);
                    }
                    return _fieldDataOffsetValue;
                }
            }
            private bool f_isComplexType;
            private bool _isComplexType;

            /// <summary>
            /// True if field stores data in field_data section
            /// </summary>
            public bool IsComplexType
            {
                get
                {
                    if (f_isComplexType)
                        return _isComplexType;
                    f_isComplexType = true;
                    _isComplexType = (bool) ( ((FieldType == Gff.GffFieldType.Uint64) || (FieldType == Gff.GffFieldType.Int64) || (FieldType == Gff.GffFieldType.Double) || (FieldType == Gff.GffFieldType.String) || (FieldType == Gff.GffFieldType.Resref) || (FieldType == Gff.GffFieldType.LocalizedString) || (FieldType == Gff.GffFieldType.Binary) || (FieldType == Gff.GffFieldType.Vector4) || (FieldType == Gff.GffFieldType.Vector3)) );
                    return _isComplexType;
                }
            }
            private bool f_isListType;
            private bool _isListType;

            /// <summary>
            /// True if field is a list of structs
            /// </summary>
            public bool IsListType
            {
                get
                {
                    if (f_isListType)
                        return _isListType;
                    f_isListType = true;
                    _isListType = (bool) (FieldType == Gff.GffFieldType.List);
                    return _isListType;
                }
            }
            private bool f_isSimpleType;
            private bool _isSimpleType;

            /// <summary>
            /// True if field stores data inline (simple types)
            /// </summary>
            public bool IsSimpleType
            {
                get
                {
                    if (f_isSimpleType)
                        return _isSimpleType;
                    f_isSimpleType = true;
                    _isSimpleType = (bool) ( ((FieldType == Gff.GffFieldType.Uint8) || (FieldType == Gff.GffFieldType.Int8) || (FieldType == Gff.GffFieldType.Uint16) || (FieldType == Gff.GffFieldType.Int16) || (FieldType == Gff.GffFieldType.Uint32) || (FieldType == Gff.GffFieldType.Int32) || (FieldType == Gff.GffFieldType.Single)) );
                    return _isSimpleType;
                }
            }
            private bool f_isStructType;
            private bool _isStructType;

            /// <summary>
            /// True if field is a nested struct
            /// </summary>
            public bool IsStructType
            {
                get
                {
                    if (f_isStructType)
                        return _isStructType;
                    f_isStructType = true;
                    _isStructType = (bool) (FieldType == Gff.GffFieldType.Struct);
                    return _isStructType;
                }
            }
            private bool f_listIndicesOffsetValue;
            private int? _listIndicesOffsetValue;

            /// <summary>
            /// Absolute file offset to list indices for list type fields
            /// </summary>
            public int? ListIndicesOffsetValue
            {
                get
                {
                    if (f_listIndicesOffsetValue)
                        return _listIndicesOffsetValue;
                    f_listIndicesOffsetValue = true;
                    if (IsListType) {
                        _listIndicesOffsetValue = (int) (M_Root.Header.ListIndicesOffset + DataOrOffset);
                    }
                    return _listIndicesOffsetValue;
                }
            }
            private bool f_structIndexValue;
            private uint? _structIndexValue;

            /// <summary>
            /// Struct index for struct type fields
            /// </summary>
            public uint? StructIndexValue
            {
                get
                {
                    if (f_structIndexValue)
                        return _structIndexValue;
                    f_structIndexValue = true;
                    if (IsStructType) {
                        _structIndexValue = (uint) (DataOrOffset);
                    }
                    return _structIndexValue;
                }
            }
            private GffFieldType _fieldType;
            private uint _labelIndex;
            private uint _dataOrOffset;
            private Gff m_root;
            private Gff.FieldArray m_parent;

            /// <summary>
            /// Field data type (see gff_field_type enum):
            /// - 0-5, 8: Simple types (stored inline in data_or_offset)
            /// - 6-7, 9-13, 16-17: Complex types (offset to field_data in data_or_offset)
            /// - 14: Struct (struct index in data_or_offset)
            /// - 15: List (offset to list_indices_array in data_or_offset)
            /// </summary>
            public GffFieldType FieldType { get { return _fieldType; } }

            /// <summary>
            /// Index into label_array for field name
            /// </summary>
            public uint LabelIndex { get { return _labelIndex; } }

            /// <summary>
            /// Inline data (simple types) or offset/index (complex types):
            /// - Simple types (0-5, 8): Value stored directly (1-4 bytes, sign/zero extended to 4 bytes)
            /// - Complex types (6-7, 9-13, 16-17): Byte offset into field_data section (relative to field_data_offset)
            /// - Struct (14): Struct index (index into struct_array)
            /// - List (15): Byte offset into list_indices_array (relative to list_indices_offset)
            /// </summary>
            public uint DataOrOffset { get { return _dataOrOffset; } }
            public Gff M_Root { get { return m_root; } }
            public Gff.FieldArray M_Parent { get { return m_parent; } }
        }
        public partial class FieldIndicesArray : KaitaiStruct
        {
            public static FieldIndicesArray FromFile(string fileName)
            {
                return new FieldIndicesArray(new KaitaiStream(fileName));
            }

            public FieldIndicesArray(KaitaiStream p__io, Gff p__parent = null, Gff p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _indices = new List<uint>();
                for (var i = 0; i < M_Root.Header.FieldIndicesCount; i++)
                {
                    _indices.Add(m_io.ReadU4le());
                }
            }
            private List<uint> _indices;
            private Gff m_root;
            private Gff m_parent;

            /// <summary>
            /// Array of field indices. When a struct has multiple fields, it stores an offset
            /// into this array, and the next N consecutive u4 values (where N = struct.field_count)
            /// are the field indices for that struct.
            /// </summary>
            public List<uint> Indices { get { return _indices; } }
            public Gff M_Root { get { return m_root; } }
            public Gff M_Parent { get { return m_parent; } }
        }
        public partial class GffHeader : KaitaiStruct
        {
            public static GffHeader FromFile(string fileName)
            {
                return new GffHeader(new KaitaiStream(fileName));
            }

            public GffHeader(KaitaiStream p__io, Gff p__parent = null, Gff p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fileType = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _fileVersion = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _structOffset = m_io.ReadU4le();
                _structCount = m_io.ReadU4le();
                _fieldOffset = m_io.ReadU4le();
                _fieldCount = m_io.ReadU4le();
                _labelOffset = m_io.ReadU4le();
                _labelCount = m_io.ReadU4le();
                _fieldDataOffset = m_io.ReadU4le();
                _fieldDataCount = m_io.ReadU4le();
                _fieldIndicesOffset = m_io.ReadU4le();
                _fieldIndicesCount = m_io.ReadU4le();
                _listIndicesOffset = m_io.ReadU4le();
                _listIndicesCount = m_io.ReadU4le();
            }
            private string _fileType;
            private string _fileVersion;
            private uint _structOffset;
            private uint _structCount;
            private uint _fieldOffset;
            private uint _fieldCount;
            private uint _labelOffset;
            private uint _labelCount;
            private uint _fieldDataOffset;
            private uint _fieldDataCount;
            private uint _fieldIndicesOffset;
            private uint _fieldIndicesCount;
            private uint _listIndicesOffset;
            private uint _listIndicesCount;
            private Gff m_root;
            private Gff m_parent;

            /// <summary>
            /// File type signature (FourCC). Examples: &quot;GFF &quot;, &quot;UTC &quot;, &quot;UTI &quot;, &quot;DLG &quot;, &quot;ARE &quot;, etc.
            /// Must match a valid GFFContent enum value.
            /// </summary>
            public string FileType { get { return _fileType; } }

            /// <summary>
            /// File format version. Must be &quot;V3.2&quot; for KotOR games.
            /// Later BioWare games use &quot;V3.3&quot;, &quot;V4.0&quot;, or &quot;V4.1&quot;.
            /// Valid values: &quot;V3.2&quot; (KotOR), &quot;V3.3&quot;, &quot;V4.0&quot;, &quot;V4.1&quot; (other BioWare games)
            /// </summary>
            public string FileVersion { get { return _fileVersion; } }

            /// <summary>
            /// Byte offset to struct array from beginning of file
            /// </summary>
            public uint StructOffset { get { return _structOffset; } }

            /// <summary>
            /// Number of struct entries in struct array
            /// </summary>
            public uint StructCount { get { return _structCount; } }

            /// <summary>
            /// Byte offset to field array from beginning of file
            /// </summary>
            public uint FieldOffset { get { return _fieldOffset; } }

            /// <summary>
            /// Number of field entries in field array
            /// </summary>
            public uint FieldCount { get { return _fieldCount; } }

            /// <summary>
            /// Byte offset to label array from beginning of file
            /// </summary>
            public uint LabelOffset { get { return _labelOffset; } }

            /// <summary>
            /// Number of labels in label array
            /// </summary>
            public uint LabelCount { get { return _labelCount; } }

            /// <summary>
            /// Byte offset to field data section from beginning of file
            /// </summary>
            public uint FieldDataOffset { get { return _fieldDataOffset; } }

            /// <summary>
            /// Size of field data section in bytes
            /// </summary>
            public uint FieldDataCount { get { return _fieldDataCount; } }

            /// <summary>
            /// Byte offset to field indices array from beginning of file
            /// </summary>
            public uint FieldIndicesOffset { get { return _fieldIndicesOffset; } }

            /// <summary>
            /// Number of field indices (total count across all structs with multiple fields)
            /// </summary>
            public uint FieldIndicesCount { get { return _fieldIndicesCount; } }

            /// <summary>
            /// Byte offset to list indices array from beginning of file
            /// </summary>
            public uint ListIndicesOffset { get { return _listIndicesOffset; } }

            /// <summary>
            /// Number of list indices entries
            /// </summary>
            public uint ListIndicesCount { get { return _listIndicesCount; } }
            public Gff M_Root { get { return m_root; } }
            public Gff M_Parent { get { return m_parent; } }
        }
        public partial class LabelArray : KaitaiStruct
        {
            public static LabelArray FromFile(string fileName)
            {
                return new LabelArray(new KaitaiStream(fileName));
            }

            public LabelArray(KaitaiStream p__io, Gff p__parent = null, Gff p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _labels = new List<LabelEntry>();
                for (var i = 0; i < M_Root.Header.LabelCount; i++)
                {
                    _labels.Add(new LabelEntry(m_io, this, m_root));
                }
            }
            private List<LabelEntry> _labels;
            private Gff m_root;
            private Gff m_parent;

            /// <summary>
            /// Array of label entries (16 bytes each)
            /// </summary>
            public List<LabelEntry> Labels { get { return _labels; } }
            public Gff M_Root { get { return m_root; } }
            public Gff M_Parent { get { return m_parent; } }
        }
        public partial class LabelEntry : KaitaiStruct
        {
            public static LabelEntry FromFile(string fileName)
            {
                return new LabelEntry(new KaitaiStream(fileName));
            }

            public LabelEntry(KaitaiStream p__io, Gff.LabelArray p__parent = null, Gff p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(16));
            }
            private string _name;
            private Gff m_root;
            private Gff.LabelArray m_parent;

            /// <summary>
            /// Field name label (null-padded to 16 bytes, null-terminated).
            /// The actual label length is determined by the first null byte.
            /// Application code should trim trailing null bytes when using this field.
            /// </summary>
            public string Name { get { return _name; } }
            public Gff M_Root { get { return m_root; } }
            public Gff.LabelArray M_Parent { get { return m_parent; } }
        }
        public partial class ListEntry : KaitaiStruct
        {
            public static ListEntry FromFile(string fileName)
            {
                return new ListEntry(new KaitaiStream(fileName));
            }

            public ListEntry(KaitaiStream p__io, KaitaiStruct p__parent = null, Gff p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numStructIndices = m_io.ReadU4le();
                _structIndices = new List<uint>();
                for (var i = 0; i < NumStructIndices; i++)
                {
                    _structIndices.Add(m_io.ReadU4le());
                }
            }
            private uint _numStructIndices;
            private List<uint> _structIndices;
            private Gff m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Number of struct indices in this list
            /// </summary>
            public uint NumStructIndices { get { return _numStructIndices; } }

            /// <summary>
            /// Array of struct indices (indices into struct_array)
            /// </summary>
            public List<uint> StructIndices { get { return _structIndices; } }
            public Gff M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class ListIndicesArray : KaitaiStruct
        {
            public static ListIndicesArray FromFile(string fileName)
            {
                return new ListIndicesArray(new KaitaiStream(fileName));
            }

            public ListIndicesArray(KaitaiStream p__io, Gff p__parent = null, Gff p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _rawData = m_io.ReadBytes(M_Root.Header.ListIndicesCount);
            }
            private byte[] _rawData;
            private Gff m_root;
            private Gff m_parent;

            /// <summary>
            /// Raw list indices data. List entries are accessed via offsets stored in
            /// list-type field entries (field_entry.list_indices_offset_value).
            /// Each entry starts with a count (u4), followed by that many struct indices (u4 each).
            /// 
            /// Note: This is a raw data block. In practice, list entries are accessed via
            /// offsets stored in list-type field entries, not as a sequential array.
            /// Use list_entry type to parse individual entries at specific offsets.
            /// </summary>
            public byte[] RawData { get { return _rawData; } }
            public Gff M_Root { get { return m_root; } }
            public Gff M_Parent { get { return m_parent; } }
        }
        public partial class StructArray : KaitaiStruct
        {
            public static StructArray FromFile(string fileName)
            {
                return new StructArray(new KaitaiStream(fileName));
            }

            public StructArray(KaitaiStream p__io, Gff p__parent = null, Gff p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<StructEntry>();
                for (var i = 0; i < M_Root.Header.StructCount; i++)
                {
                    _entries.Add(new StructEntry(m_io, this, m_root));
                }
            }
            private List<StructEntry> _entries;
            private Gff m_root;
            private Gff m_parent;

            /// <summary>
            /// Array of struct entries (12 bytes each)
            /// </summary>
            public List<StructEntry> Entries { get { return _entries; } }
            public Gff M_Root { get { return m_root; } }
            public Gff M_Parent { get { return m_parent; } }
        }
        public partial class StructEntry : KaitaiStruct
        {
            public static StructEntry FromFile(string fileName)
            {
                return new StructEntry(new KaitaiStream(fileName));
            }

            public StructEntry(KaitaiStream p__io, Gff.StructArray p__parent = null, Gff p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_fieldIndicesOffset = false;
                f_hasMultipleFields = false;
                f_hasSingleField = false;
                f_singleFieldIndex = false;
                _read();
            }
            private void _read()
            {
                _structId = m_io.ReadS4le();
                _dataOrOffset = m_io.ReadU4le();
                _fieldCount = m_io.ReadU4le();
            }
            private bool f_fieldIndicesOffset;
            private uint? _fieldIndicesOffset;

            /// <summary>
            /// Byte offset into field_indices_array when struct has multiple fields
            /// </summary>
            public uint? FieldIndicesOffset
            {
                get
                {
                    if (f_fieldIndicesOffset)
                        return _fieldIndicesOffset;
                    f_fieldIndicesOffset = true;
                    if (HasMultipleFields) {
                        _fieldIndicesOffset = (uint) (DataOrOffset);
                    }
                    return _fieldIndicesOffset;
                }
            }
            private bool f_hasMultipleFields;
            private bool _hasMultipleFields;

            /// <summary>
            /// True if struct has multiple fields (offset to field indices in data_or_offset)
            /// </summary>
            public bool HasMultipleFields
            {
                get
                {
                    if (f_hasMultipleFields)
                        return _hasMultipleFields;
                    f_hasMultipleFields = true;
                    _hasMultipleFields = (bool) (FieldCount > 1);
                    return _hasMultipleFields;
                }
            }
            private bool f_hasSingleField;
            private bool _hasSingleField;

            /// <summary>
            /// True if struct has exactly one field (direct field index in data_or_offset)
            /// </summary>
            public bool HasSingleField
            {
                get
                {
                    if (f_hasSingleField)
                        return _hasSingleField;
                    f_hasSingleField = true;
                    _hasSingleField = (bool) (FieldCount == 1);
                    return _hasSingleField;
                }
            }
            private bool f_singleFieldIndex;
            private uint? _singleFieldIndex;

            /// <summary>
            /// Direct field index when struct has exactly one field
            /// </summary>
            public uint? SingleFieldIndex
            {
                get
                {
                    if (f_singleFieldIndex)
                        return _singleFieldIndex;
                    f_singleFieldIndex = true;
                    if (HasSingleField) {
                        _singleFieldIndex = (uint) (DataOrOffset);
                    }
                    return _singleFieldIndex;
                }
            }
            private int _structId;
            private uint _dataOrOffset;
            private uint _fieldCount;
            private Gff m_root;
            private Gff.StructArray m_parent;

            /// <summary>
            /// Structure type identifier. Often 0xFFFFFFFF (-1) for generic structs.
            /// Used to identify struct types in schema-aware parsers.
            /// </summary>
            public int StructId { get { return _structId; } }

            /// <summary>
            /// Field index (if field_count == 1) or byte offset to field indices array (if field_count &gt; 1).
            /// If field_count == 0, this value is unused.
            /// </summary>
            public uint DataOrOffset { get { return _dataOrOffset; } }

            /// <summary>
            /// Number of fields in this struct:
            /// - 0: No fields
            /// - 1: Single field, data_or_offset contains the field index directly
            /// - &gt;1: Multiple fields, data_or_offset contains byte offset into field_indices_array
            /// </summary>
            public uint FieldCount { get { return _fieldCount; } }
            public Gff M_Root { get { return m_root; } }
            public Gff.StructArray M_Parent { get { return m_parent; } }
        }
        private bool f_fieldArray;
        private FieldArray _fieldArray;

        /// <summary>
        /// Array of field entries (12 bytes each)
        /// </summary>
        public FieldArray FieldArray
        {
            get
            {
                if (f_fieldArray)
                    return _fieldArray;
                f_fieldArray = true;
                if (Header.FieldCount > 0) {
                    long _pos = m_io.Pos;
                    m_io.Seek(Header.FieldOffset);
                    _fieldArray = new FieldArray(m_io, this, m_root);
                    m_io.Seek(_pos);
                }
                return _fieldArray;
            }
        }
        private bool f_fieldData;
        private FieldData _fieldData;

        /// <summary>
        /// Storage area for complex field types (strings, binary, vectors, etc.)
        /// </summary>
        public FieldData FieldData
        {
            get
            {
                if (f_fieldData)
                    return _fieldData;
                f_fieldData = true;
                if (Header.FieldDataCount > 0) {
                    long _pos = m_io.Pos;
                    m_io.Seek(Header.FieldDataOffset);
                    _fieldData = new FieldData(m_io, this, m_root);
                    m_io.Seek(_pos);
                }
                return _fieldData;
            }
        }
        private bool f_fieldIndicesArray;
        private FieldIndicesArray _fieldIndicesArray;

        /// <summary>
        /// Array of field index arrays (used when structs have multiple fields)
        /// </summary>
        public FieldIndicesArray FieldIndicesArray
        {
            get
            {
                if (f_fieldIndicesArray)
                    return _fieldIndicesArray;
                f_fieldIndicesArray = true;
                if (Header.FieldIndicesCount > 0) {
                    long _pos = m_io.Pos;
                    m_io.Seek(Header.FieldIndicesOffset);
                    _fieldIndicesArray = new FieldIndicesArray(m_io, this, m_root);
                    m_io.Seek(_pos);
                }
                return _fieldIndicesArray;
            }
        }
        private bool f_labelArray;
        private LabelArray _labelArray;

        /// <summary>
        /// Array of 16-byte null-padded field name labels
        /// </summary>
        public LabelArray LabelArray
        {
            get
            {
                if (f_labelArray)
                    return _labelArray;
                f_labelArray = true;
                if (Header.LabelCount > 0) {
                    long _pos = m_io.Pos;
                    m_io.Seek(Header.LabelOffset);
                    _labelArray = new LabelArray(m_io, this, m_root);
                    m_io.Seek(_pos);
                }
                return _labelArray;
            }
        }
        private bool f_listIndicesArray;
        private ListIndicesArray _listIndicesArray;

        /// <summary>
        /// Array of list entry structures (count + struct indices)
        /// </summary>
        public ListIndicesArray ListIndicesArray
        {
            get
            {
                if (f_listIndicesArray)
                    return _listIndicesArray;
                f_listIndicesArray = true;
                if (Header.ListIndicesCount > 0) {
                    long _pos = m_io.Pos;
                    m_io.Seek(Header.ListIndicesOffset);
                    _listIndicesArray = new ListIndicesArray(m_io, this, m_root);
                    m_io.Seek(_pos);
                }
                return _listIndicesArray;
            }
        }
        private bool f_structArray;
        private StructArray _structArray;

        /// <summary>
        /// Array of struct entries (12 bytes each)
        /// </summary>
        public StructArray StructArray
        {
            get
            {
                if (f_structArray)
                    return _structArray;
                f_structArray = true;
                if (Header.StructCount > 0) {
                    long _pos = m_io.Pos;
                    m_io.Seek(Header.StructOffset);
                    _structArray = new StructArray(m_io, this, m_root);
                    m_io.Seek(_pos);
                }
                return _structArray;
            }
        }
        private GffHeader _header;
        private Gff m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// GFF file header (56 bytes total)
        /// </summary>
        public GffHeader Header { get { return _header; } }
        public Gff M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
