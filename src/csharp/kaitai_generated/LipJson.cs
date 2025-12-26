// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// LIP JSON format is a human-readable JSON representation of LIP (Lipsync) binary files.
    /// Provides easier editing than binary LIP format.
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/io_lip_xml.py
    /// </summary>
    public partial class LipJson : KaitaiStruct
    {
        public static LipJson FromFile(string fileName)
        {
            return new LipJson(new KaitaiStream(fileName));
        }

        public LipJson(KaitaiStream p__io, KaitaiStruct p__parent = null, LipJson p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _jsonContent = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
        }
        private string _jsonContent;
        private LipJson m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// JSON document content as UTF-8 text
        /// </summary>
        public string JsonContent { get { return _jsonContent; } }
        public LipJson M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
