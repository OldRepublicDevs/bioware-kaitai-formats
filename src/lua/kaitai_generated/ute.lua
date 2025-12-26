-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- UTE (Encounter Template) files define spawn encounters with creature lists and probabilities.
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- UTE Root Struct Fields:
-- - TemplateResRef (ResRef): Blueprint identifier
-- - Tag (String): Instance identifier
-- - LocalizedName (LocalizedString): Encounter name
-- - CreatureList (List): Creatures to spawn with probabilities
-- - Difficulty, MaxCreatures, RecCreatures, SpawnOption: Spawn behavior
-- - Script hooks: OnEntered, OnExhausted, OnExit, OnHeartbeat, OnUserDefined
Ute = class.class(KaitaiStruct)

function Ute:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ute:_read()
  self.gff_data = Gff(self._io)
end

Ute.property.file_type_valid = {}
function Ute.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "UTE "
  return self._m_file_type_valid
end

Ute.property.version_valid = {}
function Ute.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3")) 
  return self._m_version_valid
end


