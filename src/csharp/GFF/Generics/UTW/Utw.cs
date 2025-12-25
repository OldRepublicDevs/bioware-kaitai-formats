// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// UTW (User Template Waypoint) files are GFF-based format files that define waypoint templates.
    /// Waypoints are invisible markers used for spawn points, navigation targets, map notes, and
    /// reference points for scripts. UTW files use the GFF (Generic File Format) binary structure
    /// with file type signature &quot;UTW &quot;.
    /// 
    /// UTW files contain:
    /// - Root struct with waypoint metadata:
    ///   - TemplateResRef: Template identifier for this waypoint (ResRef)
    ///   - Tag: Unique tag for script/linking references (String)
    ///   - LocalizedName: Waypoint name displayed in game (LocalizedString)
    ///   - Description: Description text (LocalizedString, typically unused)
    ///   - Comment: Developer comment/notes (String, not used by game engine)
    /// - Map Note Functionality:
    ///   - HasMapNote: Whether waypoint has a map note (Byte, boolean)
    ///   - MapNoteEnabled: Map note is initially visible (Byte, boolean)
    ///   - MapNote: Text displayed on map (LocalizedString)
    /// - Linking &amp; Appearance:
    ///   - LinkedTo: Tag of linked object (String, typically unused)
    ///   - Appearance: Appearance type (Byte, 1=Waypoint)
    ///   - PaletteID: Toolset palette category (Byte)
    /// 
    /// Waypoints are used for:
    /// - Spawn Points: CreateObject uses waypoint location
    /// - Patrols: AI walks between waypoints
    /// - Teleport: JumpToLocation targets waypoints
    /// - Transitions: Doors/Triggers link to waypoint tags
    /// - Map Notes: Display quest objectives and locations on map
    /// 
    /// References:
    /// - vendor/PyKotor/wiki/GFF-UTW.md
    /// - vendor/PyKotor/wiki/GFF-File-Format.md
    /// - vendor/PyKotor/wiki/Bioware-Aurora-Waypoint.md
    /// - vendor/PyKotor/Libraries/PyKotor/src/pykotor/resource/generics/utw.py
    /// - vendor/reone/src/libs/resource/parser/gff/utw.cpp
    /// </summary>
    public partial class Utw : KaitaiStruct
    {
        public static Utw FromFile(string fileName)
        {
            return new Utw(new KaitaiStream(fileName));
        }

        public Utw(KaitaiStream p__io, KaitaiStruct p__parent = null, Utw p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _gffHeader = new GffHeader(m_io, this, m_root);
            if (GffHeader.LabelCount > 0) {
                _labelArray = new LabelArray(m_io, this, m_root);
            }
            _structArray = new StructArray(m_io, this, m_root);
            _fieldArray = new FieldArray(m_io, this, m_root);
            if (GffHeader.FieldDataCount > 0) {
                _fieldData = new FieldDataSection(m_io, this, m_root);
            }
            if (GffHeader.FieldIndicesCount > 0) {
                _fieldIndices = new FieldIndicesArray(m_io, this, m_root);
            }
            if (GffHeader.ListIndicesCount > 0) {
                _listIndices = new ListIndicesArray(m_io, this, m_root);
            }
        }
        public partial class FieldArray : KaitaiStruct
        {
            public static FieldArray FromFile(string fileName)
            {
                return new FieldArray(new KaitaiStream(fileName));
            }

            public FieldArray(KaitaiStream p__io, Utw p__parent = null, Utw p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<FieldEntry>();
                for (var i = 0; i < M_Root.GffHeader.FieldCount; i++)
                {
                    _entries.Add(new FieldEntry(m_io, this, m_root));
                }
            }
            private List<FieldEntry> _entries;
            private Utw m_root;
            private Utw m_parent;

            /// <summary>
            /// Array of field entries
            /// </summary>
            public List<FieldEntry> Entries { get { return _entries; } }
            public Utw M_Root { get { return m_root; } }
            public Utw M_Parent { get { return m_parent; } }
        }
        public partial class FieldDataSection : KaitaiStruct
        {
            public static FieldDataSection FromFile(string fileName)
            {
                return new FieldDataSection(new KaitaiStream(fileName));
            }

            public FieldDataSection(KaitaiStream p__io, Utw p__parent = null, Utw p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _data = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(M_Root.GffHeader.FieldDataCount));
            }
            private string _data;
            private Utw m_root;
            private Utw m_parent;

            /// <summary>
            /// Raw field data bytes for complex types.
            /// UTW files store:
            /// - ResRef data: 1-byte length + up to 16 bytes of ASCII string
            /// - String data: 4-byte length + string bytes (ASCII/UTF-8)
            /// - LocalizedString data: Variable size (see GFF.ksy localized_string_data type)
            ///   Contains string reference ID, language count, and language-specific substrings
            /// </summary>
            public string Data { get { return _data; } }
            public Utw M_Root { get { return m_root; } }
            public Utw M_Parent { get { return m_parent; } }
        }
        public partial class FieldEntry : KaitaiStruct
        {
            public static FieldEntry FromFile(string fileName)
            {
                return new FieldEntry(new KaitaiStream(fileName));
            }

            public FieldEntry(KaitaiStream p__io, Utw.FieldArray p__parent = null, Utw p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fieldType = m_io.ReadU4le();
                _labelIndex = m_io.ReadU4le();
                _dataOrOffset = m_io.ReadU4le();
            }
            private uint _fieldType;
            private uint _labelIndex;
            private uint _dataOrOffset;
            private Utw m_root;
            private Utw.FieldArray m_parent;

            /// <summary>
            /// Field data type (see GFFFieldType enum):
            /// 0 = Byte (UInt8)
            /// 1 = Char (Int8)
            /// 2 = UInt16
            /// 3 = Int16
            /// 4 = UInt32
            /// 5 = Int32
            /// 6 = UInt64
            /// 7 = Int64
            /// 8 = Single (Float32)
            /// 9 = Double (Float64)
            /// 10 = CExoString (String)
            /// 11 = ResRef
            /// 12 = CExoLocString (LocalizedString)
            /// 13 = Void (Binary)
            /// 14 = Struct
            /// 15 = List
            /// 16 = Vector3
            /// 17 = Vector4
            /// 
            /// UTW-specific field types:
            /// - TemplateResRef: field_type = 11 (ResRef)
            /// - Tag: field_type = 10 (String)
            /// - LocalizedName: field_type = 12 (LocalizedString)
            /// - Description: field_type = 12 (LocalizedString)
            /// - Comment: field_type = 10 (String)
            /// - HasMapNote: field_type = 0 (Byte)
            /// - MapNoteEnabled: field_type = 0 (Byte)
            /// - MapNote: field_type = 12 (LocalizedString)
            /// - LinkedTo: field_type = 10 (String)
            /// - Appearance: field_type = 0 (Byte)
            /// - PaletteID: field_type = 0 (Byte)
            /// </summary>
            public uint FieldType { get { return _fieldType; } }

            /// <summary>
            /// Index into label_array for field name
            /// </summary>
            public uint LabelIndex { get { return _labelIndex; } }

            /// <summary>
            /// For simple types (Byte, Char, UInt16, Int16, UInt32, Int32, UInt64, Int64, Single, Double):
            ///   Inline data value (stored directly in this field)
            /// For complex types (String, ResRef, LocalizedString, Binary, Vector3, Vector4):
            ///   Byte offset into field_data section
            /// For Struct type:
            ///   Struct index into struct_array
            /// For List type:
            ///   Byte offset into list_indices array
            /// </summary>
            public uint DataOrOffset { get { return _dataOrOffset; } }
            public Utw M_Root { get { return m_root; } }
            public Utw.FieldArray M_Parent { get { return m_parent; } }
        }
        public partial class FieldIndicesArray : KaitaiStruct
        {
            public static FieldIndicesArray FromFile(string fileName)
            {
                return new FieldIndicesArray(new KaitaiStream(fileName));
            }

            public FieldIndicesArray(KaitaiStream p__io, Utw p__parent = null, Utw p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _indices = new List<uint>();
                for (var i = 0; i < M_Root.GffHeader.FieldIndicesCount; i++)
                {
                    _indices.Add(m_io.ReadU4le());
                }
            }
            private List<uint> _indices;
            private Utw m_root;
            private Utw m_parent;

            /// <summary>
            /// Array of field indices (uint32 values) for structs with multiple fields.
            /// Used when a struct has more than one field - the struct_entry.data_or_offset
            /// points to an offset in this array, which contains the field indices.
            /// UTW root struct typically has multiple fields, so this array is used.
            /// </summary>
            public List<uint> Indices { get { return _indices; } }
            public Utw M_Root { get { return m_root; } }
            public Utw M_Parent { get { return m_parent; } }
        }
        public partial class GffHeader : KaitaiStruct
        {
            public static GffHeader FromFile(string fileName)
            {
                return new GffHeader(new KaitaiStream(fileName));
            }

            public GffHeader(KaitaiStream p__io, Utw p__parent = null, Utw p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fileType = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _fileVersion = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _structArrayOffset = m_io.ReadU4le();
                _structCount = m_io.ReadU4le();
                _fieldArrayOffset = m_io.ReadU4le();
                _fieldCount = m_io.ReadU4le();
                _labelArrayOffset = m_io.ReadU4le();
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
            private uint _structArrayOffset;
            private uint _structCount;
            private uint _fieldArrayOffset;
            private uint _fieldCount;
            private uint _labelArrayOffset;
            private uint _labelCount;
            private uint _fieldDataOffset;
            private uint _fieldDataCount;
            private uint _fieldIndicesOffset;
            private uint _fieldIndicesCount;
            private uint _listIndicesOffset;
            private uint _listIndicesCount;
            private Utw m_root;
            private Utw m_parent;

            /// <summary>
            /// File type signature. Must be &quot;UTW &quot; for waypoint template files.
            /// Other GFF types: &quot;GFF &quot;, &quot;DLG &quot;, &quot;ARE &quot;, &quot;UTC &quot;, &quot;UTI &quot;, &quot;UTM &quot;, etc.
            /// </summary>
            public string FileType { get { return _fileType; } }

            /// <summary>
            /// File format version. Typically &quot;V3.2&quot; for KotOR.
            /// Other versions: &quot;V3.3&quot;, &quot;V4.0&quot;, &quot;V4.1&quot; for other BioWare games.
            /// </summary>
            public string FileVersion { get { return _fileVersion; } }

            /// <summary>
            /// Byte offset to struct array from the beginning of the file
            /// </summary>
            public uint StructArrayOffset { get { return _structArrayOffset; } }

            /// <summary>
            /// Number of structs in the struct array
            /// </summary>
            public uint StructCount { get { return _structCount; } }

            /// <summary>
            /// Byte offset to field array from the beginning of the file
            /// </summary>
            public uint FieldArrayOffset { get { return _fieldArrayOffset; } }

            /// <summary>
            /// Number of fields in the field array
            /// </summary>
            public uint FieldCount { get { return _fieldCount; } }

            /// <summary>
            /// Byte offset to label array from the beginning of the file
            /// </summary>
            public uint LabelArrayOffset { get { return _labelArrayOffset; } }

            /// <summary>
            /// Number of labels in the label array
            /// </summary>
            public uint LabelCount { get { return _labelCount; } }

            /// <summary>
            /// Byte offset to field data section from the beginning of the file
            /// </summary>
            public uint FieldDataOffset { get { return _fieldDataOffset; } }

            /// <summary>
            /// Size of field data section in bytes
            /// </summary>
            public uint FieldDataCount { get { return _fieldDataCount; } }

            /// <summary>
            /// Byte offset to field indices array from the beginning of the file
            /// </summary>
            public uint FieldIndicesOffset { get { return _fieldIndicesOffset; } }

            /// <summary>
            /// Number of field indices (uint32 values) in the field indices array
            /// </summary>
            public uint FieldIndicesCount { get { return _fieldIndicesCount; } }

            /// <summary>
            /// Byte offset to list indices array from the beginning of the file
            /// </summary>
            public uint ListIndicesOffset { get { return _listIndicesOffset; } }

            /// <summary>
            /// Number of list indices (uint32 values) in the list indices array
            /// </summary>
            public uint ListIndicesCount { get { return _listIndicesCount; } }
            public Utw M_Root { get { return m_root; } }
            public Utw M_Parent { get { return m_parent; } }
        }
        public partial class LabelArray : KaitaiStruct
        {
            public static LabelArray FromFile(string fileName)
            {
                return new LabelArray(new KaitaiStream(fileName));
            }

            public LabelArray(KaitaiStream p__io, Utw p__parent = null, Utw p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _labels = new List<string>();
                for (var i = 0; i < M_Root.GffHeader.LabelCount; i++)
                {
                    _labels.Add(System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(16)));
                }
            }
            private List<string> _labels;
            private Utw m_root;
            private Utw m_parent;

            /// <summary>
            /// Array of 16-byte null-terminated field name labels.
            /// Common UTW labels include:
            /// - &quot;TemplateResRef&quot; (ResRef field in root struct)
            /// - &quot;Tag&quot; (String field in root struct)
            /// - &quot;LocalizedName&quot; (LocalizedString field in root struct)
            /// - &quot;Description&quot; (LocalizedString field in root struct)
            /// - &quot;Comment&quot; (String field in root struct)
            /// - &quot;HasMapNote&quot; (Byte field in root struct)
            /// - &quot;MapNoteEnabled&quot; (Byte field in root struct)
            /// - &quot;MapNote&quot; (LocalizedString field in root struct)
            /// - &quot;LinkedTo&quot; (String field in root struct)
            /// - &quot;Appearance&quot; (Byte field in root struct)
            /// - &quot;PaletteID&quot; (Byte field in root struct)
            /// </summary>
            public List<string> Labels { get { return _labels; } }
            public Utw M_Root { get { return m_root; } }
            public Utw M_Parent { get { return m_parent; } }
        }
        public partial class ListIndicesArray : KaitaiStruct
        {
            public static ListIndicesArray FromFile(string fileName)
            {
                return new ListIndicesArray(new KaitaiStream(fileName));
            }

            public ListIndicesArray(KaitaiStream p__io, Utw p__parent = null, Utw p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _indices = new List<uint>();
                for (var i = 0; i < M_Root.GffHeader.ListIndicesCount; i++)
                {
                    _indices.Add(m_io.ReadU4le());
                }
            }
            private List<uint> _indices;
            private Utw m_root;
            private Utw m_parent;

            /// <summary>
            /// Array of list indices (uint32 values) for LIST type fields.
            /// UTW files typically do not contain LIST fields in the root struct,
            /// but this array exists for compatibility with GFF format.
            /// </summary>
            public List<uint> Indices { get { return _indices; } }
            public Utw M_Root { get { return m_root; } }
            public Utw M_Parent { get { return m_parent; } }
        }
        public partial class StructArray : KaitaiStruct
        {
            public static StructArray FromFile(string fileName)
            {
                return new StructArray(new KaitaiStream(fileName));
            }

            public StructArray(KaitaiStream p__io, Utw p__parent = null, Utw p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<StructEntry>();
                for (var i = 0; i < M_Root.GffHeader.StructCount; i++)
                {
                    _entries.Add(new StructEntry(m_io, this, m_root));
                }
            }
            private List<StructEntry> _entries;
            private Utw m_root;
            private Utw m_parent;

            /// <summary>
            /// Array of struct entries
            /// </summary>
            public List<StructEntry> Entries { get { return _entries; } }
            public Utw M_Root { get { return m_root; } }
            public Utw M_Parent { get { return m_parent; } }
        }
        public partial class StructEntry : KaitaiStruct
        {
            public static StructEntry FromFile(string fileName)
            {
                return new StructEntry(new KaitaiStream(fileName));
            }

            public StructEntry(KaitaiStream p__io, Utw.StructArray p__parent = null, Utw p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _structId = m_io.ReadS4le();
                _dataOrOffset = m_io.ReadU4le();
                _fieldCount = m_io.ReadU4le();
            }
            private int _structId;
            private uint _dataOrOffset;
            private uint _fieldCount;
            private Utw m_root;
            private Utw.StructArray m_parent;

            /// <summary>
            /// Structure type identifier.
            /// Root struct always has struct_id = 0xFFFFFFFF (-1).
            /// Other structs have programmer-defined IDs.
            /// </summary>
            public int StructId { get { return _structId; } }

            /// <summary>
            /// If field_count = 1: Direct field index into field_array.
            /// If field_count &gt; 1: Byte offset into field_indices array.
            /// If field_count = 0: Unused (empty struct).
            /// </summary>
            public uint DataOrOffset { get { return _dataOrOffset; } }

            /// <summary>
            /// Number of fields in this struct (0, 1, or &gt;1)
            /// </summary>
            public uint FieldCount { get { return _fieldCount; } }
            public Utw M_Root { get { return m_root; } }
            public Utw.StructArray M_Parent { get { return m_parent; } }
        }
        private GffHeader _gffHeader;
        private LabelArray _labelArray;
        private StructArray _structArray;
        private FieldArray _fieldArray;
        private FieldDataSection _fieldData;
        private FieldIndicesArray _fieldIndices;
        private ListIndicesArray _listIndices;
        private Utw m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// GFF file header (56 bytes)
        /// </summary>
        public GffHeader GffHeader { get { return _gffHeader; } }

        /// <summary>
        /// Array of field name labels (16-byte null-terminated strings)
        /// </summary>
        public LabelArray LabelArray { get { return _labelArray; } }

        /// <summary>
        /// Array of struct entries (12 bytes each)
        /// </summary>
        public StructArray StructArray { get { return _structArray; } }

        /// <summary>
        /// Array of field entries (12 bytes each)
        /// </summary>
        public FieldArray FieldArray { get { return _fieldArray; } }

        /// <summary>
        /// Field data section for complex types (strings, ResRefs, LocalizedStrings, etc.)
        /// </summary>
        public FieldDataSection FieldData { get { return _fieldData; } }

        /// <summary>
        /// Field indices array (MultiMap) for structs with multiple fields
        /// </summary>
        public FieldIndicesArray FieldIndices { get { return _fieldIndices; } }

        /// <summary>
        /// List indices array for LIST type fields
        /// </summary>
        public ListIndicesArray ListIndices { get { return _listIndices; } }
        public Utw M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
