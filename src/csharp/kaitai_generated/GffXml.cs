// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// GFF XML format is a human-readable XML representation of GFF (Generic File Format) binary files.
    /// Used by xoreos-tools and other modding tools for easier editing than binary GFF format.
    /// 
    /// The XML format represents the hierarchical GFF structure using XML elements:
    /// - Root element: &lt;gff3&gt;
    /// - Contains a &lt;struct&gt; element with id attribute
    /// - Struct contains field elements (byte, uint32, exostring, locstring, resref, list, etc.)
    /// - Each field has a label attribute
    /// - Lists contain nested &lt;struct&gt; elements
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
    /// - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffdumper.cpp
    /// - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffcreator.cpp
    /// </summary>
    public partial class GffXml : KaitaiStruct
    {
        public static GffXml FromFile(string fileName)
        {
            return new GffXml(new KaitaiStream(fileName));
        }

        public GffXml(KaitaiStream p__io, KaitaiStruct p__parent = null, GffXml p__root = null) : base(p__io)
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
        private GffXml m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// XML document content as UTF-8 text.
        /// Structure: &lt;gff3&gt;&lt;struct id=&quot;...&quot;&gt;...&lt;/struct&gt;&lt;/gff3&gt;
        /// Note: Kaitai Struct has limited XML parsing capabilities. For full XML parsing,
        /// use an XML parser library. This definition serves as a format identifier.
        /// </summary>
        public string XmlContent { get { return _xmlContent; } }
        public GffXml M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
