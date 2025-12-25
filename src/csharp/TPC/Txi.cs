// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// TXI (Texture Info) files are ASCII text files that provide metadata for TPC textures.
    /// They specify rendering properties (blending modes, mipmaps, filtering), companion textures
    /// (bump maps, environment maps), font metrics for bitmap fonts, and animation parameters
    /// for flipbook textures.
    /// 
    /// Format Overview:
    /// - TXI files are plain-text key/value lists
    /// - Commands are case-insensitive but conventionally lowercase
    /// - Values can be integers, floats, booleans (0/1), strings, or multi-line coordinate tables
    /// - A single TXI can be appended to the end of a .tpc file or shipped as a sibling .txi file
    /// 
    /// References:
    /// - vendor/PyKotor/wiki/TXI-File-Format.md
    /// - vendor/reone/src/libs/graphics/format/txireader.cpp
    /// - vendor/xoreos/src/graphics/images/txi.cpp
    /// </summary>
    public partial class Txi : KaitaiStruct
    {
        public static Txi FromFile(string fileName)
        {
            return new Txi(new KaitaiStream(fileName));
        }

        public Txi(KaitaiStream p__io, KaitaiStruct p__parent = null, Txi p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _content = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesFull());
        }
        private string _content;
        private Txi m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Complete TXI file content as ASCII text.
        /// Contains line-based command/value pairs that should be parsed by application code.
        /// 
        /// Common commands include:
        /// - mipmap &lt;0|1&gt;
        /// - blending &lt;default|additive|punchthrough&gt;
        /// - filter &lt;0|1&gt;
        /// - decal &lt;0|1&gt;
        /// - cube &lt;0|1&gt;
        /// - proceduretype &lt;cycle&gt;
        /// - numx &lt;count&gt;
        /// - numy &lt;count&gt;
        /// - fps &lt;float&gt;
        /// - And many more...
        /// 
        /// Coordinate blocks (upperleftcoords, lowerrightcoords) use multi-line format:
        /// upperleftcoords &lt;count&gt;
        /// &lt;u&gt; &lt;v&gt; &lt;z&gt;
        /// &lt;u&gt; &lt;v&gt; &lt;z&gt;
        /// ...
        /// </summary>
        public string Content { get { return _content; } }
        public Txi M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
