// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// TwoDA CSV format is a human-readable CSV (Comma-Separated Values) representation of TwoDA files.
    /// Provides easier editing in spreadsheet applications than binary TwoDA format.
    /// 
    /// Each row represents a data row, with the first row containing column headers.
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
    /// </summary>
    public partial class TwodaCsv : KaitaiStruct
    {
        public static TwodaCsv FromFile(string fileName)
        {
            return new TwodaCsv(new KaitaiStream(fileName));
        }

        public TwodaCsv(KaitaiStream p__io, KaitaiStruct p__parent = null, TwodaCsv p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _csvContent = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
        }
        private string _csvContent;
        private TwodaCsv m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// CSV text content with rows separated by newlines and columns by commas
        /// </summary>
        public string CsvContent { get { return _csvContent; } }
        public TwodaCsv M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
