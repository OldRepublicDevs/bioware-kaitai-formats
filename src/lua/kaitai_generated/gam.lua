-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- GAM (Game State) files are GFF-based format files that store game state information
-- including party members, global variables, game time, and time played.
-- 
-- This format inherits the complete GFF structure from gff.ksy and adds GAM-specific
-- validation and documentation.
-- 
-- GAM files are used by:
-- - Aurora Engine (Neverwinter Nights, Neverwinter Nights 2)
-- - Infinity Engine (Mass Effect, Dragon Age Origins, Dragon Age 2)
-- 
-- NOTE: Odyssey Engine (Knights of the Old Republic) does NOT use GAM format -
-- it uses NFO format for save games instead.
-- 
-- GAM Root Struct Fields:
-- - GameTimeHour, GameTimeMinute, GameTimeSecond, GameTimeMillisecond (Int32): Game time
-- - TimePlayed (Int32): Total playtime in seconds
-- - PartyList (List): Party member ResRefs
-- - GlobalBooleans, GlobalNumbers, GlobalStrings (Lists): Global variable storage
-- 
-- Aurora-specific: ModuleName, CurrentArea, PlayerCharacter
-- Infinity-specific: GameName, Chapter, JournalEntries
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GAM.md
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
Gam = class.class(KaitaiStruct)

function Gam:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gam:_read()
  self.gff_data = Gff(self._io)
end

-- 
-- Validates that this is a GAM file (file type must be "GAM ").
Gam.property.file_type_valid = {}
function Gam.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "GAM "
  return self._m_file_type_valid
end

-- 
-- Validates GFF version is supported.
Gam.property.version_valid = {}
function Gam.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3") or (self.gff_data.header.file_version == "V4.0") or (self.gff_data.header.file_version == "V4.1")) 
  return self._m_version_valid
end

-- 
-- Complete GFF structure. GAM files use standard GFF format with "GAM " file type.
-- Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.

