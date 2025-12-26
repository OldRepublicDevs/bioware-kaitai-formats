// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// DLG (Dialogue) files are GFF-based format files that store conversation trees with entries, replies,
    /// links, and conversation metadata for Odyssey and Aurora engines.
    /// 
    /// This format inherits the complete GFF structure from gff.ksy and adds DLG-specific
    /// validation and documentation.
    /// 
    /// DLG files contain:
    /// - Root struct with conversation metadata (NumWords, Skippable, ConversationType, etc.)
    /// - EntryList: Array of dialogue entries (NPC lines)
    /// - ReplyList: Array of reply options (player responses)
    /// - StartingList: Array of entry points into conversation tree
    /// - StuntList: Array of cutscene/animation sequences
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-DLG.md
    /// - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/dlg/
    /// </summary>
    public partial class Dlg : KaitaiStruct
    {
        public static Dlg FromFile(string fileName)
        {
            return new Dlg(new KaitaiStream(fileName));
        }

        public Dlg(KaitaiStream p__io, KaitaiStruct p__parent = null, Dlg p__root = null) : base(p__io)
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
        /// Validates DLG file type
        /// </summary>
        public bool FileTypeValid
        {
            get
            {
                if (f_fileTypeValid)
                    return _fileTypeValid;
                f_fileTypeValid = true;
                _fileTypeValid = (bool) (GffData.Header.FileType == "DLG ");
                return _fileTypeValid;
            }
        }
        private bool f_versionValid;
        private bool _versionValid;

        /// <summary>
        /// Validates GFF version
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
        private Dlg m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Complete GFF structure with &quot;DLG &quot; file type
        /// </summary>
        public Gff.Gff GffData { get { return _gffData; } }
        public Dlg M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
