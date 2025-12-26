// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// PT (Party Table) files are GFF-based format files that store party and game state information
    /// for Odyssey Engine games (KotOR and KotOR 2). PT files use the GFF (Generic File Format) binary
    /// structure with file type signature &quot;PT  &quot;.
    /// 
    /// This format inherits the complete GFF structure from gff.ksy and adds PT-specific
    /// validation and documentation.
    /// 
    /// PT files are typically named &quot;PARTYTABLE.res&quot; and are stored in savegame.sav ERF archives.
    /// They contain comprehensive party and game state information including:
    /// - Party composition (current members, available NPCs, leader)
    /// - Resources (gold/credits, XP pool, components, chemicals)
    /// - Journal entries with states, dates, and times
    /// - Pazaak cards and side decks for the mini-game
    /// - UI state (last panel, messages, tutorial windows shown)
    /// - AI state (follow mode, AI enabled, solo mode)
    /// - K2-specific: Influence values per companion
    /// 
    /// PT Root Struct Fields (Common):
    /// - &quot;PT_PCNAME&quot; (String): Player character name
    /// - &quot;PT_GOLD&quot; (Int32): Credits/gold amount
    /// - &quot;PT_XP_POOL&quot; (Int32): Experience points
    /// - &quot;PT_PLAYEDSECONDS&quot; (UInt32): Total playtime in seconds
    /// - &quot;PT_NUM_MEMBERS&quot; (Int32): Party member count
    /// - &quot;PT_CONTROLLED_NPC&quot;, &quot;PT_SOLOMODE&quot;, &quot;PT_AISTATE&quot;, &quot;PT_FOLLOWSTATE&quot; (Int32): AI/party state
    /// - &quot;PT_MEMBERS&quot; (List): Party member ResRefs and leader flags
    /// - &quot;PT_AVAIL_NPCS&quot; (List): Available NPCs for recruitment
    /// - &quot;PT_INFLUENCE&quot; (List): Influence values (KotOR 2 only)
    /// - &quot;PT_PAZAAKCARDS&quot;, &quot;PT_PAZSIDELIST&quot; (List): Pazaak card collections
    /// - Journal/message lists: &quot;PT_FB_MSG_LIST&quot;, &quot;PT_DLG_MSG_LIST&quot;, &quot;PT_COM_MSG_LIST&quot;
    /// 
    /// Based on swkotor2.exe: SavePartyTable @ 0x0057bd70
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/extract/savedata.py
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PT.md
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    /// </summary>
    public partial class Pt : KaitaiStruct
    {
        public static Pt FromFile(string fileName)
        {
            return new Pt(new KaitaiStream(fileName));
        }

        public Pt(KaitaiStream p__io, KaitaiStruct p__parent = null, Pt p__root = null) : base(p__io)
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
        /// Validates that this is a PT file (file type must be &quot;PT  &quot;)
        /// </summary>
        public bool FileTypeValid
        {
            get
            {
                if (f_fileTypeValid)
                    return _fileTypeValid;
                f_fileTypeValid = true;
                _fileTypeValid = (bool) (GffData.Header.FileType == "PT  ");
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
        private Pt m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Complete GFF structure. PT files use standard GFF format with &quot;PT  &quot; file type.
        /// Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
        /// </summary>
        public Gff.Gff GffData { get { return _gffData; } }
        public Pt M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
