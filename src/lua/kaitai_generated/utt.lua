-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- UTT (Trigger Template) files define trigger zones and their properties.
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- UTT Root Struct Fields:
-- - TemplateResRef (ResRef): Blueprint identifier
-- - Tag (String): Instance identifier
-- - LocalizedName (LocalizedString): Trigger name
-- - Geometry (List): Trigger zone vertices
-- - TriggerType, Cursor, Faction: Trigger behavior
-- - Script hooks: OnClick, OnDisarm, OnHeartbeat, OnTrapTriggered, OnUserDefined
Utt = class.class(KaitaiStruct)

function Utt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Utt:_read()
  self.gff_data = Gff(self._io)
end

Utt.property.file_type_valid = {}
function Utt.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "UTT "
  return self._m_file_type_valid
end

Utt.property.version_valid = {}
function Utt.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3")) 
  return self._m_version_valid
end


