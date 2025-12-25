// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// GFF JSON format is a human-readable JSON representation of GFF (Generic File Format) binary files.
    /// Provides easier editing and interoperability with modern tools than binary GFF format.
    /// </summary>
    public partial class GffJson : KaitaiStruct
    {
        public static GffJson FromFile(string fileName)
        {
            return new GffJson(new KaitaiStream(fileName));
        }

        public GffJson(KaitaiStream p__io, KaitaiStruct p__parent = null, GffJson p__root = null) : base(p__io)
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
        private GffJson m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// JSON document content as UTF-8 text
        /// </summary>
        public string JsonContent { get { return _jsonContent; } }
        public GffJson M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
