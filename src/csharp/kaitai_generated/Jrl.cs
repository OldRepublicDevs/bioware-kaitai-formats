// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// JRL (Journal) files store quest journal entries and categories.
    /// 
    /// This format inherits the complete GFF structure from gff.ksy.
    /// 
    /// JRL Root Struct Fields:
    /// - Categories (List): Journal categories
    /// - Each category contains quest entries with text, states, priorities
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-JRL.md
    /// </summary>
    public partial class Jrl : KaitaiStruct
    {
        public static Jrl FromFile(string fileName)
        {
            return new Jrl(new KaitaiStream(fileName));
        }

        public Jrl(KaitaiStream p__io, KaitaiStruct p__parent = null, Jrl p__root = null) : base(p__io)
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
                _fileTypeValid = (bool) (GffData.Header.FileType == "JRL ");
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
        private Jrl m_root;
        private KaitaiStruct m_parent;
        public Gff.Gff GffData { get { return _gffData; } }
        public Jrl M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
