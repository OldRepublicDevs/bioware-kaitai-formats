// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// JRL (Journal) files are GFF-based format files that store journal/quest data including
    /// quest entries, priorities, and planet associations. JRL files use the GFF (Generic File Format)
    /// binary structure with file type signature &quot;JRL &quot;.
    /// 
    /// JRL files are used by BioWare games (KotOR, KotOR 2, Neverwinter Nights) to define quest
    /// journal entries. The journal system tracks player progress through quests, displaying
    /// appropriate text entries based on quest state.
    /// 
    /// File Structure:
    /// JRL files follow the standard GFF binary format with the following logical structure:
    /// - Root struct contains a &quot;Categories&quot; field (List type) containing quest definitions
    /// - Each quest category (JRLQuest) is a struct in the Categories list with fields:
    ///   - Name (CExoLocString): Quest title displayed in journal
    ///   - PlanetID (Int32): Planet association (legacy field, typically unused)
    ///   - PlotIndex (Int32): Legacy plot index for sorting
    ///   - Priority (UInt32): Sorting priority (0=Highest, 4=Lowest)
    ///   - Tag (CExoString): Unique quest identifier (used by scripts/dialogue)
    ///   - Comment (CExoString): Developer comment (toolset only, not shown in game)
    ///   - EntryList (List): Array of quest entry structs (journal states)
    /// - Each quest entry (JRLQuestEntry) is a struct in EntryList with fields:
    ///   - ID (UInt32): State identifier (referenced by AddJournalQuestEntry script function)
    ///   - Text (CExoLocString): Journal text displayed for this quest state
    ///   - End (UInt16): 1 if this state completes the quest (moves to Completed tab), 0 otherwise
    ///   - XP_Percentage (Single): XP reward multiplier (scales journal.2da XP value)
    /// 
    /// Priority Levels:
    /// - 0 (Highest): Main quest line (always shown at top)
    /// - 1 (High): Important side quests
    /// - 2 (Medium): Standard side quests
    /// - 3 (Low): Minor tasks
    /// - 4 (Lowest): Completed/Archived quests (moved to Completed tab)
    /// 
    /// Usage:
    /// - Scripts use AddJournalQuestEntry(&quot;Tag&quot;, ID) to update quest states
    /// - Dialogues use Quest and QuestEntry fields to trigger journal updates
    /// - Only the highest ID reached is typically displayed (unless AllowOverrideHigher is set)
    /// - End=1 moves the quest to the &quot;Completed&quot; tab
    /// - global.jrl is the master journal file for the entire game
    /// 
    /// References:
    /// - vendor/PyKotor/wiki/GFF-JRL.md
    /// - vendor/PyKotor/wiki/GFF-File-Format.md
    /// - vendor/PyKotor/Libraries/PyKotor/src/pykotor/resource/generics/jrl.py
    /// - vendor/reone/src/libs/resource/parser/gff/jrl.cpp
    /// - vendor/xoreos/src/aurora/jrlfile.cpp
    /// </summary>
    public partial class Jrl : KaitaiStruct
    {
        public static Jrl FromFile(string fileName)
        {
            return new Jrl(new KaitaiStream(fileName));
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
        public Jrl(KaitaiStream p__io, KaitaiStruct p__parent = null, Jrl p__root = null) : base(p__io)
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

            public FieldArray(KaitaiStream p__io, Jrl p__parent = null, Jrl p__root = null) : base(p__io)
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
            private Jrl m_root;
            private Jrl m_parent;

            /// <summary>
            /// Array of field entries
            /// </summary>
            public List<FieldEntry> Entries { get { return _entries; } }
            public Jrl M_Root { get { return m_root; } }
            public Jrl M_Parent { get { return m_parent; } }
        }
        public partial class FieldDataSection : KaitaiStruct
        {
            public static FieldDataSection FromFile(string fileName)
            {
                return new FieldDataSection(new KaitaiStream(fileName));
            }

            public FieldDataSection(KaitaiStream p__io, Jrl p__parent = null, Jrl p__root = null) : base(p__io)
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
            private Jrl m_root;
            private Jrl m_parent;

            /// <summary>
            /// Raw field data bytes for complex types
            /// </summary>
            public string Data { get { return _data; } }
            public Jrl M_Root { get { return m_root; } }
            public Jrl M_Parent { get { return m_parent; } }
        }
        public partial class FieldEntry : KaitaiStruct
        {
            public static FieldEntry FromFile(string fileName)
            {
                return new FieldEntry(new KaitaiStream(fileName));
            }

            public FieldEntry(KaitaiStream p__io, Jrl.FieldArray p__parent = null, Jrl p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fieldType = ((Jrl.GffFieldType) m_io.ReadU4le());
                _labelIndex = m_io.ReadU4le();
                _dataOrOffset = m_io.ReadU4le();
            }
            private GffFieldType _fieldType;
            private uint _labelIndex;
            private uint _dataOrOffset;
            private Jrl m_root;
            private Jrl.FieldArray m_parent;

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
            public Jrl M_Root { get { return m_root; } }
            public Jrl.FieldArray M_Parent { get { return m_parent; } }
        }
        public partial class FieldIndicesArray : KaitaiStruct
        {
            public static FieldIndicesArray FromFile(string fileName)
            {
                return new FieldIndicesArray(new KaitaiStream(fileName));
            }

            public FieldIndicesArray(KaitaiStream p__io, Jrl p__parent = null, Jrl p__root = null) : base(p__io)
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
            private Jrl m_root;
            private Jrl m_parent;

            /// <summary>
            /// Array of field indices (uint32 values) for structs with multiple fields
            /// </summary>
            public List<uint> Indices { get { return _indices; } }
            public Jrl M_Root { get { return m_root; } }
            public Jrl M_Parent { get { return m_parent; } }
        }
        public partial class GffHeader : KaitaiStruct
        {
            public static GffHeader FromFile(string fileName)
            {
                return new GffHeader(new KaitaiStream(fileName));
            }

            public GffHeader(KaitaiStream p__io, Jrl p__parent = null, Jrl p__root = null) : base(p__io)
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
            private Jrl m_root;
            private Jrl m_parent;

            /// <summary>
            /// File type signature. Must be &quot;JRL &quot; for journal files.
            /// Other GFF types: &quot;GFF &quot;, &quot;ARE &quot;, &quot;UTC &quot;, &quot;UTI &quot;, &quot;DLG &quot;, etc.
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
            /// Number of field indices (uint32 values) in the field_indices array
            /// </summary>
            public uint FieldIndicesCount { get { return _fieldIndicesCount; } }

            /// <summary>
            /// Byte offset to list indices array from the beginning of the file
            /// </summary>
            public uint ListIndicesOffset { get { return _listIndicesOffset; } }

            /// <summary>
            /// Number of list indices (uint32 values) in the list_indices array
            /// </summary>
            public uint ListIndicesCount { get { return _listIndicesCount; } }
            public Jrl M_Root { get { return m_root; } }
            public Jrl M_Parent { get { return m_parent; } }
        }
        public partial class LabelArray : KaitaiStruct
        {
            public static LabelArray FromFile(string fileName)
            {
                return new LabelArray(new KaitaiStream(fileName));
            }

            public LabelArray(KaitaiStream p__io, Jrl p__parent = null, Jrl p__root = null) : base(p__io)
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
            private Jrl m_root;
            private Jrl m_parent;

            /// <summary>
            /// Array of 16-byte null-terminated field name labels
            /// </summary>
            public List<string> Labels { get { return _labels; } }
            public Jrl M_Root { get { return m_root; } }
            public Jrl M_Parent { get { return m_parent; } }
        }
        public partial class ListIndicesArray : KaitaiStruct
        {
            public static ListIndicesArray FromFile(string fileName)
            {
                return new ListIndicesArray(new KaitaiStream(fileName));
            }

            public ListIndicesArray(KaitaiStream p__io, Jrl p__parent = null, Jrl p__root = null) : base(p__io)
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
            private Jrl m_root;
            private Jrl m_parent;

            /// <summary>
            /// Array of list indices (uint32 values) for LIST type fields
            /// </summary>
            public List<uint> Indices { get { return _indices; } }
            public Jrl M_Root { get { return m_root; } }
            public Jrl M_Parent { get { return m_parent; } }
        }
        public partial class StructArray : KaitaiStruct
        {
            public static StructArray FromFile(string fileName)
            {
                return new StructArray(new KaitaiStream(fileName));
            }

            public StructArray(KaitaiStream p__io, Jrl p__parent = null, Jrl p__root = null) : base(p__io)
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
            private Jrl m_root;
            private Jrl m_parent;

            /// <summary>
            /// Array of struct entries
            /// </summary>
            public List<StructEntry> Entries { get { return _entries; } }
            public Jrl M_Root { get { return m_root; } }
            public Jrl M_Parent { get { return m_parent; } }
        }
        public partial class StructEntry : KaitaiStruct
        {
            public static StructEntry FromFile(string fileName)
            {
                return new StructEntry(new KaitaiStream(fileName));
            }

            public StructEntry(KaitaiStream p__io, Jrl.StructArray p__parent = null, Jrl p__root = null) : base(p__io)
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
            private Jrl m_root;
            private Jrl.StructArray m_parent;

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
            public Jrl M_Root { get { return m_root; } }
            public Jrl.StructArray M_Parent { get { return m_parent; } }
        }
        private GffHeader _gffHeader;
        private LabelArray _labelArray;
        private StructArray _structArray;
        private FieldArray _fieldArray;
        private FieldDataSection _fieldData;
        private FieldIndicesArray _fieldIndices;
        private ListIndicesArray _listIndices;
        private Jrl m_root;
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
        /// Field indices array (MultiMap) for structs with multiple fields)
        /// </summary>
        public FieldIndicesArray FieldIndices { get { return _fieldIndices; } }

        /// <summary>
        /// List indices array for LIST type fields
        /// </summary>
        public ListIndicesArray ListIndices { get { return _listIndices; } }
        public Jrl M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
