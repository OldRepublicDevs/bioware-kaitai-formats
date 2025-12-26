// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// GUI (Graphical User Interface) files define UI layouts, controls, and properties.
    /// 
    /// This format inherits the complete GFF structure from gff.ksy.
    /// 
    /// GUI Root Struct Fields:
    /// - CONTROLS (List): UI control elements (buttons, labels, listboxes, etc.)
    /// - Each control contains:
    ///   - CONTROLTYPE (Int32): Control type (button=4, label=5, listbox=9, etc.)
    ///   - TAG (String): Control identifier
    ///   - X, Y, WIDTH, HEIGHT (Int32): Position and size
    ///   - TEXT (Struct): Text properties with STRREF, color, alignment
    ///   - BORDER (Struct): Border properties
    ///   - EXTENT (Struct): Dimensions
    ///   - Various control-specific fields
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GUI.md
    /// </summary>
    public partial class Gui : KaitaiStruct
    {
        public static Gui FromFile(string fileName)
        {
            return new Gui(new KaitaiStream(fileName));
        }

        public Gui(KaitaiStream p__io, KaitaiStruct p__parent = null, Gui p__root = null) : base(p__io)
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
                _fileTypeValid = (bool) (GffData.Header.FileType == "GUI ");
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
        private Gui m_root;
        private KaitaiStruct m_parent;
        public Gff.Gff GffData { get { return _gffData; } }
        public Gui M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
