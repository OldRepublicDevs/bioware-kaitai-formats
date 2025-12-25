// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// UTI (Item Template) files are GFF-based format files that store item definitions including
    /// properties, costs, charges, and upgrade information. UTI files use the GFF (Generic File Format)
    /// binary structure with file type signature &quot;UTI &quot;.
    /// 
    /// UTI files contain:
    /// - Root struct with item metadata:
    ///   - TemplateResRef: Item template ResRef (unique identifier, max 16 characters, ResRef type)
    ///   - LocalizedName: Localized item name (LocalizedString/CExoLocString type)
    ///   - Description: Generic description when unidentified (LocalizedString/CExoLocString type)
    ///   - DescIdentified: Description when item is identified (LocalizedString/CExoLocString type)
    ///   - Tag: Item tag identifier (String/CExoString type, used for scripting references)
    ///   - Comment: Developer comment string (String/CExoString type, toolset only, not used by game engine)
    /// - Base Item Configuration:
    ///   - BaseItem: Index into baseitems.2da (Int32, defines item type: weapon, armor, upgrade, etc.)
    ///   - Cost: Base value in credits (UInt32, base item cost)
    ///   - AddCost: Additional cost from properties (UInt32, added to base cost for final value)
    ///   - Plot: Plot-critical item flag (UInt8/Byte, 0 = normal item, 1 = cannot be sold/destroyed)
    ///   - Charges: Number of uses remaining (UInt8/Byte, 0 = unlimited/not applicable)
    ///   - StackSize: Current stack quantity (UInt16, how many items in this stack)
    ///   - ModelVariation: Model variation index (UInt8/Byte, 1-99, determines which model variant to use)
    ///   - BodyVariation: Body variation for armor (UInt8/Byte, 1-9, body model variation)
    ///   - TextureVar: Texture variation for armor (UInt8/Byte, 1-9, texture variant)
    ///   - PaletteID: Toolset palette category (UInt8/Byte, editor organization, doesn't affect gameplay)
    /// - Quest &amp; Special Item flags:
    ///   - Identified: Player has identified the item (Int32, 0 = unidentified, 1 = identified)
    ///   - Stolen: Marked as stolen (Int32, deprecated, 0 = not stolen, 1 = stolen)
    /// - Item Properties:
    ///   - PropertiesList: List of item properties and enchantments (List type, contains property structs)
    ///   Each property struct contains:
    ///     - PropertyName: Index into itempropdef.2da (UInt16, property type identifier)
    ///     - Subtype: Property subtype/category (UInt16, property category)
    ///     - CostTable: Cost table index (UInt8/Byte, which cost table to use)
    ///     - CostValue: Cost value (UInt16, property cost value)
    ///     - Param1: First parameter (UInt8/Byte, property parameter)
    ///     - Param1Value: First parameter value (UInt8/Byte, parameter value)
    ///     - ChanceAppear: Percentage chance to appear (UInt8/Byte, 0-100, for random loot)
    ///     - UpgradeType: Upgrade type (UInt8/Byte, optional, KotOR2 only, upgrade slot type)
    /// - KotOR1-specific fields:
    ///   - Upgradable: Item accepts upgrade items (UInt8/Byte, 0 = no upgrades, 1 = can upgrade)
    /// - KotOR2-specific fields:
    ///   - UpgradeLevel: Current upgrade tier (UInt8/Byte, 0-2, number of upgrade slots used)
    ///   - WeaponColor: Blade color for lightsabers (UInt8/Byte, 0-10, color index)
    ///   - WeaponWhoosh: Whoosh sound type (UInt8/Byte, sound variant for weapon swings)
    ///   - ArmorRulesType: Armor class category (UInt8/Byte, armor restriction category)
    /// 
    /// BaseItem Types (from baseitems.2da):
    /// - 0-10: Various weapon types (shortsword, longsword, blaster, etc.)
    /// - 11-30: Armor types and shields
    /// - 31-50: Quest items, grenades, medical supplies
    /// - 51-70: Upgrades, armbands, belts
    /// - 71-90: Droid equipment, special items
    /// - 91+: KotOR2-specific items
    /// 
    /// Common Item Properties (from itempropdef.2da):
    /// - Attack Bonus: +1 to +12 attack rolls
    /// - Damage Bonus: Additional damage dice
    /// - Ability Bonus: +1 to +12 to ability scores
    /// - Damage Resistance: Reduce damage by amount/percentage
    /// - Saving Throw Bonus: +1 to +20 to saves
    /// - Skill Bonus: +1 to +50 to skills
    /// - Immunity: Immunity to damage type or condition
    /// - On Hit: Cast spell/effect on successful hit
    /// - Keen: Expanded critical threat range
    /// - Massive Criticals: Bonus damage on critical hit
    /// 
    /// Lightsaber Colors (KotOR2 WeaponColor):
    /// - 0: Blue, 1: Yellow, 2: Green, 3: Red
    /// - 4: Violet, 5: Orange, 6: Cyan, 7: Silver
    /// - 8: White, 9: Viridian, 10: Bronze
    /// 
    /// References:
    /// - vendor/PyKotor/wiki/GFF-UTI.md
    /// - vendor/PyKotor/wiki/GFF-File-Format.md
    /// - vendor/PyKotor/Libraries/PyKotor/src/pykotor/resource/generics/uti.py:20-400
    /// - vendor/reone/src/libs/resource/parser/gff/uti.cpp
    /// </summary>
    public partial class Uti : KaitaiStruct
    {
        public static Uti FromFile(string fileName)
        {
            return new Uti(new KaitaiStream(fileName));
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
        public Uti(KaitaiStream p__io, KaitaiStruct p__parent = null, Uti p__root = null) : base(p__io)
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
            if (GffHeader.StructCount > 0) {
                _structArray = new StructArray(m_io, this, m_root);
            }
            if (GffHeader.FieldCount > 0) {
                _fieldArray = new FieldArray(m_io, this, m_root);
            }
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

            public FieldArray(KaitaiStream p__io, Uti p__parent = null, Uti p__root = null) : base(p__io)
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
            private Uti m_root;
            private Uti m_parent;

            /// <summary>
            /// Array of field entries (12 bytes each)
            /// </summary>
            public List<FieldEntry> Entries { get { return _entries; } }
            public Uti M_Root { get { return m_root; } }
            public Uti M_Parent { get { return m_parent; } }
        }
        public partial class FieldDataSection : KaitaiStruct
        {
            public static FieldDataSection FromFile(string fileName)
            {
                return new FieldDataSection(new KaitaiStream(fileName));
            }

            public FieldDataSection(KaitaiStream p__io, Uti p__parent = null, Uti p__root = null) : base(p__io)
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
            private Uti m_root;
            private Uti m_parent;

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
            public Uti M_Root { get { return m_root; } }
            public Uti M_Parent { get { return m_parent; } }
        }
        public partial class FieldEntry : KaitaiStruct
        {
            public static FieldEntry FromFile(string fileName)
            {
                return new FieldEntry(new KaitaiStream(fileName));
            }

            public FieldEntry(KaitaiStream p__io, Uti.FieldArray p__parent = null, Uti p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_fieldDataOffsetValue = false;
                f_listIndicesOffsetValue = false;
                f_structIndexValue = false;
                _read();
            }
            private void _read()
            {
                _fieldType = ((Uti.GffFieldType) m_io.ReadU4le());
                _labelIndex = m_io.ReadU4le();
                _dataOrOffset = m_io.ReadU4le();
            }
            private bool f_fieldDataOffsetValue;
            private int _fieldDataOffsetValue;

            /// <summary>
            /// Absolute file offset to field data for complex types.
            /// Note: Field type checking (simple vs complex vs struct vs list) handled by application code.
            /// </summary>
            public int FieldDataOffsetValue
            {
                get
                {
                    if (f_fieldDataOffsetValue)
                        return _fieldDataOffsetValue;
                    f_fieldDataOffsetValue = true;
                    _fieldDataOffsetValue = (int) (M_Root.GffHeader.FieldDataOffset + DataOrOffset);
                    return _fieldDataOffsetValue;
                }
            }
            private bool f_listIndicesOffsetValue;
            private int _listIndicesOffsetValue;

            /// <summary>
            /// Absolute file offset to list indices for list type fields (when field_type is list/15).
            /// Note: Field type checking handled by application code. Used for PropertiesList.
            /// </summary>
            public int ListIndicesOffsetValue
            {
                get
                {
                    if (f_listIndicesOffsetValue)
                        return _listIndicesOffsetValue;
                    f_listIndicesOffsetValue = true;
                    _listIndicesOffsetValue = (int) (M_Root.GffHeader.ListIndicesOffset + DataOrOffset);
                    return _listIndicesOffsetValue;
                }
            }
            private bool f_structIndexValue;
            private uint _structIndexValue;

            /// <summary>
            /// Struct index for struct type fields (when field_type is struct/14).
            /// Note: Field type checking handled by application code.
            /// </summary>
            public uint StructIndexValue
            {
                get
                {
                    if (f_structIndexValue)
                        return _structIndexValue;
                    f_structIndexValue = true;
                    _structIndexValue = (uint) (DataOrOffset);
                    return _structIndexValue;
                }
            }
            private GffFieldType _fieldType;
            private uint _labelIndex;
            private uint _dataOrOffset;
            private Uti m_root;
            private Uti.FieldArray m_parent;

            /// <summary>
            /// Field data type (see gff_field_type enum):
            /// 0 = Byte (UInt8) - Used for: Plot, Charges, ModelVariation, BodyVariation, TextureVar,
            ///     PaletteID, Upgradable (KotOR1), UpgradeLevel (KotOR2), WeaponColor (KotOR2),
            ///     WeaponWhoosh (KotOR2), ArmorRulesType (KotOR2), CostTable, Param1, Param1Value,
            ///     ChanceAppear, UpgradeType (KotOR2)
            /// 1 = Char (Int8)
            /// 2 = UInt16 - Used for: StackSize, PropertyName, Subtype, CostValue
            /// 3 = Int16
            /// 4 = UInt32 - Used for: Cost, AddCost
            /// 5 = Int32 - Used for: BaseItem, Identified, Stolen
            /// 6 = UInt64
            /// 7 = Int64
            /// 8 = Single (Float32)
            /// 9 = Double (Float64)
            /// 10 = CExoString (String) - Used for: Tag, Comment
            /// 11 = ResRef - Used for: TemplateResRef
            /// 12 = CExoLocString (LocalizedString) - Used for: LocalizedName, Description, DescIdentified
            /// 13 = Void (Binary)
            /// 14 = Struct
            /// 15 = List - Used for: PropertiesList
            /// 16 = Vector4
            /// 17 = Vector3
            /// </summary>
            public GffFieldType FieldType { get { return _fieldType; } }

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
            public Uti M_Root { get { return m_root; } }
            public Uti.FieldArray M_Parent { get { return m_parent; } }
        }
        public partial class FieldIndicesArray : KaitaiStruct
        {
            public static FieldIndicesArray FromFile(string fileName)
            {
                return new FieldIndicesArray(new KaitaiStream(fileName));
            }

            public FieldIndicesArray(KaitaiStream p__io, Uti p__parent = null, Uti p__root = null) : base(p__io)
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
            private Uti m_root;
            private Uti m_parent;

            /// <summary>
            /// Array of field indices. When a struct has multiple fields, it stores an offset
            /// into this array, and the next N consecutive u4 values (where N = struct.field_count)
            /// are the field indices for that struct.
            /// Example: Root struct with 20+ fields stores offset to this array, then 20+ consecutive
            /// u4 values here are the field indices for TemplateResRef, LocalizedName, Description,
            /// DescIdentified, Tag, Comment, BaseItem, Cost, AddCost, Plot, Charges, StackSize, etc.
            /// </summary>
            public List<uint> Indices { get { return _indices; } }
            public Uti M_Root { get { return m_root; } }
            public Uti M_Parent { get { return m_parent; } }
        }
        public partial class GffHeader : KaitaiStruct
        {
            public static GffHeader FromFile(string fileName)
            {
                return new GffHeader(new KaitaiStream(fileName));
            }

            public GffHeader(KaitaiStream p__io, Uti p__parent = null, Uti p__root = null) : base(p__io)
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
            private Uti m_root;
            private Uti m_parent;

            /// <summary>
            /// File type signature. Must be &quot;UTI &quot; (space-padded) for item template files.
            /// Other GFF types: &quot;GFF &quot;, &quot;DLG &quot;, &quot;ARE &quot;, &quot;UTC &quot;, &quot;UTD &quot;, &quot;UTM &quot;, &quot;GIT &quot;, etc.
            /// Validation handled by application code.
            /// </summary>
            public string FileType { get { return _fileType; } }

            /// <summary>
            /// File format version. Valid values: &quot;V3.2&quot; (KotOR), &quot;V3.3&quot;, &quot;V4.0&quot;, &quot;V4.1&quot; (other BioWare games).
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
            public Uti M_Root { get { return m_root; } }
            public Uti M_Parent { get { return m_parent; } }
        }
        public partial class LabelArray : KaitaiStruct
        {
            public static LabelArray FromFile(string fileName)
            {
                return new LabelArray(new KaitaiStream(fileName));
            }

            public LabelArray(KaitaiStream p__io, Uti p__parent = null, Uti p__root = null) : base(p__io)
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
            private Uti m_root;
            private Uti m_parent;

            /// <summary>
            /// Array of label entries (16 bytes each)
            /// </summary>
            public List<LabelEntry> Labels { get { return _labels; } }
            public Uti M_Root { get { return m_root; } }
            public Uti M_Parent { get { return m_parent; } }
        }
        public partial class LabelEntry : KaitaiStruct
        {
            public static LabelEntry FromFile(string fileName)
            {
                return new LabelEntry(new KaitaiStream(fileName));
            }

            public LabelEntry(KaitaiStream p__io, Uti.LabelArray p__parent = null, Uti p__root = null) : base(p__io)
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
            private Uti m_root;
            private Uti.LabelArray m_parent;

            /// <summary>
            /// Field name label (null-padded to 16 bytes, null-terminated).
            /// The actual label length is determined by the first null byte.
            /// Common UTI field names: &quot;TemplateResRef&quot;, &quot;LocalizedName&quot;, &quot;Description&quot;, &quot;DescIdentified&quot;,
            /// &quot;Tag&quot;, &quot;Comment&quot;, &quot;BaseItem&quot;, &quot;Cost&quot;, &quot;AddCost&quot;, &quot;Plot&quot;, &quot;Charges&quot;, &quot;StackSize&quot;,
            /// &quot;ModelVariation&quot;, &quot;BodyVariation&quot;, &quot;TextureVar&quot;, &quot;PaletteID&quot;, &quot;Identified&quot;, &quot;Stolen&quot;,
            /// &quot;PropertiesList&quot;, &quot;Upgradable&quot; (KotOR1), &quot;UpgradeLevel&quot; (KotOR2), &quot;WeaponColor&quot; (KotOR2),
            /// &quot;WeaponWhoosh&quot; (KotOR2), &quot;ArmorRulesType&quot; (KotOR2).
            /// Note: Trailing nulls should be trimmed by application code.
            /// </summary>
            public string Name { get { return _name; } }
            public Uti M_Root { get { return m_root; } }
            public Uti.LabelArray M_Parent { get { return m_parent; } }
        }
        public partial class ListEntry : KaitaiStruct
        {
            public static ListEntry FromFile(string fileName)
            {
                return new ListEntry(new KaitaiStream(fileName));
            }

            public ListEntry(KaitaiStream p__io, Uti.ListIndicesArray p__parent = null, Uti p__root = null) : base(p__io)
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
            private Uti m_root;
            private Uti.ListIndicesArray m_parent;

            /// <summary>
            /// Number of struct indices in this list.
            /// For PropertiesList: count = number of item properties.
            /// </summary>
            public uint Count { get { return _count; } }

            /// <summary>
            /// Array of struct indices (indices into struct_array).
            /// For PropertiesList: each struct index points to a property struct containing
            /// PropertyName, Subtype, CostTable, CostValue, Param1, Param1Value, ChanceAppear, UpgradeType.
            /// </summary>
            public List<uint> StructIndices { get { return _structIndices; } }
            public Uti M_Root { get { return m_root; } }
            public Uti.ListIndicesArray M_Parent { get { return m_parent; } }
        }
        public partial class ListIndicesArray : KaitaiStruct
        {
            public static ListIndicesArray FromFile(string fileName)
            {
                return new ListIndicesArray(new KaitaiStream(fileName));
            }

            public ListIndicesArray(KaitaiStream p__io, Uti p__parent = null, Uti p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _rawData = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(M_Root.GffHeader.ListIndicesCount));
                _entries = new List<ListEntry>();
                {
                    var i = 0;
                    ListEntry M_;
                    do {
                        M_ = new ListEntry(m_io, this, m_root);
                        _entries.Add(M_);
                        i++;
                    } while (!(M_Io.Pos >= M_Root.GffHeader.ListIndicesOffset + M_Root.GffHeader.ListIndicesCount));
                }
            }
            private string _rawData;
            private List<ListEntry> _entries;
            private Uti m_root;
            private Uti m_parent;

            /// <summary>
            /// Raw list indices data. List entries are accessed via offsets stored in
            /// list-type field entries (e.g., PropertiesList field). Each entry starts with a count (u4),
            /// followed by that many struct indices (u4 each).
            /// For PropertiesList: count = number of properties, then that many struct indices pointing
            /// to property structs in struct_array. Each property struct contains PropertyName, Subtype,
            /// CostTable, CostValue, Param1, Param1Value, ChanceAppear, UpgradeType (optional).
            /// </summary>
            public string RawData { get { return _rawData; } }

            /// <summary>
            /// Array of list entries. In practice, list entries are accessed via offsets
            /// stored in list-type field entries (field_entry.list_indices_offset_value),
            /// not as a sequential array. This is a simplified representation for documentation.
            /// For PropertiesList: typically contains one list_entry with count = number of properties.
            /// </summary>
            public List<ListEntry> Entries { get { return _entries; } }
            public Uti M_Root { get { return m_root; } }
            public Uti M_Parent { get { return m_parent; } }
        }
        public partial class LocalizedStringData : KaitaiStruct
        {
            public static LocalizedStringData FromFile(string fileName)
            {
                return new LocalizedStringData(new KaitaiStream(fileName));
            }

            public LocalizedStringData(KaitaiStream p__io, KaitaiStruct p__parent = null, Uti p__root = null) : base(p__io)
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
                _stringCount = m_io.ReadU4le();
                _substrings = new List<LocalizedSubstring>();
                for (var i = 0; i < StringCount; i++)
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
            private uint _stringCount;
            private List<LocalizedSubstring> _substrings;
            private Uti m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Total size of this LocalizedString structure in bytes (not including this count).
            /// Used for skipping over the structure, but can be calculated from the data.
            /// Format: total_size = 4 (string_ref) + 4 (string_count) + sum(substring sizes)
            /// Each substring: 4 (string_id) + 4 (string_length) + string_length (string_data)
            /// </summary>
            public uint TotalSize { get { return _totalSize; } }

            /// <summary>
            /// String reference ID (StrRef) into dialog.tlk file.
            /// Value 0xFFFFFFFF indicates no string reference (-1).
            /// If string_ref is valid (not -1), this is the primary string shown to the user.
            /// Language-specific substrings override this for specific languages/genders.
            /// For UTI, LocalizedName, Description, and DescIdentified use this to reference dialog.tlk entries.
            /// </summary>
            public uint StringRef { get { return _stringRef; } }

            /// <summary>
            /// Number of language-specific string substrings.
            /// Typically 0 if only using string_ref, or 1-10+ for multi-language support.
            /// </summary>
            public uint StringCount { get { return _stringCount; } }

            /// <summary>
            /// Array of language-specific string substrings.
            /// Each substring provides text for a specific language and gender combination.
            /// Used to override or supplement the string_ref text.
            /// </summary>
            public List<LocalizedSubstring> Substrings { get { return _substrings; } }
            public Uti M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class LocalizedSubstring : KaitaiStruct
        {
            public static LocalizedSubstring FromFile(string fileName)
            {
                return new LocalizedSubstring(new KaitaiStream(fileName));
            }

            public LocalizedSubstring(KaitaiStream p__io, Uti.LocalizedStringData p__parent = null, Uti p__root = null) : base(p__io)
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
            private Uti m_root;
            private Uti.LocalizedStringData m_parent;

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
            /// For UTI LocalizedName, Description, and DescIdentified, this contains the item name/description
            /// in the specified language/gender.
            /// </summary>
            public string StringData { get { return _stringData; } }
            public Uti M_Root { get { return m_root; } }
            public Uti.LocalizedStringData M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Property struct fields (accessed via struct_array entry):
        /// - PropertyName (UInt16): Index into itempropdef.2da, property type identifier
        /// - Subtype (UInt16): Property subtype/category
        /// - CostTable (UInt8): Cost table index
        /// - CostValue (UInt16): Cost value
        /// - Param1 (UInt8): First parameter
        /// - Param1Value (UInt8): First parameter value
        /// - ChanceAppear (UInt8): Percentage chance to appear (0-100, for random loot)
        /// - UpgradeType (UInt8, optional, KotOR2 only): Upgrade slot type
        /// </summary>
        public partial class PropertyStruct : KaitaiStruct
        {
            public static PropertyStruct FromFile(string fileName)
            {
                return new PropertyStruct(new KaitaiStream(fileName));
            }

            public PropertyStruct(KaitaiStream p__io, KaitaiStruct p__parent = null, Uti p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _propertyName = m_io.ReadU2le();
                _subtype = m_io.ReadU2le();
                _costTable = m_io.ReadU1();
                _costValue = m_io.ReadU2le();
                _param1 = m_io.ReadU1();
                _param1Value = m_io.ReadU1();
                _chanceAppear = m_io.ReadU1();
                _upgradeType = m_io.ReadU1();
            }
            private ushort _propertyName;
            private ushort _subtype;
            private byte _costTable;
            private ushort _costValue;
            private byte _param1;
            private byte _param1Value;
            private byte _chanceAppear;
            private byte _upgradeType;
            private Uti m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Index into itempropdef.2da (UInt16, property type identifier)
            /// </summary>
            public ushort PropertyName { get { return _propertyName; } }

            /// <summary>
            /// Property subtype/category (UInt16)
            /// </summary>
            public ushort Subtype { get { return _subtype; } }

            /// <summary>
            /// Cost table index (UInt8)
            /// </summary>
            public byte CostTable { get { return _costTable; } }

            /// <summary>
            /// Cost value (UInt16)
            /// </summary>
            public ushort CostValue { get { return _costValue; } }

            /// <summary>
            /// First parameter (UInt8)
            /// </summary>
            public byte Param1 { get { return _param1; } }

            /// <summary>
            /// First parameter value (UInt8)
            /// </summary>
            public byte Param1Value { get { return _param1Value; } }

            /// <summary>
            /// Percentage chance to appear (UInt8, 0-100, for random loot)
            /// </summary>
            public byte ChanceAppear { get { return _chanceAppear; } }

            /// <summary>
            /// Upgrade type (UInt8, optional, KotOR2 only, upgrade slot type)
            /// </summary>
            public byte UpgradeType { get { return _upgradeType; } }
            public Uti M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class ResrefData : KaitaiStruct
        {
            public static ResrefData FromFile(string fileName)
            {
                return new ResrefData(new KaitaiStream(fileName));
            }

            public ResrefData(KaitaiStream p__io, KaitaiStruct p__parent = null, Uti p__root = null) : base(p__io)
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
            private Uti m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Length of ResRef string (0-16). ResRef strings are limited to 16 characters.
            /// Common UTI ResRefs: item template names (e.g., &quot;w_sword001&quot;, &quot;g_w_lghtsbr01&quot;).
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
            public Uti M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class StringData : KaitaiStruct
        {
            public static StringData FromFile(string fileName)
            {
                return new StringData(new KaitaiStream(fileName));
            }

            public StringData(KaitaiStream p__io, KaitaiStruct p__parent = null, Uti p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _length = m_io.ReadU4le();
                _data = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(Length));
            }
            private uint _length;
            private string _data;
            private Uti m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Length of string data in bytes (not including null terminator)
            /// </summary>
            public uint Length { get { return _length; } }

            /// <summary>
            /// String data (ASCII encoded, null-terminated).
            /// Trailing null bytes should be trimmed.
            /// Common UTI strings: Tag (item tag for scripting), Comment (developer notes).
            /// Note: To extract the actual string value, trim trailing null bytes from 'data' in application code.
            /// </summary>
            public string Data { get { return _data; } }
            public Uti M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class StructArray : KaitaiStruct
        {
            public static StructArray FromFile(string fileName)
            {
                return new StructArray(new KaitaiStream(fileName));
            }

            public StructArray(KaitaiStream p__io, Uti p__parent = null, Uti p__root = null) : base(p__io)
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
            private Uti m_root;
            private Uti m_parent;

            /// <summary>
            /// Array of struct entries (12 bytes each)
            /// </summary>
            public List<StructEntry> Entries { get { return _entries; } }
            public Uti M_Root { get { return m_root; } }
            public Uti M_Parent { get { return m_parent; } }
        }
        public partial class StructEntry : KaitaiStruct
        {
            public static StructEntry FromFile(string fileName)
            {
                return new StructEntry(new KaitaiStream(fileName));
            }

            public StructEntry(KaitaiStream p__io, Uti.StructArray p__parent = null, Uti p__root = null) : base(p__io)
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
            private Uti m_root;
            private Uti.StructArray m_parent;

            /// <summary>
            /// Structure type identifier.
            /// Root struct always has struct_id = 0xFFFFFFFF (-1).
            /// UTI-specific struct IDs:
            /// - 0xFFFFFFFF (-1): Root struct containing item metadata
            /// - PropertiesList entries: Each property in PropertiesList is a struct (typically struct_id = 0)
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
            public Uti M_Root { get { return m_root; } }
            public Uti.StructArray M_Parent { get { return m_parent; } }
        }
        private GffHeader _gffHeader;
        private LabelArray _labelArray;
        private StructArray _structArray;
        private FieldArray _fieldArray;
        private FieldDataSection _fieldData;
        private FieldIndicesArray _fieldIndices;
        private ListIndicesArray _listIndices;
        private Uti m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// GFF file header (56 bytes)
        /// </summary>
        public GffHeader GffHeader { get { return _gffHeader; } }

        /// <summary>
        /// Array of field name labels (16-byte null-terminated strings).
        /// Located at offset gff_header.label_array_offset from start of file.
        /// Note: Position-based reading handled by application code due to Kaitai Struct limitations.
        /// </summary>
        public LabelArray LabelArray { get { return _labelArray; } }

        /// <summary>
        /// Array of struct entries (12 bytes each).
        /// Located at offset gff_header.struct_array_offset from start of file.
        /// Note: Position-based reading handled by application code due to Kaitai Struct limitations.
        /// </summary>
        public StructArray StructArray { get { return _structArray; } }

        /// <summary>
        /// Array of field entries (12 bytes each).
        /// Located at offset gff_header.field_array_offset from start of file.
        /// Note: Position-based reading handled by application code due to Kaitai Struct limitations.
        /// </summary>
        public FieldArray FieldArray { get { return _fieldArray; } }

        /// <summary>
        /// Field data section for complex types (strings, ResRefs, LocalizedStrings, etc.).
        /// Located at offset gff_header.field_data_offset from start of file.
        /// Note: Position-based reading handled by application code due to Kaitai Struct limitations.
        /// </summary>
        public FieldDataSection FieldData { get { return _fieldData; } }

        /// <summary>
        /// Field indices array (MultiMap) for structs with multiple fields.
        /// Located at offset gff_header.field_indices_offset from start of file.
        /// Note: Position-based reading handled by application code due to Kaitai Struct limitations.
        /// </summary>
        public FieldIndicesArray FieldIndices { get { return _fieldIndices; } }

        /// <summary>
        /// List indices array for LIST type fields (used for PropertiesList).
        /// Located at offset gff_header.list_indices_offset from start of file.
        /// Note: Position-based reading handled by application code due to Kaitai Struct limitations.
        /// </summary>
        public ListIndicesArray ListIndices { get { return _listIndices; } }
        public Uti M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
