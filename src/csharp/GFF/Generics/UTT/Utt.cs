// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// UTT (User Template Trigger) files are GFF-based format files that define trigger blueprints.
    /// UTT files use the GFF (Generic File Format) binary structure with file type signature &quot;UTT &quot;.
    /// 
    /// Triggers are invisible objects in the game world that detect when creatures enter or exit their area
    /// and execute scripts. UTT files define the template/blueprint for triggers, which are then instantiated
    /// in areas (GIT files) with specific positions and orientations.
    /// 
    /// UTT files contain:
    /// - Root struct with trigger metadata:
    ///   - ResRef: Trigger template ResRef (unique identifier, max 16 characters, ResRef type)
    ///   - LocName: Localized trigger name (LocalizedString/CExoLocString type)
    ///   - Tag: Trigger tag identifier (String/CExoString type, used for scripting references)
    ///   - Comment: Developer comment string (String/CExoString type, not used by game engine)
    ///   - Type: Trigger type identifier (UInt32/DWord type)
    ///     - 0 = Unknown/Generic trigger
    ///     - 1 = Trap trigger
    ///     - 2 = Proximity trigger
    ///     - 3 = Clickable trigger
    ///     - 4 = Script trigger
    ///     - Other values: Custom trigger types
    ///   - TrapDetectable: Whether trap is detectable (UInt8/Byte type, 0 = not detectable, 1 = detectable)
    ///   - TrapDetectDC: Trap detection difficulty class (UInt8/Byte type, 0-255)
    ///   - DisarmDC: Disarm difficulty class (UInt8/Byte type, 0-255)
    ///   - DetectTrap: Whether trigger detects traps (UInt8/Byte type, 0 = no, 1 = yes)
    ///   - Faction: Faction identifier (UInt32/DWord type, references faction.2da)
    ///   - Cursor: Cursor type when hovering over trigger (UInt32/DWord type, references cursors.2da)
    ///   - HighlightHeight: Height of highlight box (Single/Float32 type, in game units)
    ///   - KeyName: Key required to unlock trigger (ResRef type, max 16 characters, references key item UTI)
    ///   - TriggerOnClick: Whether trigger activates on click (UInt8/Byte type, 0 = no, 1 = yes)
    ///   - Disarmable: Whether trigger can be disarmed (UInt8/Byte type, 0 = no, 1 = yes)
    ///   - Detectable: Whether trigger is detectable (UInt8/Byte type, 0 = no, 1 = yes)
    ///   - IsTrap: Whether trigger is a trap (UInt8/Byte type, 0 = no, 1 = yes)
    ///   - TrapType: Type of trap if IsTrap is true (UInt32/DWord type)
    ///   - ScriptOnEnter: Script ResRef executed when creature enters trigger area (ResRef type, max 16 characters)
    ///   - ScriptOnExit: Script ResRef executed when creature exits trigger area (ResRef type, max 16 characters)
    ///   - ScriptOnHeartbeat: Script ResRef executed periodically while creature is in trigger area (ResRef type, max 16 characters)
    ///   - ScriptOnUserDefined: Script ResRef executed for user-defined events (ResRef type, max 16 characters)
    ///   - ScriptOnDisarm: Script ResRef executed when trap is disarmed (ResRef type, max 16 characters)
    ///   - ScriptOnTrapTriggered: Script ResRef executed when trap is triggered (ResRef type, max 16 characters)
    ///   - LinkedTo: ResRef of object this trigger is linked to (ResRef type, max 16 characters, typically door or placeable)
    ///   - LinkedToFlags: Flags for linked object behavior (UInt32/DWord type)
    ///   - TransitionDestin: Destination area ResRef for transition triggers (ResRef type, max 16 characters)
    ///   - TransitionDestinTag: Destination object tag for transition triggers (String/CExoString type)
    ///   - LinkedToModule: Module ResRef for transition triggers (ResRef type, max 16 characters, references IFO file)
    ///   - LinkedToWaypoint: Waypoint tag for transition triggers (String/CExoString type)
    ///   - LinkedToStrRef: String reference for transition description (UInt32/DWord type, references dialog.tlk)
    ///   - LinkedToTransition: Transition type (UInt32/DWord type)
    ///   - LinkedToTransitionStrRef: String reference for transition text (UInt32/DWord type, references dialog.tlk)
    ///   - LoadScreenID: Loading screen ID for transitions (UInt32/DWord type, references loadscreens.2da)
    ///   - LoadScreenResRef: Loading screen ResRef for transitions (ResRef type, max 16 characters)
    ///   - LoadScreenTransition: Transition effect type (UInt32/DWord type)
    ///   - LoadScreenFade: Fade effect type (UInt32/DWord type)
    ///   - LoadScreenFadeSpeed: Fade speed (Single/Float32 type)
    ///   - LoadScreenFadeColor: Fade color (Vector3 type, RGB values 0.0-1.0)
    ///   - LoadScreenFadeDelay: Fade delay in seconds (Single/Float32 type)
    ///   - LoadScreenMusic: Music ResRef for transitions (ResRef type, max 16 characters)
    ///   - LoadScreenAmbient: Ambient sound ResRef for transitions (ResRef type, max 16 characters)
    ///   - LoadScreenSound: Sound effect ResRef for transitions (ResRef type, max 16 characters)
    ///   - LoadScreenVoice: Voice ResRef for transitions (ResRef type, max 16 characters)
    ///   - LoadScreenMovie: Movie ResRef for transitions (ResRef type, max 16 characters)
    ///   - LoadScreenCamera: Camera animation ResRef for transitions (ResRef type, max 16 characters)
    ///   - LoadScreenCameraEffect: Camera effect type (UInt32/DWord type)
    ///   - LoadScreenCameraFov: Camera field of view (Single/Float32 type)
    ///   - LoadScreenCameraHeight: Camera height (Single/Float32 type)
    ///   - LoadScreenCameraAngle: Camera angle (UInt32/DWord type)
    ///   - LoadScreenCameraAnim: Camera animation ID (UInt32/DWord type)
    ///   - LoadScreenCameraId: Camera ID (UInt32/DWord type)
    ///   - LoadScreenCameraDelay: Camera delay in seconds (Single/Float32 type)
    ///   - LoadScreenCameraSpeed: Camera speed (Single/Float32 type)
    ///   - LoadScreenCameraShake: Camera shake intensity (Single/Float32 type)
    ///   - LoadScreenCameraShakeDuration: Camera shake duration in seconds (Single/Float32 type)
    ///   - LoadScreenCameraShakeFrequency: Camera shake frequency (Single/Float32 type)
    ///   - LoadScreenCameraShakeAmplitude: Camera shake amplitude (Single/Float32 type)
    ///   - LoadScreenCameraShakeDirection: Camera shake direction (Vector3 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomDelay: Random camera shake random delay in seconds (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomSpeed: Random camera shake random speed (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShake: Random camera shake random shake intensity (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeDuration: Random camera shake random shake duration in seconds (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeFrequency: Random camera shake random shake frequency (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeAmplitude: Random camera shake random shake amplitude (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeDirection: Random camera shake random shake direction (Vector3 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandom: Random camera shake random shake random flag (UInt8/Byte type, 0 = no, 1 = yes)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomAmount: Random camera shake random shake random amount (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomFrequency: Random camera shake random shake random frequency (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomAmplitude: Random camera shake random shake random amplitude (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomDirection: Random camera shake random shake random direction (Vector3 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomDuration: Random camera shake random shake random duration in seconds (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomSpeed: Random camera shake random shake random speed (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomDelay: Random camera shake random shake random delay in seconds (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomId: Random camera shake random shake random ID (UInt32/DWord type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomEffect: Random camera shake random shake random effect (UInt32/DWord type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomFov: Random camera shake random shake random field of view (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomHeight: Random camera shake random shake random height (Single/Float32 type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomAngle: Random camera shake random shake random angle (UInt32/DWord type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomAnim: Random camera shake random shake random animation ID (UInt32/DWord type)
    ///   - LoadScreenCameraShakeRandomShakeRandomShakeRandomCameraId: Random camera shake random shake random camera ID (UInt32/DWord type)
    /// 
    /// References:
    /// - vendor/PyKotor/wiki/GFF-UTT.md
    /// - vendor/PyKotor/wiki/Bioware-Aurora-Trigger-Format.md
    /// - vendor/PyKotor/wiki/GFF-File-Format.md
    /// - vendor/reone/src/libs/resource/parser/gff/utt.cpp
    /// - vendor/PyKotor/Libraries/PyKotor/src/pykotor/resource/generics/utt.py
    /// </summary>
    public partial class Utt : KaitaiStruct
    {
        public static Utt FromFile(string fileName)
        {
            return new Utt(new KaitaiStream(fileName));
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
        public Utt(KaitaiStream p__io, KaitaiStruct p__parent = null, Utt p__root = null) : base(p__io)
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

            public FieldArray(KaitaiStream p__io, Utt p__parent = null, Utt p__root = null) : base(p__io)
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
            private Utt m_root;
            private Utt m_parent;

            /// <summary>
            /// Array of field entries (12 bytes each)
            /// </summary>
            public List<FieldEntry> Entries { get { return _entries; } }
            public Utt M_Root { get { return m_root; } }
            public Utt M_Parent { get { return m_parent; } }
        }
        public partial class FieldDataSection : KaitaiStruct
        {
            public static FieldDataSection FromFile(string fileName)
            {
                return new FieldDataSection(new KaitaiStream(fileName));
            }

            public FieldDataSection(KaitaiStream p__io, Utt p__parent = null, Utt p__root = null) : base(p__io)
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
            private Utt m_root;
            private Utt m_parent;

            /// <summary>
            /// Raw field data bytes for complex types. Individual field data entries are accessed via
            /// field_entry.field_data_offset_value offsets. The structure of each entry depends on the field_type:
            /// - UInt64/Int64/Double: 8 bytes (stored in field_data section)
            /// - String (CExoString): 4-byte length (u4) + string bytes (ASCII, null-terminated)
            /// - ResRef: 1-byte length (u1, max 16) + string bytes (ASCII, null-padded to 16 bytes total)
            /// - LocalizedString (CExoLocString): variable (see localized_string_data type)
            /// - Binary (Void): 4-byte length (u4) + binary bytes
            /// - Vector3: 12 bytes (3×f4, little-endian: X, Y, Z)
            /// - Vector4: 16 bytes (4×f4, little-endian: W, X, Y, Z)
            /// </summary>
            public string Data { get { return _data; } }
            public Utt M_Root { get { return m_root; } }
            public Utt M_Parent { get { return m_parent; } }
        }
        public partial class FieldEntry : KaitaiStruct
        {
            public static FieldEntry FromFile(string fileName)
            {
                return new FieldEntry(new KaitaiStream(fileName));
            }

            public FieldEntry(KaitaiStream p__io, Utt.FieldArray p__parent = null, Utt p__root = null) : base(p__io)
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
                _fieldType = m_io.ReadU4le();
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
                        _fieldDataOffsetValue = (int) (M_Root.GffHeader.FieldDataOffset + DataOrOffset);
                    }
                    return _fieldDataOffsetValue;
                }
            }
            private bool f_isComplexType;
            private bool _isComplexType;

            /// <summary>
            /// True if field stores data in field_data section (complex types: UInt64, Int64, Double, String, ResRef, LocalizedString, Binary, Vector3, Vector4)
            /// </summary>
            public bool IsComplexType
            {
                get
                {
                    if (f_isComplexType)
                        return _isComplexType;
                    f_isComplexType = true;
                    _isComplexType = (bool) ( (( ((FieldType >= 6) && (FieldType <= 13)) ) || ( ((FieldType >= 16) && (FieldType <= 17)) )) );
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
                    _isListType = (bool) (FieldType == 15);
                    return _isListType;
                }
            }
            private bool f_isSimpleType;
            private bool _isSimpleType;

            /// <summary>
            /// True if field stores data inline (simple types: Byte, Char, UInt16, Int16, UInt32, Int32, Float)
            /// </summary>
            public bool IsSimpleType
            {
                get
                {
                    if (f_isSimpleType)
                        return _isSimpleType;
                    f_isSimpleType = true;
                    _isSimpleType = (bool) ( (( ((FieldType >= 0) && (FieldType <= 5)) ) || (FieldType == 8)) );
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
                    _isStructType = (bool) (FieldType == 14);
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
                        _listIndicesOffsetValue = (int) (M_Root.GffHeader.ListIndicesOffset + DataOrOffset);
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
            private uint _fieldType;
            private uint _labelIndex;
            private uint _dataOrOffset;
            private Utt m_root;
            private Utt.FieldArray m_parent;

            /// <summary>
            /// Field data type (see gff_field_type enum):
            /// 0 = Byte (UInt8) - Used for: TrapDetectable, TrapDetectDC, DisarmDC, DetectTrap,
            ///     TriggerOnClick, Disarmable, Detectable, IsTrap, LoadScreenCameraShakeRandom, etc.
            /// 1 = Char (Int8)
            /// 2 = UInt16
            /// 3 = Int16
            /// 4 = UInt32 - Used for: Type, Faction, Cursor, TrapType, LinkedToFlags,
            ///     LinkedToTransition, LoadScreenID, LoadScreenTransition, LoadScreenFade,
            ///     LoadScreenCameraEffect, LoadScreenCameraAngle, LoadScreenCameraAnim,
            ///     LoadScreenCameraId, LinkedToStrRef, LinkedToTransitionStrRef, etc.
            /// 5 = Int32
            /// 6 = UInt64
            /// 7 = Int64
            /// 8 = Single (Float32) - Used for: HighlightHeight, LoadScreenFadeSpeed,
            ///     LoadScreenFadeDelay, LoadScreenCameraFov, LoadScreenCameraHeight,
            ///     LoadScreenCameraDelay, LoadScreenCameraSpeed, LoadScreenCameraShake, etc.
            /// 9 = Double (Float64)
            /// 10 = CExoString (String) - Used for: Tag, Comment, TransitionDestinTag,
            ///      LinkedToWaypoint
            /// 11 = ResRef - Used for: ResRef, KeyName, ScriptOnEnter, ScriptOnExit,
            ///      ScriptOnHeartbeat, ScriptOnUserDefined, ScriptOnDisarm, ScriptOnTrapTriggered,
            ///      LinkedTo, TransitionDestin, LinkedToModule, LoadScreenResRef,
            ///      LoadScreenMusic, LoadScreenAmbient, LoadScreenSound, LoadScreenVoice,
            ///      LoadScreenMovie, LoadScreenCamera, etc.
            /// 12 = CExoLocString (LocalizedString) - Used for: LocName
            /// 13 = Void (Binary)
            /// 14 = Struct
            /// 15 = List
            /// 16 = Vector4
            /// 17 = Vector3 - Used for: LoadScreenFadeColor, LoadScreenCameraShakeDirection, etc.
            /// </summary>
            public uint FieldType { get { return _fieldType; } }

            /// <summary>
            /// Index into label_array for field name.
            /// The label_array[label_index].name_trimmed gives the field name.
            /// </summary>
            public uint LabelIndex { get { return _labelIndex; } }

            /// <summary>
            /// For simple types (Byte, Char, UInt16, Int16, UInt32, Int32, UInt64, Int64, Single, Double):
            ///   Inline data value (stored directly in this field)
            /// For complex types (String, ResRef, LocalizedString, Binary, Vector3, Vector4):
            ///   Byte offset into field_data section (relative to field_data_offset)
            /// For Struct type:
            ///   Struct index into struct_array
            /// For List type:
            ///   Byte offset into list_indices array (relative to list_indices_offset)
            /// </summary>
            public uint DataOrOffset { get { return _dataOrOffset; } }
            public Utt M_Root { get { return m_root; } }
            public Utt.FieldArray M_Parent { get { return m_parent; } }
        }
        public partial class FieldIndicesArray : KaitaiStruct
        {
            public static FieldIndicesArray FromFile(string fileName)
            {
                return new FieldIndicesArray(new KaitaiStream(fileName));
            }

            public FieldIndicesArray(KaitaiStream p__io, Utt p__parent = null, Utt p__root = null) : base(p__io)
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
            private Utt m_root;
            private Utt m_parent;

            /// <summary>
            /// Array of field indices. When a struct has multiple fields, it stores an offset
            /// into this array, and the next N consecutive u4 values (where N = struct.field_count)
            /// are the field indices for that struct.
            /// Example: Root struct with 50+ fields stores offset to this array, then 50+ consecutive
            /// u4 values here are the field indices for ResRef, LocName, Tag, Type, etc.
            /// </summary>
            public List<uint> Indices { get { return _indices; } }
            public Utt M_Root { get { return m_root; } }
            public Utt M_Parent { get { return m_parent; } }
        }
        public partial class GffHeader : KaitaiStruct
        {
            public static GffHeader FromFile(string fileName)
            {
                return new GffHeader(new KaitaiStream(fileName));
            }

            public GffHeader(KaitaiStream p__io, Utt p__parent = null, Utt p__root = null) : base(p__io)
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
            private Utt m_root;
            private Utt m_parent;

            /// <summary>
            /// File type signature. Must be &quot;UTT &quot; for trigger template files.
            /// Other GFF types: &quot;GFF &quot;, &quot;DLG &quot;, &quot;ARE &quot;, &quot;UTC &quot;, &quot;UTI &quot;, &quot;UTD &quot;, &quot;UTM &quot;, &quot;UTW &quot;, &quot;GIT &quot;, etc.
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
            public Utt M_Root { get { return m_root; } }
            public Utt M_Parent { get { return m_parent; } }
        }
        public partial class LabelArray : KaitaiStruct
        {
            public static LabelArray FromFile(string fileName)
            {
                return new LabelArray(new KaitaiStream(fileName));
            }

            public LabelArray(KaitaiStream p__io, Utt p__parent = null, Utt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _labels = new List<LabelEntry>();
                for (var i = 0; i < M_Root.GffHeader.LabelCount; i++)
                {
                    _labels.Add(new LabelEntry(m_io, this, m_root));
                }
            }
            private List<LabelEntry> _labels;
            private Utt m_root;
            private Utt m_parent;

            /// <summary>
            /// Array of label entries (16 bytes each)
            /// </summary>
            public List<LabelEntry> Labels { get { return _labels; } }
            public Utt M_Root { get { return m_root; } }
            public Utt M_Parent { get { return m_parent; } }
        }
        public partial class LabelEntry : KaitaiStruct
        {
            public static LabelEntry FromFile(string fileName)
            {
                return new LabelEntry(new KaitaiStream(fileName));
            }

            public LabelEntry(KaitaiStream p__io, Utt.LabelArray p__parent = null, Utt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_nameTrimmed = false;
                _read();
            }
            private void _read()
            {
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(16));
            }
            private bool f_nameTrimmed;
            private string _nameTrimmed;

            /// <summary>
            /// Label name (trailing nulls should be trimmed by parser)
            /// </summary>
            public string NameTrimmed
            {
                get
                {
                    if (f_nameTrimmed)
                        return _nameTrimmed;
                    f_nameTrimmed = true;
                    _nameTrimmed = (string) (Name);
                    return _nameTrimmed;
                }
            }
            private string _name;
            private Utt m_root;
            private Utt.LabelArray m_parent;

            /// <summary>
            /// Field name label (null-padded to 16 bytes, null-terminated).
            /// The actual label length is determined by the first null byte.
            /// Common UTT field names: &quot;ResRef&quot;, &quot;LocName&quot;, &quot;Tag&quot;, &quot;Comment&quot;, &quot;Type&quot;,
            /// &quot;TrapDetectable&quot;, &quot;TrapDetectDC&quot;, &quot;DisarmDC&quot;, &quot;DetectTrap&quot;, &quot;Faction&quot;,
            /// &quot;Cursor&quot;, &quot;HighlightHeight&quot;, &quot;KeyName&quot;, &quot;TriggerOnClick&quot;, &quot;Disarmable&quot;,
            /// &quot;Detectable&quot;, &quot;IsTrap&quot;, &quot;TrapType&quot;, &quot;ScriptOnEnter&quot;, &quot;ScriptOnExit&quot;,
            /// &quot;ScriptOnHeartbeat&quot;, &quot;ScriptOnUserDefined&quot;, &quot;ScriptOnDisarm&quot;, &quot;ScriptOnTrapTriggered&quot;,
            /// &quot;LinkedTo&quot;, &quot;LinkedToFlags&quot;, &quot;TransitionDestin&quot;, &quot;TransitionDestinTag&quot;,
            /// &quot;LinkedToModule&quot;, &quot;LinkedToWaypoint&quot;, &quot;LinkedToStrRef&quot;, &quot;LinkedToTransition&quot;,
            /// &quot;LinkedToTransitionStrRef&quot;, &quot;LoadScreenID&quot;, &quot;LoadScreenResRef&quot;, etc.
            /// </summary>
            public string Name { get { return _name; } }
            public Utt M_Root { get { return m_root; } }
            public Utt.LabelArray M_Parent { get { return m_parent; } }
        }
        public partial class ListIndicesArray : KaitaiStruct
        {
            public static ListIndicesArray FromFile(string fileName)
            {
                return new ListIndicesArray(new KaitaiStream(fileName));
            }

            public ListIndicesArray(KaitaiStream p__io, Utt p__parent = null, Utt p__root = null) : base(p__io)
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
            private Utt m_root;
            private Utt m_parent;

            /// <summary>
            /// Raw list indices data. List entries are accessed via offsets stored in
            /// list-type field entries. Each entry starts with a count (u4), followed
            /// by that many struct indices (u4 each).
            /// Note: UTT files typically do not use LIST fields, but the structure is defined
            /// for completeness and potential future use.
            /// </summary>
            public string RawData { get { return _rawData; } }
            public Utt M_Root { get { return m_root; } }
            public Utt M_Parent { get { return m_parent; } }
        }
        public partial class LocalizedStringData : KaitaiStruct
        {
            public static LocalizedStringData FromFile(string fileName)
            {
                return new LocalizedStringData(new KaitaiStream(fileName));
            }

            public LocalizedStringData(KaitaiStream p__io, KaitaiStruct p__parent = null, Utt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_stringRefValue = false;
                _read();
            }
            private void _read()
            {
                _totalSize = m_io.ReadU4le();
                _stringRef = m_io.ReadU4le();
                _numSubstrings = m_io.ReadU4le();
                _substrings = new List<LocalizedSubstring>();
                for (var i = 0; i < NumSubstrings; i++)
                {
                    _substrings.Add(new LocalizedSubstring(m_io, this, m_root));
                }
            }
            private bool f_stringRefValue;
            private int _stringRefValue;

            /// <summary>
            /// String reference as signed integer (-1 if none)
            /// </summary>
            public int StringRefValue
            {
                get
                {
                    if (f_stringRefValue)
                        return _stringRefValue;
                    f_stringRefValue = true;
                    _stringRefValue = (int) ((StringRef == 4294967295 ? -1 : StringRef));
                    return _stringRefValue;
                }
            }
            private uint _totalSize;
            private uint _stringRef;
            private uint _numSubstrings;
            private List<LocalizedSubstring> _substrings;
            private Utt m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Total size of this LocalizedString structure in bytes (not including this count).
            /// Used for skipping over the structure, but can be calculated from the data.
            /// Format: total_size = 4 (string_ref) + 4 (num_substrings) + sum(substring sizes)
            /// Each substring: 4 (string_id) + 4 (string_length) + string_length (string_data)
            /// </summary>
            public uint TotalSize { get { return _totalSize; } }

            /// <summary>
            /// String reference ID (StrRef) into dialog.tlk file.
            /// Value 0xFFFFFFFF indicates no string reference (-1).
            /// If string_ref is valid (not -1), this is the primary string shown to the user.
            /// Language-specific substrings override this for specific languages/genders.
            /// For UTT, LocName uses this to reference dialog.tlk entries for trigger names.
            /// </summary>
            public uint StringRef { get { return _stringRef; } }

            /// <summary>
            /// Number of language-specific string substrings.
            /// Typically 0 if only using string_ref, or 1-10+ for multi-language support.
            /// </summary>
            public uint NumSubstrings { get { return _numSubstrings; } }

            /// <summary>
            /// Array of language-specific string substrings.
            /// Each substring provides text for a specific language and gender combination.
            /// Used to override or supplement the string_ref text.
            /// </summary>
            public List<LocalizedSubstring> Substrings { get { return _substrings; } }
            public Utt M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class LocalizedSubstring : KaitaiStruct
        {
            public static LocalizedSubstring FromFile(string fileName)
            {
                return new LocalizedSubstring(new KaitaiStream(fileName));
            }

            public LocalizedSubstring(KaitaiStream p__io, Utt.LocalizedStringData p__parent = null, Utt p__root = null) : base(p__io)
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
            /// Gender ID (extracted from string_id, bits 0-7: 0 = Male, 1 = Female)
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
            /// Language ID (extracted from string_id, bits 8-15)
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
            private Utt m_root;
            private Utt.LocalizedStringData m_parent;

            /// <summary>
            /// String ID encoding language and gender:
            /// - Bits 0-7: Gender (0 = Male, 1 = Female)
            /// - Bits 8-15: Language ID (see Language enum)
            /// - Bits 16-31: Reserved/unused
            /// Common languages: 0 = English, 1 = French, 2 = German, 3 = Italian, 4 = Spanish,
            /// 5 = Polish, 6 = Korean, 7 = Chinese (Traditional), 8 = Chinese (Simplified), 9 = Japanese
            /// </summary>
            public uint StringId { get { return _stringId; } }

            /// <summary>
            /// Length of string data in bytes (UTF-8 encoded)
            /// </summary>
            public uint StringLength { get { return _stringLength; } }

            /// <summary>
            /// String data (encoding depends on language, but UTF-8 is common).
            /// Trailing null bytes should be trimmed.
            /// For UTT LocName, this contains the trigger name in the specified language/gender.
            /// </summary>
            public string StringData { get { return _stringData; } }
            public Utt M_Root { get { return m_root; } }
            public Utt.LocalizedStringData M_Parent { get { return m_parent; } }
        }
        public partial class ResrefData : KaitaiStruct
        {
            public static ResrefData FromFile(string fileName)
            {
                return new ResrefData(new KaitaiStream(fileName));
            }

            public ResrefData(KaitaiStream p__io, KaitaiStruct p__parent = null, Utt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _length = m_io.ReadU1();
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(16));
            }
            private byte _length;
            private string _name;
            private Utt m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Length of ResRef string (0-16). ResRef strings are limited to 16 characters.
            /// Common UTT ResRefs: trigger template names, script names (NSS/NCS files),
            /// area ResRefs (ARE files), module ResRefs (IFO files), waypoint tags,
            /// key item ResRefs (UTI files), etc.
            /// </summary>
            public byte Length { get { return _length; } }

            /// <summary>
            /// ResRef string (null-padded to 16 bytes).
            /// The actual string length is given by the length field above.
            /// Trailing null bytes should be ignored. To extract the actual ResRef name,
            /// take the first 'length' characters from 'name' (trim trailing nulls).
            /// Note: This is a documentation type - actual parsing accesses field_data via offsets.
            /// </summary>
            public string Name { get { return _name; } }
            public Utt M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class StringData : KaitaiStruct
        {
            public static StringData FromFile(string fileName)
            {
                return new StringData(new KaitaiStream(fileName));
            }

            public StringData(KaitaiStream p__io, KaitaiStruct p__parent = null, Utt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_dataTrimmed = false;
                _read();
            }
            private void _read()
            {
                _length = m_io.ReadU4le();
                _data = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(Length));
            }
            private bool f_dataTrimmed;
            private string _dataTrimmed;

            /// <summary>
            /// String data (trailing nulls should be trimmed by parser)
            /// </summary>
            public string DataTrimmed
            {
                get
                {
                    if (f_dataTrimmed)
                        return _dataTrimmed;
                    f_dataTrimmed = true;
                    _dataTrimmed = (string) (Data);
                    return _dataTrimmed;
                }
            }
            private uint _length;
            private string _data;
            private Utt m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Length of string data in bytes (not including null terminator)
            /// </summary>
            public uint Length { get { return _length; } }

            /// <summary>
            /// String data (ASCII encoded, null-terminated).
            /// Trailing null bytes should be trimmed.
            /// Common UTT strings: Tag (trigger tag for scripting), Comment (developer notes),
            /// TransitionDestinTag (destination object tag), LinkedToWaypoint (waypoint tag).
            /// Note: To extract the actual string value, trim trailing null bytes from 'data'.
            /// </summary>
            public string Data { get { return _data; } }
            public Utt M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class StructArray : KaitaiStruct
        {
            public static StructArray FromFile(string fileName)
            {
                return new StructArray(new KaitaiStream(fileName));
            }

            public StructArray(KaitaiStream p__io, Utt p__parent = null, Utt p__root = null) : base(p__io)
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
            private Utt m_root;
            private Utt m_parent;

            /// <summary>
            /// Array of struct entries (12 bytes each)
            /// </summary>
            public List<StructEntry> Entries { get { return _entries; } }
            public Utt M_Root { get { return m_root; } }
            public Utt M_Parent { get { return m_parent; } }
        }
        public partial class StructEntry : KaitaiStruct
        {
            public static StructEntry FromFile(string fileName)
            {
                return new StructEntry(new KaitaiStream(fileName));
            }

            public StructEntry(KaitaiStream p__io, Utt.StructArray p__parent = null, Utt p__root = null) : base(p__io)
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
            private Utt m_root;
            private Utt.StructArray m_parent;

            /// <summary>
            /// Structure type identifier.
            /// Root struct always has struct_id = 0xFFFFFFFF (-1).
            /// UTT-specific struct IDs:
            /// - 0xFFFFFFFF (-1): Root struct containing trigger metadata
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
            public Utt M_Root { get { return m_root; } }
            public Utt.StructArray M_Parent { get { return m_parent; } }
        }
        private GffHeader _gffHeader;
        private LabelArray _labelArray;
        private StructArray _structArray;
        private FieldArray _fieldArray;
        private FieldDataSection _fieldData;
        private FieldIndicesArray _fieldIndices;
        private ListIndicesArray _listIndices;
        private Utt m_root;
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
        public Utt M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
