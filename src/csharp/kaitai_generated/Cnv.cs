// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// CNV (Conversation) files are GFF-based format files that store conversation trees with entries, replies,
    /// links, and conversation metadata. CNV files use the GFF (Generic File Format) binary structure
    /// with file type signature &quot;CNV &quot;.
    /// 
    /// This format inherits the complete GFF structure from gff.ksy and adds CNV-specific
    /// validation and documentation.
    /// 
    /// CNV files are used by Eclipse Engine games (Dragon Age Origins, Dragon Age 2, Mass Effect, Mass Effect 2).
    /// They are similar to DLG files used by Odyssey and Aurora engines but adapted for Eclipse's conversation system.
    /// 
    /// CNV Root Struct Fields:
    /// - NumWords (Int32): Word count for conversation
    /// - Skippable (UInt8): Whether conversation can be skipped
    /// - ConversationType (Int32): Conversation type identifier
    /// - EntryList (List): NPC dialogue lines (CNVEntry structs)
    /// - ReplyList (List): Player response options (CNVReply structs)
    /// - StartingList (List): Entry points (CNVLink structs)
    /// - StuntList (List): Special animations (CNVStunt structs)
    /// 
    /// Each Entry/Reply contains:
    /// - Text (LocalizedString): Dialogue text
    /// - Script (ResRef): Conditional/action scripts
    /// - Camera settings, animations, links to other nodes
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-CNV.md
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    /// </summary>
    public partial class Cnv : KaitaiStruct
    {
        public static Cnv FromFile(string fileName)
        {
            return new Cnv(new KaitaiStream(fileName));
        }

        public Cnv(KaitaiStream p__io, KaitaiStruct p__parent = null, Cnv p__root = null) : base(p__io)
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
        /// Validates that this is a CNV file (file type must be &quot;CNV &quot;)
        /// </summary>
        public bool FileTypeValid
        {
            get
            {
                if (f_fileTypeValid)
                    return _fileTypeValid;
                f_fileTypeValid = true;
                _fileTypeValid = (bool) (GffData.Header.FileType == "CNV ");
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
        private Cnv m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Complete GFF structure. CNV files use standard GFF format with &quot;CNV &quot; file type.
        /// Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
        /// </summary>
        public Gff.Gff GffData { get { return _gffData; } }
        public Cnv M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
