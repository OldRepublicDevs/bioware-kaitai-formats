// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// SSF XML format is a human-readable XML representation of SSF (Soundset) binary files.
    /// Provides easier editing than binary SSF format.
    /// </summary>
    public partial class SsfXml : KaitaiStruct
    {
        public static SsfXml FromFile(string fileName)
        {
            return new SsfXml(new KaitaiStream(fileName));
        }

        public SsfXml(KaitaiStream p__io, KaitaiStruct p__parent = null, SsfXml p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _xmlContent = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
        }
        private string _xmlContent;
        private SsfXml m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// XML document content as UTF-8 text
        /// </summary>
        public string XmlContent { get { return _xmlContent; } }
        public SsfXml M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
