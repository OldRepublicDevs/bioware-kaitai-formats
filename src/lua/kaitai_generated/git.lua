-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- GIT (Game Instance Template) files store dynamic area instance data including
-- placed creatures, placeables, doors, triggers, waypoints, sounds, stores, and encounters.
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- GIT Root Struct Fields:
-- - CreatureList (List): Placed creatures with positions, orientations
-- - DoorList (List): Placed doors with states, scripts
-- - PlaceableList (List): Placed placeables (chests, etc.)
-- - TriggerList (List): Trigger zones
-- - WaypointList (List): Navigation waypoints
-- - SoundList (List): Ambient sounds
-- - StoreList (List): Merchant shops
-- - EncounterList (List): Spawn encounters
-- - CameraList (List): Camera points
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GIT.md
Git = class.class(KaitaiStruct)

function Git:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Git:_read()
  self.gff_data = Gff(self._io)
end

Git.property.file_type_valid = {}
function Git.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "GIT "
  return self._m_file_type_valid
end

Git.property.version_valid = {}
function Git.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3") or (self.gff_data.header.file_version == "V4.0") or (self.gff_data.header.file_version == "V4.1")) 
  return self._m_version_valid
end


