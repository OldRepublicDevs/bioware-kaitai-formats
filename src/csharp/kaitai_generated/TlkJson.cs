// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// TLK JSON format is a human-readable JSON representation of TLK (Talk Table) binary files.
    /// Provides easier editing and translation than binary TLK format.
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/io_tlk_xml.py
    /// </summary>
    public partial class TlkJson : KaitaiStruct
    {
        public static TlkJson FromFile(string fileName)
        {
            return new TlkJson(new KaitaiStream(fileName));
        }

        public TlkJson(KaitaiStream p__io, KaitaiStruct p__parent = null, TlkJson p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _jsonContent = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
        }
        private string _jsonContent;
        private TlkJson m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// JSON document content as UTF-8 text
        /// </summary>
        public string JsonContent { get { return _jsonContent; } }
        public TlkJson M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
