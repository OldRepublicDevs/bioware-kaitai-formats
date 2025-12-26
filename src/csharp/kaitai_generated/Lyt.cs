// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// LYT (Layout) files define how area geometry is assembled from room models and where
    /// interactive elements (doors, tracks, obstacles, art placeables) are positioned.
    /// The game engine uses LYT files to load and position room models (MDL files) and
    /// determine door placement points for area transitions.
    /// 
    /// Format Overview:
    /// - LYT files are ASCII text with a deterministic order
    /// - Structure: beginlayout, optional sections, then donelayout
    /// - Every section declares a count and then lists entries on subsequent lines
    /// - Sections (in order): roomcount, trackcount, obstaclecount, doorhookcount, artplaceablecount, walkmeshRooms
    /// - All sections are optional but must appear in order if present
    /// - Line endings: \n (Unix) or \r\n (Windows)
    /// - Whitespace: Leading/trailing whitespace is typically ignored, tokens separated by space/tab
    /// - Case sensitivity: Room names, door names, and model ResRefs are case-insensitive
    /// 
    /// Complete Syntax:
    /// ```
    /// beginlayout
    /// roomcount &lt;N&gt;
    ///   &lt;room_model&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt;
    /// trackcount &lt;N&gt;
    ///   &lt;track_model&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt;
    /// obstaclecount &lt;N&gt;
    ///   &lt;obstacle_model&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt;
    /// doorhookcount &lt;N&gt;
    ///   &lt;room_name&gt; &lt;door_name&gt; [0] &lt;x&gt; &lt;y&gt; &lt;z&gt; &lt;qx&gt; &lt;qy&gt; &lt;qz&gt; &lt;qw&gt; [optional floats]
    /// artplaceablecount &lt;N&gt;
    ///   &lt;artplaceable_model&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt;
    /// walkmeshRooms &lt;N&gt;
    ///   &lt;room_model&gt;
    /// donelayout
    /// ```
    /// 
    /// Coordinate System:
    /// - Units are meters in the same left-handed coordinate system as MDL models
    /// - Positions (x, y, z) are world-space coordinates
    /// - Quaternions (qx, qy, qz, qw) define door orientation in world space
    /// - Y-axis is typically vertical (up), X and Z form the horizontal plane
    /// 
    /// Room Definitions (roomcount):
    /// - Each room entry specifies a room model (ResRef, max 16 chars, no spaces) and position
    /// - Room models reference MDL/MDX files that define the room geometry
    /// - Room names are case-insensitive for matching purposes
    /// - Format: &lt;room_model&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt;
    /// - Example: &quot;M17mg_01a 100.0 100.0 0.0&quot;
    /// - Rooms are the primary building blocks of area layouts
    /// - Multiple rooms can be placed to create complex area geometry
    /// 
    /// Track Definitions (trackcount):
    /// - Tracks are booster elements used exclusively in swoop racing mini-games (KotOR II)
    /// - Each track entry specifies a track model (ResRef, max 16 chars, no spaces) and position
    /// - Format: &lt;track_model&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt;
    /// - Example: &quot;M17mg_MGT01 0.0 0.0 0.0&quot;
    /// - Optional section - most modules omit this entirely
    /// - Used in racing modules like Telos surface racing
    /// - Each track element represents a booster that provides speed boosts during racing
    /// 
    /// Obstacle Definitions (obstaclecount):
    /// - Obstacles are hazard elements used exclusively in swoop racing mini-games (KotOR II)
    /// - Each obstacle entry specifies an obstacle model (ResRef, max 16 chars, no spaces) and position
    /// - Format: &lt;obstacle_model&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt;
    /// - Example: &quot;M17mg_MGO01 103.309 3691.61 0.0&quot;
    /// - Optional section - most modules omit this entirely
    /// - Used in racing modules to create challenges and obstacles for the player
    /// - Each obstacle element represents a hazard placed along the racing track
    /// 
    /// Door Hook Definitions (doorhookcount):
    /// - Door hooks bind door models to rooms for area transitions
    /// - Format varies by implementation:
    ///   * PyKotor format: &lt;room_name&gt; &lt;door_name&gt; 0 &lt;x&gt; &lt;y&gt; &lt;z&gt; &lt;qx&gt; &lt;qy&gt; &lt;qz&gt; &lt;qw&gt;
    ///   * xoreos format: &lt;room_name&gt; &lt;door_name&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt; &lt;qx&gt; &lt;qy&gt; &lt;qz&gt; &lt;qw&gt; &lt;unk1&gt; &lt;unk2&gt;
    /// - Fields:
    ///   - room_name: Target room name (must match a roomcount entry, case-insensitive)
    ///   - door_name: Hook identifier (used in module files to reference this door, case-insensitive)
    ///   - 0: Reserved field (PyKotor format only, always 0, skipped during parsing)
    ///   - x, y, z: Position of door origin in world space (float, meters)
    ///   - qx, qy, qz, qw: Quaternion orientation for door rotation (float)
    ///   - unk1, unk2: Unknown float values (xoreos format only, typically 0.0)
    /// - Example (PyKotor): &quot;M02ac_02h door_01 0 170.475 66.375 0.0 0.707107 0.0 0.0 -0.707107&quot;
    /// - Example (xoreos): &quot;Room01 Door01 10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0&quot;
    /// - Door hooks define where doors are placed in rooms to create area transitions
    /// - The quaternion (qx, qy, qz, qw) defines the door's orientation in world space
    /// - Door hooks are separate from BWM hooks - BWM hooks define interaction points,
    ///   while LYT doorhooks define door placement positions
    /// 
    /// Art Placeable Definitions (artplaceablecount):
    /// - Art placeables are decorative elements that can be placed in areas
    /// - Format: &lt;artplaceable_model&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt;
    /// - Each entry specifies an art placeable model (ResRef, max 16 chars, no spaces) and position
    /// - Optional section - supported by xoreos, not all implementations support this
    /// - Used for decorative elements that don't affect gameplay
    /// - Example: &quot;AP01 20.0 21.0 22.0&quot;
    /// 
    /// Walkmesh Rooms (walkmeshRooms):
    /// - Walkmesh rooms section is only relevant for Jade Engine (Dragon Age, Mass Effect)
    /// - Format: &lt;room_model&gt; (one per line, no position data)
    /// - Each entry specifies a room model that has walkmesh data
    /// - Optional section - KotOR implementations typically ignore this
    /// - Marks rooms that contain walkmesh geometry for pathfinding
    /// - Example: &quot;WMRoom01&quot;
    /// - When present, sets the canWalk flag on matching room entries
    /// 
    /// Implementation Differences:
    /// - PyKotor: Reads doorhooks with &quot;0&quot; field (10 tokens: room, door, 0, x, y, z, qx, qy, qz, qw)
    /// - xoreos: Reads doorhooks without &quot;0&quot; field (10 tokens: room, door, x, y, z, qx, qy, qz, qw, unk1, unk2)
    /// - reone: Only supports roomcount section (simplified implementation)
    /// - Most implementations support: roomcount, trackcount, obstaclecount, doorhookcount
    /// - xoreos additionally supports: artplaceablecount, walkmeshRooms
    /// 
    /// File Structure Details:
    /// - Header: &quot;beginlayout&quot; (required, case-sensitive)
    /// - Footer: &quot;donelayout&quot; (required, case-sensitive)
    /// - Section keywords: &quot;roomcount&quot;, &quot;trackcount&quot;, &quot;obstaclecount&quot;, &quot;doorhookcount&quot;, &quot;artplaceablecount&quot;, &quot;walkmeshRooms&quot; (case-sensitive)
    /// - Indentation: Some implementations use indentation (typically 3 spaces) for entries, but it's not required
    /// - Empty lines: Ignored by all implementations
    /// - Comments: Not officially supported, but some implementations may skip lines starting with #
    /// 
    /// Relationship to Other Formats:
    /// - MDL/MDX: Room models referenced by ResRef in roomcount entries
    /// - BWM: Walkmeshes loaded alongside LYT rooms, door hooks may reference BWM transition points
    /// - VIS: Visibility graph for areas with LYT rooms, controls which rooms are visible
    /// - ARE: Area files that load LYT layouts to assemble the area geometry
    /// 
    /// All implementations (reone, xoreos, KotOR.js, Kotor.NET)
    /// parse identical tokens for the core sections. KotOR-Unity mirrors the same structure.
    /// xoreos extends the format with additional sections for Jade Engine compatibility.
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/LYT-File-Format.md - Complete format documentation
    /// - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/lytreader.cpp:37-77 - Room parsing implementation
    /// - https://github.com/xoreos/xoreos/blob/master/src/aurora/lytfile.cpp:98-200 - Complete parser with all sections
    /// - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/lyt/io_lyt.py:17-165 - PyKotor parser/writer
    /// </summary>
    public partial class Lyt : KaitaiStruct
    {
        public static Lyt FromFile(string fileName)
        {
            return new Lyt(new KaitaiStream(fileName));
        }

        public Lyt(KaitaiStream p__io, KaitaiStruct p__parent = null, Lyt p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _rawContent = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesFull());
        }

        /// <summary>
        /// A single art placeable entry in the artplaceablecount section.
        /// Format: &lt;artplaceable_model&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt;
        /// 
        /// Fields:
        /// - artplaceable_model: ResRef of the art placeable model (MDL file, max 16 chars, no spaces, case-insensitive)
        /// - x: X coordinate in world space (float, meters)
        /// - y: Y coordinate in world space (float, meters)
        /// - z: Z coordinate in world space (float, meters)
        /// 
        /// Art placeables are decorative elements that can be placed in areas.
        /// This section is optional - supported by xoreos, not all implementations support this.
        /// Used for decorative elements that don't affect gameplay or collision.
        /// 
        /// Example: &quot;AP01 20.0 21.0 22.0&quot;
        /// 
        /// Reference: https://github.com/xoreos/xoreos/blob/master/src/aurora/lytfile.cpp:120-139
        /// </summary>
        public partial class ArtplaceableEntry : KaitaiStruct
        {
            public static ArtplaceableEntry FromFile(string fileName)
            {
                return new ArtplaceableEntry(new KaitaiStream(fileName));
            }

            public ArtplaceableEntry(KaitaiStream p__io, KaitaiStruct p__parent = null, Lyt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
            }
            private Lyt m_root;
            private KaitaiStruct m_parent;
            public Lyt M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// A single doorhook entry in the doorhookcount section (PyKotor format).
        /// Format: &lt;room_name&gt; &lt;door_name&gt; 0 &lt;x&gt; &lt;y&gt; &lt;z&gt; &lt;qx&gt; &lt;qy&gt; &lt;qz&gt; &lt;qw&gt;
        /// 
        /// Fields:
        /// - room_name: Target room name (must match a roomcount entry, case-insensitive, max 16 chars)
        /// - door_name: Hook identifier (used in module files to reference this door, case-insensitive, max 16 chars)
        /// - 0: Reserved field, always 0, skipped during parsing (tokens[2])
        /// - x: X coordinate of door origin in world space (float, meters)
        /// - y: Y coordinate of door origin in world space (float, meters)
        /// - z: Z coordinate of door origin in world space (float, meters)
        /// - qx: X component of quaternion orientation (float)
        /// - qy: Y component of quaternion orientation (float)
        /// - qz: Z component of quaternion orientation (float)
        /// - qw: W component of quaternion orientation (float)
        /// 
        /// Door hooks define where doors are placed in rooms to create area transitions.
        /// The quaternion (qx, qy, qz, qw) defines the door's orientation in world space.
        /// Door hooks are separate from BWM hooks - BWM hooks define interaction points,
        /// while LYT doorhooks define door placement positions.
        /// 
        /// Example: &quot;M02ac_02h door_01 0 170.475 66.375 0.0 0.707107 0.0 0.0 -0.707107&quot;
        /// 
        /// Reference: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/lyt/io_lyt.py:97-113
        /// </summary>
        public partial class DoorhookEntryPykotor : KaitaiStruct
        {
            public static DoorhookEntryPykotor FromFile(string fileName)
            {
                return new DoorhookEntryPykotor(new KaitaiStream(fileName));
            }

            public DoorhookEntryPykotor(KaitaiStream p__io, KaitaiStruct p__parent = null, Lyt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
            }
            private Lyt m_root;
            private KaitaiStruct m_parent;
            public Lyt M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// A single doorhook entry in the doorhookcount section (xoreos format).
        /// Format: &lt;room_name&gt; &lt;door_name&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt; &lt;qx&gt; &lt;qy&gt; &lt;qz&gt; &lt;qw&gt; &lt;unk1&gt; &lt;unk2&gt;
        /// 
        /// Fields:
        /// - room_name: Target room name (must match a roomcount entry, case-insensitive, max 16 chars)
        /// - door_name: Hook identifier (used in module files to reference this door, case-insensitive, max 16 chars)
        /// - x: X coordinate of door origin in world space (float, meters)
        /// - y: Y coordinate of door origin in world space (float, meters)
        /// - z: Z coordinate of door origin in world space (float, meters)
        /// - qx: X component of quaternion orientation (float)
        /// - qy: Y component of quaternion orientation (float)
        /// - qz: Z component of quaternion orientation (float)
        /// - qw: W component of quaternion orientation (float)
        /// - unk1: Unknown float value (typically 0.0, purpose unknown)
        /// - unk2: Unknown float value (typically 0.0, purpose unknown)
        /// 
        /// This format does not include the &quot;0&quot; reserved field present in PyKotor format.
        /// xoreos expects exactly 10 tokens per doorhook entry.
        /// 
        /// Example: &quot;Room01 Door01 10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0&quot;
        /// 
        /// Reference: https://github.com/xoreos/xoreos/blob/master/src/aurora/lytfile.cpp:161-187
        /// </summary>
        public partial class DoorhookEntryXoreos : KaitaiStruct
        {
            public static DoorhookEntryXoreos FromFile(string fileName)
            {
                return new DoorhookEntryXoreos(new KaitaiStream(fileName));
            }

            public DoorhookEntryXoreos(KaitaiStream p__io, KaitaiStruct p__parent = null, Lyt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
            }
            private Lyt m_root;
            private KaitaiStruct m_parent;
            public Lyt M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// A single obstacle entry in the obstaclecount section.
        /// Format: &lt;obstacle_model&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt;
        /// 
        /// Fields:
        /// - obstacle_model: ResRef of the obstacle model (MDL file, max 16 chars, no spaces, case-insensitive)
        /// - x: X coordinate in world space (float, meters)
        /// - y: Y coordinate in world space (float, meters)
        /// - z: Z coordinate in world space (float, meters)
        /// 
        /// Obstacles are hazard elements used exclusively in swoop racing mini-games (KotOR II).
        /// This section is optional - most modules omit it entirely.
        /// Used in racing modules to create challenges and obstacles for the player.
        /// Each obstacle element represents a hazard placed along the racing track.
        /// 
        /// Example: &quot;M17mg_MGO01 103.309 3691.61 0.0&quot;
        /// </summary>
        public partial class ObstacleEntry : KaitaiStruct
        {
            public static ObstacleEntry FromFile(string fileName)
            {
                return new ObstacleEntry(new KaitaiStream(fileName));
            }

            public ObstacleEntry(KaitaiStream p__io, KaitaiStruct p__parent = null, Lyt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
            }
            private Lyt m_root;
            private KaitaiStruct m_parent;
            public Lyt M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// A single room entry in the roomcount section.
        /// Format: &lt;room_model&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt;
        /// 
        /// Fields:
        /// - room_model: ResRef of the room model (MDL/MDX file, max 16 chars, no spaces, case-insensitive)
        /// - x: X coordinate in world space (float, meters)
        /// - y: Y coordinate in world space (float, meters)
        /// - z: Z coordinate in world space (float, meters)
        /// 
        /// Room models reference MDL/MDX files that define the room geometry.
        /// Room names are case-insensitive for matching purposes.
        /// Multiple rooms can be placed to create complex area layouts.
        /// 
        /// Example: &quot;M17mg_01a 100.0 100.0 0.0&quot;
        /// </summary>
        public partial class RoomEntry : KaitaiStruct
        {
            public static RoomEntry FromFile(string fileName)
            {
                return new RoomEntry(new KaitaiStream(fileName));
            }

            public RoomEntry(KaitaiStream p__io, KaitaiStruct p__parent = null, Lyt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
            }
            private Lyt m_root;
            private KaitaiStruct m_parent;
            public Lyt M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// A single track entry in the trackcount section.
        /// Format: &lt;track_model&gt; &lt;x&gt; &lt;y&gt; &lt;z&gt;
        /// 
        /// Fields:
        /// - track_model: ResRef of the track booster model (MDL file, max 16 chars, no spaces, case-insensitive)
        /// - x: X coordinate in world space (float, meters)
        /// - y: Y coordinate in world space (float, meters)
        /// - z: Z coordinate in world space (float, meters)
        /// 
        /// Tracks are booster elements used exclusively in swoop racing mini-games (KotOR II).
        /// This section is optional - most modules omit it entirely.
        /// Used in racing modules like Telos surface racing.
        /// Each track element represents a booster that provides speed boosts during racing.
        /// 
        /// Example: &quot;M17mg_MGT01 0.0 0.0 0.0&quot;
        /// </summary>
        public partial class TrackEntry : KaitaiStruct
        {
            public static TrackEntry FromFile(string fileName)
            {
                return new TrackEntry(new KaitaiStream(fileName));
            }

            public TrackEntry(KaitaiStream p__io, KaitaiStruct p__parent = null, Lyt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
            }
            private Lyt m_root;
            private KaitaiStruct m_parent;
            public Lyt M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// A single walkmesh room entry in the walkmeshRooms section.
        /// Format: &lt;room_model&gt;
        /// 
        /// Fields:
        /// - room_model: ResRef of the room model (must match a roomcount entry, case-insensitive, max 16 chars)
        /// 
        /// Walkmesh rooms section is only relevant for Jade Engine (Dragon Age, Mass Effect).
        /// This section is optional - KotOR implementations typically ignore this.
        /// Marks rooms that contain walkmesh geometry for pathfinding.
        /// When present, sets the canWalk flag on matching room entries.
        /// 
        /// Example: &quot;WMRoom01&quot;
        /// 
        /// Reference: https://github.com/xoreos/xoreos/blob/master/src/aurora/lytfile.cpp:141-159
        /// </summary>
        public partial class WalkmeshRoomEntry : KaitaiStruct
        {
            public static WalkmeshRoomEntry FromFile(string fileName)
            {
                return new WalkmeshRoomEntry(new KaitaiStream(fileName));
            }

            public WalkmeshRoomEntry(KaitaiStream p__io, KaitaiStruct p__parent = null, Lyt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
            }
            private Lyt m_root;
            private KaitaiStruct m_parent;
            public Lyt M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        private string _rawContent;
        private Lyt m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Raw ASCII text content of the entire LYT file.
        /// This Kaitai implementation captures the raw text for application-level parsing.
        /// Application code should parse this line-by-line to extract structured data.
        /// 
        /// Reference implementation:
        /// https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/lyt/io_lyt.py
        /// </summary>
        public string RawContent { get { return _rawContent; } }
        public Lyt M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
