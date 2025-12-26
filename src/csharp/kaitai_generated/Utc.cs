// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// UTC (Creature Template) files are GFF-based format files that store creature definitions
    /// including stats, appearance, inventory, feats, and script hooks. UTC files are used to
    /// define NPCs, party members, enemies, and the player character in Knights of the Old Republic.
    /// 
    /// This format inherits the complete GFF structure from gff.ksy and adds UTC-specific
    /// validation and documentation.
    /// 
    /// UTC Root Struct Fields (Common):
    /// - &quot;TemplateResRef&quot; (ResRef): Blueprint identifier
    /// - &quot;Tag&quot; (String): Unique instance identifier
    /// - &quot;FirstName&quot;, &quot;LastName&quot; (LocalizedString): Creature name
    /// - &quot;Appearance_Type&quot; (UInt32): Appearance ID (appearance.2da)
    /// - &quot;PortraitId&quot; (UInt16): Portrait index (portraits.2da)
    /// - &quot;Gender&quot;, &quot;Race&quot; (UInt8/UInt16): Character attributes
    /// - &quot;Str&quot;, &quot;Dex&quot;, &quot;Con&quot;, &quot;Int&quot;, &quot;Wis&quot;, &quot;Cha&quot; (UInt8): Ability scores
    /// - &quot;HitPoints&quot;, &quot;MaxHitPoints&quot;, &quot;ForcePoints&quot; (Int16): Health/Force stats
    /// - &quot;ClassList&quot; (List): Character classes with levels
    /// - &quot;FeatList&quot; (List): Known feats
    /// - &quot;SkillList&quot; (List): Skill ranks
    /// - &quot;ItemList&quot; (List): Inventory items
    /// - &quot;Equip_ItemList&quot; (List): Equipped items with slots
    /// - Script hooks: &quot;ScriptAttacked&quot;, &quot;ScriptDamaged&quot;, &quot;ScriptDeath&quot;, etc. (ResRef)
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTC.md
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    /// - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utc.py
    /// - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/utc.cpp
    /// </summary>
    public partial class Utc : KaitaiStruct
    {
        public static Utc FromFile(string fileName)
        {
            return new Utc(new KaitaiStream(fileName));
        }

        public Utc(KaitaiStream p__io, KaitaiStruct p__parent = null, Utc p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_fileTypeValid = false;
            f_versionValid = false;
            _read();
        }
        private void _read()
        {
            _gffData = new Gff.Gff(m_io);
        }
        private bool f_fileTypeValid;
        private bool _fileTypeValid;

        /// <summary>
        /// Validates that this is a UTC file (file type must be &quot;UTC &quot;)
        /// </summary>
        public bool FileTypeValid
        {
            get
            {
                if (f_fileTypeValid)
                    return _fileTypeValid;
                f_fileTypeValid = true;
                _fileTypeValid = (bool) (GffData.Header.FileType == "UTC ");
                return _fileTypeValid;
            }
        }
        private bool f_versionValid;
        private bool _versionValid;

        /// <summary>
        /// Validates GFF version is supported
        /// </summary>
        public bool VersionValid
        {
            get
            {
                if (f_versionValid)
                    return _versionValid;
                f_versionValid = true;
                _versionValid = (bool) ( ((GffData.Header.FileVersion == "V3.2") || (GffData.Header.FileVersion == "V3.3") || (GffData.Header.FileVersion == "V4.0") || (GffData.Header.FileVersion == "V4.1")) );
                return _versionValid;
            }
        }
        private Gff.Gff _gffData;
        private Utc m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Complete GFF structure. UTC files use standard GFF format with &quot;UTC &quot; file type.
        /// Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
        /// </summary>
        public Gff.Gff GffData { get { return _gffData; } }
        public Utc M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
