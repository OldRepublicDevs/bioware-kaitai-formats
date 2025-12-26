// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// UTW (Waypoint Template) files define navigation waypoints and spawn points.
    /// 
    /// This format inherits the complete GFF structure from gff.ksy.
    /// 
    /// UTW Root Struct Fields:
    /// - TemplateResRef (ResRef): Blueprint identifier
    /// - Tag (String): Instance identifier
    /// - LocalizedName (LocalizedString): Waypoint name
    /// - Appearance (UInt32): Visual appearance (if visible)
    /// - HasMapNote, MapNote (LocalizedString): Map markers
    /// - LinkedTo (String): Connected waypoint tag
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
                _fileTypeValid = (bool) (GffData.Header.FileType == "UTW ");
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
                _versionValid = (bool) ( ((GffData.Header.FileVersion == "V3.2") || (GffData.Header.FileVersion == "V3.3")) );
                return _versionValid;
            }
        }
        private Gff.Gff _gffData;
        private Utw m_root;
        private KaitaiStruct m_parent;
        public Gff.Gff GffData { get { return _gffData; } }
        public Utw M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
