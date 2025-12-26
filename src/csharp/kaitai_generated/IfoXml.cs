// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// Human-readable XML representation of IFO (Module Information) binary files.
    /// Uses GFF XML structure with &lt;gff3&gt; root element.
    /// 
    /// Binary format reference: ../ifo/ifo.ksy
    /// 
    /// References:
    /// - PyKotor wiki (GFF-IFO.md, GFF-File-Format.md)
    /// </summary>
    public partial class IfoXml : KaitaiStruct
    {
        public static IfoXml FromFile(string fileName)
        {
            return new IfoXml(new KaitaiStream(fileName));
        }

        public IfoXml(KaitaiStream p__io, KaitaiStruct p__parent = null, IfoXml p__root = null) : base(p__io)
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
        private IfoXml m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// XML document content as UTF-8 text
        /// </summary>
        public string XmlContent { get { return _xmlContent; } }
        public IfoXml M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
