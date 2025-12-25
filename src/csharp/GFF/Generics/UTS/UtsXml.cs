// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// UTS XML format is a human-readable XML representation of UTS (Sound) binary files.
    /// Uses GFF XML structure with root element &lt;gff3&gt; containing &lt;struct&gt; elements.
    /// Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).
    /// </summary>
    public partial class UtsXml : KaitaiStruct
    {
        public static UtsXml FromFile(string fileName)
        {
            return new UtsXml(new KaitaiStream(fileName));
        }

        public UtsXml(KaitaiStream p__io, KaitaiStruct p__parent = null, UtsXml p__root = null) : base(p__io)
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
        private UtsXml m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// XML document content as UTF-8 text
        /// </summary>
        public string XmlContent { get { return _xmlContent; } }
        public UtsXml M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
