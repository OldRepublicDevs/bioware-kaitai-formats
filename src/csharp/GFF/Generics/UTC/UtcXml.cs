// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// UTC XML format is a human-readable XML representation of UTC (Creature) binary files.
    /// Uses GFF XML structure with root element &lt;gff3&gt; containing &lt;struct&gt; elements.
    /// Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).
    /// </summary>
    public partial class UtcXml : KaitaiStruct
    {
        public static UtcXml FromFile(string fileName)
        {
            return new UtcXml(new KaitaiStream(fileName));
        }

        public UtcXml(KaitaiStream p__io, KaitaiStruct p__parent = null, UtcXml p__root = null) : base(p__io)
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
        private UtcXml m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// XML document content as UTF-8 text
        /// </summary>
        public string XmlContent { get { return _xmlContent; } }
        public UtcXml M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
