// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// UTP (Placeable Template) files define placeable objects (containers, furniture, etc.).
    /// 
    /// This format inherits the complete GFF structure from gff.ksy.
    /// 
    /// UTP Root Struct Fields:
    /// - TemplateResRef (ResRef): Blueprint identifier
    /// - Tag (String): Instance identifier
    /// - LocalizedName (LocalizedString): Placeable name
    /// - Appearance (UInt32): Placeable appearance ID
    /// - HasInventory, ItemList (List): Container contents
    /// - Locked, KeyRequired, Trap: Security settings
    /// - Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnHeartbeat, etc.
    /// </summary>
    public partial class Utp : KaitaiStruct
    {
        public static Utp FromFile(string fileName)
        {
            return new Utp(new KaitaiStream(fileName));
        }

        public Utp(KaitaiStream p__io, KaitaiStruct p__parent = null, Utp p__root = null) : base(p__io)
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
                _fileTypeValid = (bool) (GffData.Header.FileType == "UTP ");
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
        private Utp m_root;
        private KaitaiStruct m_parent;
        public Gff.Gff GffData { get { return _gffData; } }
        public Utp M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
