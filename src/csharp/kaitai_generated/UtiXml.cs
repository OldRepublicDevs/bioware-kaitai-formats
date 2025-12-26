// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// Human-readable XML representation of UTI (Item Template) binary files.
    /// Uses GFF XML structure with &lt;gff3&gt; root element.
    /// 
    /// Binary format reference: ../uti/uti.ksy
    /// 
    /// References:
    /// - PyKotor wiki (GFF-UTI.md, GFF-File-Format.md)
    /// </summary>
    public partial class UtiXml : KaitaiStruct
    {
        public static UtiXml FromFile(string fileName)
        {
            return new UtiXml(new KaitaiStream(fileName));
        }

        public UtiXml(KaitaiStream p__io, KaitaiStruct p__parent = null, UtiXml p__root = null) : base(p__io)
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
        private UtiXml m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// XML document content as UTF-8 text
        /// </summary>
        public string XmlContent { get { return _xmlContent; } }
        public UtiXml M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
