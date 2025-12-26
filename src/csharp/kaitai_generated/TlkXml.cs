// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// TLK XML format is a human-readable XML representation of TLK (Talk Table) binary files.
    /// Provides easier editing and translation than binary TLK format.
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/tlk.py
    /// - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/io_tlk_xml.py
    /// - https://github.com/seedhartha/reone/tree/master/src/libs/resource/format/tlkreader.cpp
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/TLK-File-Format.md
    /// - https://github.com/xoreos/xoreos/tree/master/src/aurora/talktable.cpp
    /// 
    /// - ../GFF/GFF
    /// - ../GFF/XML/GFF_XML
    /// - ../TLK/TLK
    /// </summary>
    public partial class TlkXml : KaitaiStruct
    {
        public static TlkXml FromFile(string fileName)
        {
            return new TlkXml(new KaitaiStream(fileName));
        }

        public TlkXml(KaitaiStream p__io, KaitaiStruct p__parent = null, TlkXml p__root = null) : base(p__io)
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
        private TlkXml m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// XML document content as UTF-8 text
        /// </summary>
        public string XmlContent { get { return _xmlContent; } }
        public TlkXml M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
