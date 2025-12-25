// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// TwoDA JSON format is a human-readable JSON representation of TwoDA files.
    /// Provides easier editing and interoperability with modern tools than binary TwoDA format.
    /// </summary>
    public partial class TwodaJson : KaitaiStruct
    {
        public static TwodaJson FromFile(string fileName)
        {
            return new TwodaJson(new KaitaiStream(fileName));
        }

        public TwodaJson(KaitaiStream p__io, KaitaiStruct p__parent = null, TwodaJson p__root = null) : base(p__io)
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
        private TwodaJson m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// JSON document content as UTF-8 text
        /// </summary>
        public string JsonContent { get { return _jsonContent; } }
        public TwodaJson M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
