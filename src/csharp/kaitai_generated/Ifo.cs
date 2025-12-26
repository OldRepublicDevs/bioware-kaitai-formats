// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// IFO (Module Information) files store module metadata including entry points,
    /// starting locations, and module properties.
    /// 
    /// This format inherits the complete GFF structure from gff.ksy.
    /// 
    /// IFO Root Struct Fields:
    /// - Mod_ID (ResRef): Module identifier
    /// - Mod_Name (LocalizedString): Module display name
    /// - Mod_Entry_Area (ResRef): Starting area
    /// - Mod_Entry_X, Mod_Entry_Y, Mod_Entry_Z (Float): Starting position
    /// - Mod_Entry_Dir_X, Mod_Entry_Dir_Y (Float): Starting orientation
    /// - Mod_OnHeartbeat, Mod_OnModLoad, Mod_OnModStart (ResRef): Script hooks
    /// - Mod_MinGameVer (String): Minimum game version required
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-IFO.md
    /// </summary>
    public partial class Ifo : KaitaiStruct
    {
        public static Ifo FromFile(string fileName)
        {
            return new Ifo(new KaitaiStream(fileName));
        }

        public Ifo(KaitaiStream p__io, KaitaiStruct p__parent = null, Ifo p__root = null) : base(p__io)
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
        public bool FileTypeValid
        {
            get
            {
                if (f_fileTypeValid)
                    return _fileTypeValid;
                f_fileTypeValid = true;
                _fileTypeValid = (bool) (GffData.Header.FileType == "IFO ");
                return _fileTypeValid;
            }
        }
        private bool f_versionValid;
        private bool _versionValid;
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
        private Ifo m_root;
        private KaitaiStruct m_parent;
        public Gff.Gff GffData { get { return _gffData; } }
        public Ifo M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
