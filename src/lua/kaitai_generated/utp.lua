-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- UTP (Placeable Template) files define placeable objects (containers, furniture, etc.).
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- UTP Root Struct Fields:
-- - TemplateResRef (ResRef): Blueprint identifier
-- - Tag (String): Instance identifier
-- - LocalizedName (LocalizedString): Placeable name
-- - Appearance (UInt32): Placeable appearance ID
-- - HasInventory, ItemList (List): Container contents
-- - Locked, KeyRequired, Trap: Security settings
-- - Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnHeartbeat, etc.
Utp = class.class(KaitaiStruct)

function Utp:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Utp:_read()
  self.gff_data = Gff(self._io)
end

Utp.property.file_type_valid = {}
function Utp.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "UTP "
  return self._m_file_type_valid
end

Utp.property.version_valid = {}
function Utp.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3")) 
  return self._m_version_valid
end


