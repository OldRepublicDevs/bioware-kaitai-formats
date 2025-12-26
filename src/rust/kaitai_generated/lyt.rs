// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#![allow(unused_imports)]
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(irrefutable_let_patterns)]
#![allow(unused_comparisons)]

extern crate kaitai;
use kaitai::*;
use std::convert::{TryFrom, TryInto};
use std::cell::{Ref, Cell, RefCell};
use std::rc::{Rc, Weak};

/**
 * LYT (Layout) files define how area geometry is assembled from room models and where
 * interactive elements (doors, tracks, obstacles, art placeables) are positioned.
 * The game engine uses LYT files to load and position room models (MDL files) and
 * determine door placement points for area transitions.
 * 
 * Format Overview:
 * - LYT files are ASCII text with a deterministic order
 * - Structure: beginlayout, optional sections, then donelayout
 * - Every section declares a count and then lists entries on subsequent lines
 * - Sections (in order): roomcount, trackcount, obstaclecount, doorhookcount, artplaceablecount, walkmeshRooms
 * - All sections are optional but must appear in order if present
 * - Line endings: \n (Unix) or \r\n (Windows)
 * - Whitespace: Leading/trailing whitespace is typically ignored, tokens separated by space/tab
 * - Case sensitivity: Room names, door names, and model ResRefs are case-insensitive
 * 
 * Complete Syntax:
 * ```
 * beginlayout
 * roomcount <N>
 *   <room_model> <x> <y> <z>
 * trackcount <N>
 *   <track_model> <x> <y> <z>
 * obstaclecount <N>
 *   <obstacle_model> <x> <y> <z>
 * doorhookcount <N>
 *   <room_name> <door_name> [0] <x> <y> <z> <qx> <qy> <qz> <qw> [optional floats]
 * artplaceablecount <N>
 *   <artplaceable_model> <x> <y> <z>
 * walkmeshRooms <N>
 *   <room_model>
 * donelayout
 * ```
 * 
 * Coordinate System:
 * - Units are meters in the same left-handed coordinate system as MDL models
 * - Positions (x, y, z) are world-space coordinates
 * - Quaternions (qx, qy, qz, qw) define door orientation in world space
 * - Y-axis is typically vertical (up), X and Z form the horizontal plane
 * 
 * Room Definitions (roomcount):
 * - Each room entry specifies a room model (ResRef, max 16 chars, no spaces) and position
 * - Room models reference MDL/MDX files that define the room geometry
 * - Room names are case-insensitive for matching purposes
 * - Format: <room_model> <x> <y> <z>
 * - Example: "M17mg_01a 100.0 100.0 0.0"
 * - Rooms are the primary building blocks of area layouts
 * - Multiple rooms can be placed to create complex area geometry
 * 
 * Track Definitions (trackcount):
 * - Tracks are booster elements used exclusively in swoop racing mini-games (KotOR II)
 * - Each track entry specifies a track model (ResRef, max 16 chars, no spaces) and position
 * - Format: <track_model> <x> <y> <z>
 * - Example: "M17mg_MGT01 0.0 0.0 0.0"
 * - Optional section - most modules omit this entirely
 * - Used in racing modules like Telos surface racing
 * - Each track element represents a booster that provides speed boosts during racing
 * 
 * Obstacle Definitions (obstaclecount):
 * - Obstacles are hazard elements used exclusively in swoop racing mini-games (KotOR II)
 * - Each obstacle entry specifies an obstacle model (ResRef, max 16 chars, no spaces) and position
 * - Format: <obstacle_model> <x> <y> <z>
 * - Example: "M17mg_MGO01 103.309 3691.61 0.0"
 * - Optional section - most modules omit this entirely
 * - Used in racing modules to create challenges and obstacles for the player
 * - Each obstacle element represents a hazard placed along the racing track
 * 
 * Door Hook Definitions (doorhookcount):
 * - Door hooks bind door models to rooms for area transitions
 * - Format varies by implementation:
 *   * PyKotor format: <room_name> <door_name> 0 <x> <y> <z> <qx> <qy> <qz> <qw>
 *   * xoreos format: <room_name> <door_name> <x> <y> <z> <qx> <qy> <qz> <qw> <unk1> <unk2>
 * - Fields:
 *   - room_name: Target room name (must match a roomcount entry, case-insensitive)
 *   - door_name: Hook identifier (used in module files to reference this door, case-insensitive)
 *   - 0: Reserved field (PyKotor format only, always 0, skipped during parsing)
 *   - x, y, z: Position of door origin in world space (float, meters)
 *   - qx, qy, qz, qw: Quaternion orientation for door rotation (float)
 *   - unk1, unk2: Unknown float values (xoreos format only, typically 0.0)
 * - Example (PyKotor): "M02ac_02h door_01 0 170.475 66.375 0.0 0.707107 0.0 0.0 -0.707107"
 * - Example (xoreos): "Room01 Door01 10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0"
 * - Door hooks define where doors are placed in rooms to create area transitions
 * - The quaternion (qx, qy, qz, qw) defines the door's orientation in world space
 * - Door hooks are separate from BWM hooks - BWM hooks define interaction points,
 *   while LYT doorhooks define door placement positions
 * 
 * Art Placeable Definitions (artplaceablecount):
 * - Art placeables are decorative elements that can be placed in areas
 * - Format: <artplaceable_model> <x> <y> <z>
 * - Each entry specifies an art placeable model (ResRef, max 16 chars, no spaces) and position
 * - Optional section - supported by xoreos, not all implementations support this
 * - Used for decorative elements that don't affect gameplay
 * - Example: "AP01 20.0 21.0 22.0"
 * 
 * Walkmesh Rooms (walkmeshRooms):
 * - Walkmesh rooms section is only relevant for Jade Engine (Dragon Age, Mass Effect)
 * - Format: <room_model> (one per line, no position data)
 * - Each entry specifies a room model that has walkmesh data
 * - Optional section - KotOR implementations typically ignore this
 * - Marks rooms that contain walkmesh geometry for pathfinding
 * - Example: "WMRoom01"
 * - When present, sets the canWalk flag on matching room entries
 * 
 * Implementation Differences:
 * - PyKotor: Reads doorhooks with "0" field (10 tokens: room, door, 0, x, y, z, qx, qy, qz, qw)
 * - xoreos: Reads doorhooks without "0" field (10 tokens: room, door, x, y, z, qx, qy, qz, qw, unk1, unk2)
 * - reone: Only supports roomcount section (simplified implementation)
 * - Most implementations support: roomcount, trackcount, obstaclecount, doorhookcount
 * - xoreos additionally supports: artplaceablecount, walkmeshRooms
 * 
 * File Structure Details:
 * - Header: "beginlayout" (required, case-sensitive)
 * - Footer: "donelayout" (required, case-sensitive)
 * - Section keywords: "roomcount", "trackcount", "obstaclecount", "doorhookcount", "artplaceablecount", "walkmeshRooms" (case-sensitive)
 * - Indentation: Some implementations use indentation (typically 3 spaces) for entries, but it's not required
 * - Empty lines: Ignored by all implementations
 * - Comments: Not officially supported, but some implementations may skip lines starting with #
 * 
 * Relationship to Other Formats:
 * - MDL/MDX: Room models referenced by ResRef in roomcount entries
 * - BWM: Walkmeshes loaded alongside LYT rooms, door hooks may reference BWM transition points
 * - VIS: Visibility graph for areas with LYT rooms, controls which rooms are visible
 * - ARE: Area files that load LYT layouts to assemble the area geometry
 * 
 * All implementations (reone, xoreos, KotOR.js, Kotor.NET)
 * parse identical tokens for the core sections. KotOR-Unity mirrors the same structure.
 * xoreos extends the format with additional sections for Jade Engine compatibility.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/LYT-File-Format.md - Complete format documentation
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/lytreader.cpp:37-77 - Room parsing implementation
 * - https://github.com/xoreos/xoreos/blob/master/src/aurora/lytfile.cpp:98-200 - Complete parser with all sections
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/lyt/io_lyt.py:17-165 - PyKotor parser/writer
 */

#[derive(Default, Debug, Clone)]
pub struct Lyt {
    pub _root: SharedType<Lyt>,
    pub _parent: SharedType<Lyt>,
    pub _self: SharedType<Self>,
    raw_content: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lyt {
    type Root = Lyt;
    type Parent = Lyt;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.raw_content.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "ASCII")?;
        Ok(())
    }
}
impl Lyt {
}

/**
 * Raw ASCII text content of the entire LYT file.
 * This Kaitai implementation captures the raw text for application-level parsing.
 * Application code should parse this line-by-line to extract structured data.
 * 
 * Reference implementation:
 * https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/lyt/io_lyt.py
 */
impl Lyt {
    pub fn raw_content(&self) -> Ref<'_, String> {
        self.raw_content.borrow()
    }
}
impl Lyt {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A single art placeable entry in the artplaceablecount section.
 * Format: <artplaceable_model> <x> <y> <z>
 * 
 * Fields:
 * - artplaceable_model: ResRef of the art placeable model (MDL file, max 16 chars, no spaces, case-insensitive)
 * - x: X coordinate in world space (float, meters)
 * - y: Y coordinate in world space (float, meters)
 * - z: Z coordinate in world space (float, meters)
 * 
 * Art placeables are decorative elements that can be placed in areas.
 * This section is optional - supported by xoreos, not all implementations support this.
 * Used for decorative elements that don't affect gameplay or collision.
 * 
 * Example: "AP01 20.0 21.0 22.0"
 * 
 * Reference: https://github.com/xoreos/xoreos/blob/master/src/aurora/lytfile.cpp:120-139
 */

#[derive(Default, Debug, Clone)]
pub struct Lyt_ArtplaceableEntry {
    pub _root: SharedType<Lyt>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lyt_ArtplaceableEntry {
    type Root = Lyt;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        Ok(())
    }
}
impl Lyt_ArtplaceableEntry {
}
impl Lyt_ArtplaceableEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A single doorhook entry in the doorhookcount section (PyKotor format).
 * Format: <room_name> <door_name> 0 <x> <y> <z> <qx> <qy> <qz> <qw>
 * 
 * Fields:
 * - room_name: Target room name (must match a roomcount entry, case-insensitive, max 16 chars)
 * - door_name: Hook identifier (used in module files to reference this door, case-insensitive, max 16 chars)
 * - 0: Reserved field, always 0, skipped during parsing (tokens[2])
 * - x: X coordinate of door origin in world space (float, meters)
 * - y: Y coordinate of door origin in world space (float, meters)
 * - z: Z coordinate of door origin in world space (float, meters)
 * - qx: X component of quaternion orientation (float)
 * - qy: Y component of quaternion orientation (float)
 * - qz: Z component of quaternion orientation (float)
 * - qw: W component of quaternion orientation (float)
 * 
 * Door hooks define where doors are placed in rooms to create area transitions.
 * The quaternion (qx, qy, qz, qw) defines the door's orientation in world space.
 * Door hooks are separate from BWM hooks - BWM hooks define interaction points,
 * while LYT doorhooks define door placement positions.
 * 
 * Example: "M02ac_02h door_01 0 170.475 66.375 0.0 0.707107 0.0 0.0 -0.707107"
 * 
 * Reference: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/lyt/io_lyt.py:97-113
 */

#[derive(Default, Debug, Clone)]
pub struct Lyt_DoorhookEntryPykotor {
    pub _root: SharedType<Lyt>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lyt_DoorhookEntryPykotor {
    type Root = Lyt;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        Ok(())
    }
}
impl Lyt_DoorhookEntryPykotor {
}
impl Lyt_DoorhookEntryPykotor {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A single doorhook entry in the doorhookcount section (xoreos format).
 * Format: <room_name> <door_name> <x> <y> <z> <qx> <qy> <qz> <qw> <unk1> <unk2>
 * 
 * Fields:
 * - room_name: Target room name (must match a roomcount entry, case-insensitive, max 16 chars)
 * - door_name: Hook identifier (used in module files to reference this door, case-insensitive, max 16 chars)
 * - x: X coordinate of door origin in world space (float, meters)
 * - y: Y coordinate of door origin in world space (float, meters)
 * - z: Z coordinate of door origin in world space (float, meters)
 * - qx: X component of quaternion orientation (float)
 * - qy: Y component of quaternion orientation (float)
 * - qz: Z component of quaternion orientation (float)
 * - qw: W component of quaternion orientation (float)
 * - unk1: Unknown float value (typically 0.0, purpose unknown)
 * - unk2: Unknown float value (typically 0.0, purpose unknown)
 * 
 * This format does not include the "0" reserved field present in PyKotor format.
 * xoreos expects exactly 10 tokens per doorhook entry.
 * 
 * Example: "Room01 Door01 10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0"
 * 
 * Reference: https://github.com/xoreos/xoreos/blob/master/src/aurora/lytfile.cpp:161-187
 */

#[derive(Default, Debug, Clone)]
pub struct Lyt_DoorhookEntryXoreos {
    pub _root: SharedType<Lyt>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lyt_DoorhookEntryXoreos {
    type Root = Lyt;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        Ok(())
    }
}
impl Lyt_DoorhookEntryXoreos {
}
impl Lyt_DoorhookEntryXoreos {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A single obstacle entry in the obstaclecount section.
 * Format: <obstacle_model> <x> <y> <z>
 * 
 * Fields:
 * - obstacle_model: ResRef of the obstacle model (MDL file, max 16 chars, no spaces, case-insensitive)
 * - x: X coordinate in world space (float, meters)
 * - y: Y coordinate in world space (float, meters)
 * - z: Z coordinate in world space (float, meters)
 * 
 * Obstacles are hazard elements used exclusively in swoop racing mini-games (KotOR II).
 * This section is optional - most modules omit it entirely.
 * Used in racing modules to create challenges and obstacles for the player.
 * Each obstacle element represents a hazard placed along the racing track.
 * 
 * Example: "M17mg_MGO01 103.309 3691.61 0.0"
 */

#[derive(Default, Debug, Clone)]
pub struct Lyt_ObstacleEntry {
    pub _root: SharedType<Lyt>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lyt_ObstacleEntry {
    type Root = Lyt;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        Ok(())
    }
}
impl Lyt_ObstacleEntry {
}
impl Lyt_ObstacleEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A single room entry in the roomcount section.
 * Format: <room_model> <x> <y> <z>
 * 
 * Fields:
 * - room_model: ResRef of the room model (MDL/MDX file, max 16 chars, no spaces, case-insensitive)
 * - x: X coordinate in world space (float, meters)
 * - y: Y coordinate in world space (float, meters)
 * - z: Z coordinate in world space (float, meters)
 * 
 * Room models reference MDL/MDX files that define the room geometry.
 * Room names are case-insensitive for matching purposes.
 * Multiple rooms can be placed to create complex area layouts.
 * 
 * Example: "M17mg_01a 100.0 100.0 0.0"
 */

#[derive(Default, Debug, Clone)]
pub struct Lyt_RoomEntry {
    pub _root: SharedType<Lyt>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lyt_RoomEntry {
    type Root = Lyt;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        Ok(())
    }
}
impl Lyt_RoomEntry {
}
impl Lyt_RoomEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A single track entry in the trackcount section.
 * Format: <track_model> <x> <y> <z>
 * 
 * Fields:
 * - track_model: ResRef of the track booster model (MDL file, max 16 chars, no spaces, case-insensitive)
 * - x: X coordinate in world space (float, meters)
 * - y: Y coordinate in world space (float, meters)
 * - z: Z coordinate in world space (float, meters)
 * 
 * Tracks are booster elements used exclusively in swoop racing mini-games (KotOR II).
 * This section is optional - most modules omit it entirely.
 * Used in racing modules like Telos surface racing.
 * Each track element represents a booster that provides speed boosts during racing.
 * 
 * Example: "M17mg_MGT01 0.0 0.0 0.0"
 */

#[derive(Default, Debug, Clone)]
pub struct Lyt_TrackEntry {
    pub _root: SharedType<Lyt>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lyt_TrackEntry {
    type Root = Lyt;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        Ok(())
    }
}
impl Lyt_TrackEntry {
}
impl Lyt_TrackEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A single walkmesh room entry in the walkmeshRooms section.
 * Format: <room_model>
 * 
 * Fields:
 * - room_model: ResRef of the room model (must match a roomcount entry, case-insensitive, max 16 chars)
 * 
 * Walkmesh rooms section is only relevant for Jade Engine (Dragon Age, Mass Effect).
 * This section is optional - KotOR implementations typically ignore this.
 * Marks rooms that contain walkmesh geometry for pathfinding.
 * When present, sets the canWalk flag on matching room entries.
 * 
 * Example: "WMRoom01"
 * 
 * Reference: https://github.com/xoreos/xoreos/blob/master/src/aurora/lytfile.cpp:141-159
 */

#[derive(Default, Debug, Clone)]
pub struct Lyt_WalkmeshRoomEntry {
    pub _root: SharedType<Lyt>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lyt_WalkmeshRoomEntry {
    type Root = Lyt;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        Ok(())
    }
}
impl Lyt_WalkmeshRoomEntry {
}
impl Lyt_WalkmeshRoomEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
