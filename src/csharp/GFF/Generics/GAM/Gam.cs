// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// GAM (Game State) files are GFF-based format files that store game state information
    /// including party members, global variables, game time, and time played.
    /// 
    /// GAM files are used by:
    /// - Aurora Engine (Neverwinter Nights, Neverwinter Nights 2)
    /// - Infinity Engine (Mass Effect, Dragon Age Origins, Dragon Age 2)
    /// 
    /// NOTE: Odyssey Engine (Knights of the Old Republic, Knights of the Old Republic 2)
    /// does NOT use GAM format - it uses NFO format for save games instead.
    /// 
    /// GAM files use the GFF (Generic File Format) binary structure with file type signature &quot;GAM &quot;.
    /// 
    /// Root struct fields:
    /// - GameTimeHour (Int32): Current game time hour (0-23)
    /// - GameTimeMinute (Int32): Current game time minute (0-59)
    /// - GameTimeSecond (Int32): Current game time second (0-59)
    /// - GameTimeMillisecond (Int32): Current game time millisecond (0-999)
    /// - TimePlayed (Int32): Total time played in seconds
    /// 
    /// - PartyList (List): Array of party member structs
    ///   - PartyMember (ResRef): Resource reference to party member creature file
    /// 
    /// - GlobalBooleans (List): Array of boolean global variable structs
    ///   - Name (String): Variable name
    ///   - Value (UInt8): Variable value (0 = false, 1 = true)
    /// 
    /// - GlobalNumbers (List): Array of numeric global variable structs
    ///   - Name (String): Variable name
    ///   - Value (Int32): Variable value
    /// 
    /// - GlobalStrings (List): Array of string global variable structs
    ///   - Name (String): Variable name
    ///   - Value (String): Variable value
    /// 
    /// Aurora Engine-specific fields (nwmain.exe, nwn2main.exe):
    /// - ModuleName (String): Current module name
    /// - CurrentArea (ResRef): Resource reference to current area file
    /// - PlayerCharacter (ResRef): Resource reference to player character creature file
    /// 
    /// Infinity Engine-specific fields (daorigins.exe, DragonAge2.exe, MassEffect.exe, MassEffect2.exe):
    /// - GameName (String): Game name/identifier
    /// - Chapter (Int32): Current chapter number
    /// - JournalEntries (List): Array of journal entry structs
    ///   - TextStrRef (Int32): String reference ID for journal entry text
    ///   - Completed (UInt8): Whether journal entry is completed (0 = false, 1 = true)
    ///   - Category (Int32): Journal entry category ID
    /// 
    /// References:
    /// - vendor/PyKotor/wiki/Bioware-Aurora-GFF.md
    /// - vendor/PyKotor/wiki/GFF-File-Format.md
    /// - src/Andastra/Parsing/Resource/Formats/GFF/Generics/GAM.cs
    /// - src/Andastra/Parsing/Resource/Formats/GFF/Generics/GAMHelpers.cs
    /// </summary>
    public partial class Gam : KaitaiStruct
    {
        public static Gam FromFile(string fileName)
        {
            return new Gam(new KaitaiStream(fileName));
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
        public Gam(KaitaiStream p__io, KaitaiStruct p__parent = null, Gam p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _gffHeader = new GffHeader(m_io, this, m_root);
        }
        public partial class FieldArray : KaitaiStruct
        {
            public static FieldArray FromFile(string fileName)
            {
                return new FieldArray(new KaitaiStream(fileName));
            }

            public FieldArray(KaitaiStream p__io, KaitaiStruct p__parent = null, Gam p__root = null) : base(p__io)
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
            private Gam m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Array of field entries
            /// </summary>
            public List<FieldEntry> Entries { get { return _entries; } }
            public Gam M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class FieldDataSection : KaitaiStruct
        {
            public static FieldDataSection FromFile(string fileName)
            {
                return new FieldDataSection(new KaitaiStream(fileName));
            }

            public FieldDataSection(KaitaiStream p__io, KaitaiStruct p__parent = null, Gam p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _rawData = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(M_Root.GffHeader.FieldDataCount));
            }
            private string _rawData;
            private Gam m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Raw field data storage. Individual field data entries are accessed via
            /// field_entry.field_data_offset_value offsets. The structure of each entry
            /// depends on the field_type:
            /// - UInt64/Int64/Double: 8 bytes
            /// - String: 4-byte length (u4) + string bytes (ASCII)
            /// - ResRef: 1-byte length (u1, max 16) + string bytes (ASCII, null-padded)
            /// - LocalizedString: variable (see localized_string_data type)
            /// - Binary: 4-byte length (u4) + binary bytes
            /// - Vector3: 12 bytes (3×f4, little-endian)
            /// - Vector4: 16 bytes (4×f4, little-endian)
            /// </summary>
            public string RawData { get { return _rawData; } }
            public Gam M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class FieldEntry : KaitaiStruct
        {
            public static FieldEntry FromFile(string fileName)
            {
                return new FieldEntry(new KaitaiStream(fileName));
            }

            public FieldEntry(KaitaiStream p__io, Gam.FieldArray p__parent = null, Gam p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fieldType = ((Gam.GffFieldType) m_io.ReadU4le());
                _labelIndex = m_io.ReadU4le();
                _dataOrOffset = m_io.ReadU4le();
            }
            private GffFieldType _fieldType;
            private uint _labelIndex;
            private uint _dataOrOffset;
            private Gam m_root;
            private Gam.FieldArray m_parent;

            /// <summary>
            /// Field data type (see gff_field_type enum):
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
            /// </summary>
            public GffFieldType FieldType { get { return _fieldType; } }

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
            public Gam M_Root { get { return m_root; } }
            public Gam.FieldArray M_Parent { get { return m_parent; } }
        }
        public partial class FieldIndicesArray : KaitaiStruct
        {
            public static FieldIndicesArray FromFile(string fileName)
            {
                return new FieldIndicesArray(new KaitaiStream(fileName));
            }

            public FieldIndicesArray(KaitaiStream p__io, KaitaiStruct p__parent = null, Gam p__root = null) : base(p__io)
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
            private Gam m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Array of field indices (uint32 values) for structs with multiple fields
            /// </summary>
            public List<uint> Indices { get { return _indices; } }
            public Gam M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class GffHeader : KaitaiStruct
        {
            public static GffHeader FromFile(string fileName)
            {
                return new GffHeader(new KaitaiStream(fileName));
            }

            public GffHeader(KaitaiStream p__io, Gam p__parent = null, Gam p__root = null) : base(p__io)
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
            private Gam m_root;
            private Gam m_parent;

            /// <summary>
            /// File type signature. Must be &quot;GAM &quot; (space-padded) for game state files.
            /// Other GFF types: &quot;GFF &quot;, &quot;ARE &quot;, &quot;UTC &quot;, &quot;UTI &quot;, &quot;DLG &quot;, etc.
            /// </summary>
            public string FileType { get { return _fileType; } }

            /// <summary>
            /// File format version. Typically &quot;V3.2&quot; for KotOR-era games.
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
            public Gam M_Root { get { return m_root; } }
            public Gam M_Parent { get { return m_parent; } }
        }
        public partial class LabelArray : KaitaiStruct
        {
            public static LabelArray FromFile(string fileName)
            {
                return new LabelArray(new KaitaiStream(fileName));
            }

            public LabelArray(KaitaiStream p__io, KaitaiStruct p__parent = null, Gam p__root = null) : base(p__io)
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
            private Gam m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Array of 16-byte null-terminated field name labels
            /// </summary>
            public List<string> Labels { get { return _labels; } }
            public Gam M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class ListEntry : KaitaiStruct
        {
            public static ListEntry FromFile(string fileName)
            {
                return new ListEntry(new KaitaiStream(fileName));
            }

            public ListEntry(KaitaiStream p__io, KaitaiStruct p__parent = null, Gam p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _count = m_io.ReadU4le();
                _structIndices = new List<uint>();
                for (var i = 0; i < Count; i++)
                {
                    _structIndices.Add(m_io.ReadU4le());
                }
            }
            private uint _count;
            private List<uint> _structIndices;
            private Gam m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Number of struct indices in this list
            /// </summary>
            public uint Count { get { return _count; } }

            /// <summary>
            /// Array of struct indices (indices into struct_array)
            /// </summary>
            public List<uint> StructIndices { get { return _structIndices; } }
            public Gam M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class ListIndicesArray : KaitaiStruct
        {
            public static ListIndicesArray FromFile(string fileName)
            {
                return new ListIndicesArray(new KaitaiStream(fileName));
            }

            public ListIndicesArray(KaitaiStream p__io, KaitaiStruct p__parent = null, Gam p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _rawData = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(M_Root.GffHeader.ListIndicesCount));
            }
            private string _rawData;
            private Gam m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Raw list indices data. List entries are accessed via offsets stored in
            /// list-type field entries (field_entry.list_indices_offset_value).
            /// Each entry starts with a count (u4), followed by that many struct indices (u4 each).
            /// 
            /// Note: This is a raw data block. In practice, list entries are accessed via
            /// offsets stored in list-type field entries, not as a sequential array.
            /// Use list_entry type to parse individual entries at specific offsets.
            /// </summary>
            public string RawData { get { return _rawData; } }
            public Gam M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class LocalizedStringData : KaitaiStruct
        {
            public static LocalizedStringData FromFile(string fileName)
            {
                return new LocalizedStringData(new KaitaiStream(fileName));
            }

            public LocalizedStringData(KaitaiStream p__io, KaitaiStruct p__parent = null, Gam p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _totalSize = m_io.ReadU4le();
                _stringRef = m_io.ReadU4le();
                _stringCount = m_io.ReadU4le();
                _substrings = new List<LocalizedSubstring>();
                for (var i = 0; i < StringCount; i++)
                {
                    _substrings.Add(new LocalizedSubstring(m_io, this, m_root));
                }
            }
            private uint _totalSize;
            private uint _stringRef;
            private uint _stringCount;
            private List<LocalizedSubstring> _substrings;
            private Gam m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Total size of this LocalizedString structure in bytes (not including this count).
            /// Used for skipping over the structure, but can be calculated from the data.
            /// </summary>
            public uint TotalSize { get { return _totalSize; } }

            /// <summary>
            /// String reference ID (StrRef) into dialog.tlk file.
            /// Value 0xFFFFFFFF indicates no string reference (-1).
            /// </summary>
            public uint StringRef { get { return _stringRef; } }

            /// <summary>
            /// Number of language-specific string substrings
            /// </summary>
            public uint StringCount { get { return _stringCount; } }

            /// <summary>
            /// Array of language-specific string substrings
            /// </summary>
            public List<LocalizedSubstring> Substrings { get { return _substrings; } }
            public Gam M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class LocalizedSubstring : KaitaiStruct
        {
            public static LocalizedSubstring FromFile(string fileName)
            {
                return new LocalizedSubstring(new KaitaiStream(fileName));
            }

            public LocalizedSubstring(KaitaiStream p__io, Gam.LocalizedStringData p__parent = null, Gam p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_genderId = false;
                f_languageId = false;
                _read();
            }
            private void _read()
            {
                _stringId = m_io.ReadU4le();
                _stringLength = m_io.ReadU4le();
                _stringData = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(StringLength));
            }
            private bool f_genderId;
            private int _genderId;

            /// <summary>
            /// Gender ID (0 = Male, 1 = Female)
            /// </summary>
            public int GenderId
            {
                get
                {
                    if (f_genderId)
                        return _genderId;
                    f_genderId = true;
                    _genderId = (int) (StringId & 255);
                    return _genderId;
                }
            }
            private bool f_languageId;
            private int _languageId;

            /// <summary>
            /// Language ID (extracted from string_id)
            /// </summary>
            public int LanguageId
            {
                get
                {
                    if (f_languageId)
                        return _languageId;
                    f_languageId = true;
                    _languageId = (int) (StringId >> 8 & 255);
                    return _languageId;
                }
            }
            private uint _stringId;
            private uint _stringLength;
            private string _stringData;
            private Gam m_root;
            private Gam.LocalizedStringData m_parent;

            /// <summary>
            /// String ID encoding language and gender:
            /// - Bits 0-7: Gender (0 = Male, 1 = Female)
            /// - Bits 8-15: Language ID (see Language enum)
            /// - Bits 16-31: Reserved/unused
            /// </summary>
            public uint StringId { get { return _stringId; } }

            /// <summary>
            /// Length of string data in bytes
            /// </summary>
            public uint StringLength { get { return _stringLength; } }

            /// <summary>
            /// String data (encoding depends on language, but UTF-8 is common).
            /// Trailing null bytes should be trimmed.
            /// </summary>
            public string StringData { get { return _stringData; } }
            public Gam M_Root { get { return m_root; } }
            public Gam.LocalizedStringData M_Parent { get { return m_parent; } }
        }
        public partial class StructArray : KaitaiStruct
        {
            public static StructArray FromFile(string fileName)
            {
                return new StructArray(new KaitaiStream(fileName));
            }

            public StructArray(KaitaiStream p__io, KaitaiStruct p__parent = null, Gam p__root = null) : base(p__io)
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
            private Gam m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Array of struct entries
            /// </summary>
            public List<StructEntry> Entries { get { return _entries; } }
            public Gam M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class StructEntry : KaitaiStruct
        {
            public static StructEntry FromFile(string fileName)
            {
                return new StructEntry(new KaitaiStream(fileName));
            }

            public StructEntry(KaitaiStream p__io, Gam.StructArray p__parent = null, Gam p__root = null) : base(p__io)
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
            private Gam m_root;
            private Gam.StructArray m_parent;

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
            public Gam M_Root { get { return m_root; } }
            public Gam.StructArray M_Parent { get { return m_parent; } }
        }
        private GffHeader _gffHeader;
        private Gam m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// GFF file header (56 bytes).
        /// Contains offsets to other sections (label_array, struct_array, field_array, etc.).
        /// Note: Other sections are at absolute file offsets specified in the header.
        /// Due to Kaitai Struct limitations with absolute positioning in seq, these sections
        /// should be accessed via instances or manual seeking in application code.
        /// </summary>
        public GffHeader GffHeader { get { return _gffHeader; } }
        public Gam M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
