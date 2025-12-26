// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// Human-readable XML representation of JRL (Journal) binary files.
    /// Uses GFF XML structure with &lt;gff3&gt; root element.
    /// 
    /// Binary format reference: ../jrl/jrl.ksy
    /// 
    /// References:
    /// - PyKotor wiki (GFF-JRL.md, GFF-File-Format.md)
    /// </summary>
    public partial class JrlXml : KaitaiStruct
    {
        public static JrlXml FromFile(string fileName)
        {
            return new JrlXml(new KaitaiStream(fileName));
        }

        public JrlXml(KaitaiStream p__io, KaitaiStruct p__parent = null, JrlXml p__root = null) : base(p__io)
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
        private JrlXml m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// XML document content as UTF-8 text
        /// </summary>
        public string XmlContent { get { return _xmlContent; } }
        public JrlXml M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
