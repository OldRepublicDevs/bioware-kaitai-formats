// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// Human-readable XML representation of FAC (Faction) binary files.
    /// Uses GFF XML structure with &lt;gff3&gt; root element.
    /// 
    /// Binary format reference: ../fac/fac.ksy
    /// 
    /// References:
    /// - PyKotor wiki (GFF-FAC.md, GFF-File-Format.md)
    /// </summary>
    public partial class FacXml : KaitaiStruct
    {
        public static FacXml FromFile(string fileName)
        {
            return new FacXml(new KaitaiStream(fileName));
        }

        public FacXml(KaitaiStream p__io, KaitaiStruct p__parent = null, FacXml p__root = null) : base(p__io)
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
        private FacXml m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// XML document content as UTF-8 text
        /// </summary>
        public string XmlContent { get { return _xmlContent; } }
        public FacXml M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
