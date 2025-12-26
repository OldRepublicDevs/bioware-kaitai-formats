-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- UTW (Waypoint Template) files define navigation waypoints and spawn points.
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- UTW Root Struct Fields:
-- - TemplateResRef (ResRef): Blueprint identifier
-- - Tag (String): Instance identifier
-- - LocalizedName (LocalizedString): Waypoint name
-- - Appearance (UInt32): Visual appearance (if visible)
-- - HasMapNote, MapNote (LocalizedString): Map markers
-- - LinkedTo (String): Connected waypoint tag
Utw = class.class(KaitaiStruct)

function Utw:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Utw:_read()
  self.gff_data = Gff(self._io)
end

Utw.property.file_type_valid = {}
function Utw.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "UTW "
  return self._m_file_type_valid
end

Utw.property.version_valid = {}
function Utw.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3")) 
  return self._m_version_valid
end


