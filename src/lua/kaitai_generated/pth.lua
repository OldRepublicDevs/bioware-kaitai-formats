-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- PTH (Path/Pathfinding) files store pathfinding waypoint graphs for AI navigation.
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- PTH Root Struct Fields:
-- - Path_Points (List): Waypoint positions (X, Y coordinates)
-- - Connections (List): Connections between waypoints
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PTH.md
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
-- - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/pth.py
Pth = class.class(KaitaiStruct)

function Pth:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Pth:_read()
  self.gff_data = Gff(self._io)
end

Pth.property.file_type_valid = {}
function Pth.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "PTH "
  return self._m_file_type_valid
end

Pth.property.version_valid = {}
function Pth.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3") or (self.gff_data.header.file_version == "V4.0") or (self.gff_data.header.file_version == "V4.1")) 
  return self._m_version_valid
end


