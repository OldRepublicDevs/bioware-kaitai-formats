// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// BZF (BioWare Zipped File) files are LZMA-compressed BIF files used primarily in iOS
    /// (and maybe Android) ports of KotOR. The BZF header contains &quot;BZF &quot; + &quot;V1.0&quot;, followed
    /// by LZMA-compressed BIF data. Decompression reveals a standard BIF structure.
    /// 
    /// Format Structure:
    /// - Header (8 bytes): File type signature &quot;BZF &quot; and version &quot;V1.0&quot;
    /// - Compressed Data: LZMA-compressed BIF file data
    /// 
    /// After decompression, the data follows the standard BIF format structure.
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/BIF-File-Format.md - BZF compression section
    /// - BIF.ksy - Standard BIF format (decompressed BZF data matches this)
    /// </summary>
    public partial class Bzf : KaitaiStruct
    {
        public static Bzf FromFile(string fileName)
        {
            return new Bzf(new KaitaiStream(fileName));
        }

        public Bzf(KaitaiStream p__io, KaitaiStruct p__parent = null, Bzf p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _fileType = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
            if (!(_fileType == "BZF "))
            {
                throw new ValidationNotEqualError("BZF ", _fileType, m_io, "/seq/0");
            }
            _version = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
            if (!(_version == "V1.0"))
            {
                throw new ValidationNotEqualError("V1.0", _version, m_io, "/seq/1");
            }
            _compressedData = new List<byte>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _compressedData.Add(m_io.ReadU1());
                    i++;
                }
            }
        }
        private string _fileType;
        private string _version;
        private List<byte> _compressedData;
        private Bzf m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// File type signature. Must be &quot;BZF &quot; for compressed BIF files.
        /// </summary>
        public string FileType { get { return _fileType; } }

        /// <summary>
        /// File format version. Always &quot;V1.0&quot; for BZF files.
        /// </summary>
        public string Version { get { return _version; } }

        /// <summary>
        /// LZMA-compressed BIF file data.
        /// This data must be decompressed using LZMA algorithm to obtain the standard BIF structure.
        /// After decompression, the data can be parsed using the BIF format definition.
        /// </summary>
        public List<byte> CompressedData { get { return _compressedData; } }
        public Bzf M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
