// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// GAM (Game State) files are GFF-based format files that store game state information
    /// including party members, global variables, game time, and time played.
    /// 
    /// This format inherits the complete GFF structure from gff.ksy and adds GAM-specific
    /// validation and documentation.
    /// 
    /// GAM files are used by:
    /// - Aurora Engine (Neverwinter Nights, Neverwinter Nights 2)
    /// - Infinity Engine (Mass Effect, Dragon Age Origins, Dragon Age 2)
    /// 
    /// NOTE: Odyssey Engine (Knights of the Old Republic) does NOT use GAM format -
    /// it uses NFO format for save games instead.
    /// 
    /// GAM Root Struct Fields:
    /// - GameTimeHour, GameTimeMinute, GameTimeSecond, GameTimeMillisecond (Int32): Game time
    /// - TimePlayed (Int32): Total playtime in seconds
    /// - PartyList (List): Party member ResRefs
    /// - GlobalBooleans, GlobalNumbers, GlobalStrings (Lists): Global variable storage
    /// 
    /// Aurora-specific: ModuleName, CurrentArea, PlayerCharacter
    /// Infinity-specific: GameName, Chapter, JournalEntries
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GAM.md
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    /// </summary>
    public partial class Gam : KaitaiStruct
    {
        public static Gam FromFile(string fileName)
        {
            return new Gam(new KaitaiStream(fileName));
        }

        public Gam(KaitaiStream p__io, KaitaiStruct p__parent = null, Gam p__root = null) : base(p__io)
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
        /// Validates that this is a GAM file (file type must be &quot;GAM &quot;)
        /// </summary>
        public bool FileTypeValid
        {
            get
            {
                if (f_fileTypeValid)
                    return _fileTypeValid;
                f_fileTypeValid = true;
                _fileTypeValid = (bool) (GffData.Header.FileType == "GAM ");
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
        private Gam m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Complete GFF structure. GAM files use standard GFF format with &quot;GAM &quot; file type.
        /// Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
        /// </summary>
        public Gff.Gff GffData { get { return _gffData; } }
        public Gam M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
