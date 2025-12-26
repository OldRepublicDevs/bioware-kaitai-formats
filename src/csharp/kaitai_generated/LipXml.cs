// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// LIP XML format is a human-readable XML representation of LIP (Lipsync) binary files.
    /// Provides easier editing than binary LIP format.
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/lip.py
    /// - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/io_lip_xml.py
    /// - https://github.com/seedhartha/reone/tree/master/src/libs/graphics/format/lipreader.cpp
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/LIP-File-Format.md
    /// - https://github.com/xoreos/xoreos/tree/master/src/graphics/aurora/lipfile.cpp
    /// 
    /// - ../GFF/GFF
    /// - ../GFF/XML/GFF_XML
    /// - ../LIP/LIP
    /// </summary>
    public partial class LipXml : KaitaiStruct
    {
        public static LipXml FromFile(string fileName)
        {
            return new LipXml(new KaitaiStream(fileName));
        }

        public LipXml(KaitaiStream p__io, KaitaiStruct p__parent = null, LipXml p__root = null) : base(p__io)
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
        private LipXml m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// XML document content as UTF-8 text
        /// </summary>
        public string XmlContent { get { return _xmlContent; } }
        public LipXml M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
