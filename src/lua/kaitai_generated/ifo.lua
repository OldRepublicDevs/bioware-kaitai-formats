-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- IFO (Module Information) files store module metadata including entry points,
-- starting locations, and module properties.
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- IFO Root Struct Fields:
-- - Mod_ID (ResRef): Module identifier
-- - Mod_Name (LocalizedString): Module display name
-- - Mod_Entry_Area (ResRef): Starting area
-- - Mod_Entry_X, Mod_Entry_Y, Mod_Entry_Z (Float): Starting position
-- - Mod_Entry_Dir_X, Mod_Entry_Dir_Y (Float): Starting orientation
-- - Mod_OnHeartbeat, Mod_OnModLoad, Mod_OnModStart (ResRef): Script hooks
-- - Mod_MinGameVer (String): Minimum game version required
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-IFO.md
Ifo = class.class(KaitaiStruct)

function Ifo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ifo:_read()
  self.gff_data = Gff(self._io)
end

Ifo.property.file_type_valid = {}
function Ifo.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "IFO "
  return self._m_file_type_valid
end

Ifo.property.version_valid = {}
function Ifo.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3") or (self.gff_data.header.file_version == "V4.0") or (self.gff_data.header.file_version == "V4.1")) 
  return self._m_version_valid
end


