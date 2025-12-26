// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// VIS (Visibility) files describe which module rooms can be seen from other rooms.
    /// They drive the engine's occlusion culling so that only geometry visible from the
    /// player's current room is rendered, reducing draw calls and overdraw.
    /// 
    /// Format Overview:
    /// - VIS files are plain ASCII text
    /// - Each parent room line lists how many child rooms follow
    /// - Child room lines are indented by two spaces
    /// - Empty lines are ignored and names are case-insensitive
    /// - Files usually ship as moduleXXX.vis pairs
    /// 
    /// File Layout:
    /// - Parent Lines: &quot;ROOM_NAME CHILD_COUNT&quot;
    /// - Child Lines: &quot;  ROOM_NAME&quot; (indented with 2 spaces)
    /// - Version headers (e.g., &quot;room V3.28&quot;) are skipped
    /// - Empty lines are ignored
    /// 
    /// Example:
    /// ```
    /// room012 3
    ///   room013
    ///   room014
    ///   room015
    /// ```
    /// 
    /// Parsing Rules:
    /// 1. Lines are processed sequentially
    /// 2. Empty lines (whitespace only) are ignored
    /// 3. Version header lines (second token starts with &quot;V&quot;) are skipped
    /// 4. Parent lines contain room name and child count (e.g., &quot;room012 3&quot;)
    /// 5. Child lines are indented with 2 spaces and contain room name
    /// 6. After a parent line, exactly CHILD_COUNT child lines must follow
    /// 7. Room names are case-insensitive (stored lowercase)
    /// 
    /// Runtime Behavior:
    /// - When the player stands in room A, the engine renders any room listed under A
    /// - VIS files only control visibility; collision and pathfinding rely on walkmeshes
    /// - Editing VIS entries is a common optimization for performance
    /// - Missing VIS files cause all rooms to render (performance impact)
    /// 
    /// Performance Impact:
    /// - Without VIS: Engine renders all rooms, even those behind walls/doors
    /// - With VIS: Only visible rooms are submitted to the renderer (10-50x fewer draw calls)
    /// - Overly restrictive VIS: Causes pop-in where rooms suddenly appear
    /// - Too permissive VIS: Wastes GPU resources rendering unseen geometry
    /// 
    /// Common Issues:
    /// - Missing Room: Room not in any VIS list → never renders → appears invisible
    /// - One-way Visibility: Room A lists B, but B doesn't list A → asymmetric rendering
    /// - Performance Problems: All rooms list each other → defeats purpose of VIS optimization
    /// - Doorway Artifacts: Door rooms not mutually visible → walls clip during door animations
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/VIS-File-Format.md
    /// - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/visreader.cpp
    /// - https://github.com/xoreos/xoreos/blob/master/src/aurora/visfile.cpp
    /// - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/vis/io_vis.py:14-87
    /// - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/vis/vis_data.py:52-294
    /// </summary>
    public partial class Vis : KaitaiStruct
    {
        public static Vis FromFile(string fileName)
        {
            return new Vis(new KaitaiStream(fileName));
        }

        public Vis(KaitaiStream p__io, KaitaiStruct p__parent = null, Vis p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _rawContent = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesFull());
        }
        private string _rawContent;
        private Vis m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Raw ASCII text content of the entire VIS file.
        /// The generated C# code parses this text into structured VIS entries
        /// by splitting on newlines and processing each line according to the
        /// VIS format specification (parent lines with child counts, indented
        /// child lines, empty lines, version headers).
        /// 
        /// Application code should:
        /// 1. Split raw_content by newlines (\r\n, \n, or \r)
        /// 2. Skip empty lines (whitespace only)
        /// 3. Skip version header lines (second token starts with &quot;V&quot;)
        /// 4. Parse parent lines: &quot;ROOM_NAME CHILD_COUNT&quot;
        /// 5. Parse child lines: &quot;  ROOM_NAME&quot; (indented with 2 spaces)
        /// 6. Validate that CHILD_COUNT child lines follow each parent line
        /// 7. Store room names in lowercase for case-insensitive comparison
        /// 
        /// See VISAsciiReader.cs for reference implementation matching
        /// https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/vis/io_vis.py:14-73.
        /// </summary>
        public string RawContent { get { return _rawContent; } }
        public Vis M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
