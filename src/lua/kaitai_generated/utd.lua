-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- UTD (Door Template) files define door properties, scripts, and behavior.
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- UTD Root Struct Fields:
-- - TemplateResRef (ResRef): Blueprint identifier
-- - Tag (String): Instance identifier
-- - LocalizedName (LocalizedString): Door name
-- - Appearance (UInt32): Door appearance ID
-- - Locked, KeyRequired, Trap, Faction (various): Door state/behavior
-- - Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnFailToOpen, etc.
Utd = class.class(KaitaiStruct)

function Utd:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Utd:_read()
  self.gff_data = Gff(self._io)
end

Utd.property.file_type_valid = {}
function Utd.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "UTD "
  return self._m_file_type_valid
end

Utd.property.version_valid = {}
function Utd.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3")) 
  return self._m_version_valid
end


