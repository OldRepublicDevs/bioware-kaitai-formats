-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- UTS (Sound Template) files define ambient sound sources and properties.
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- UTS Root Struct Fields:
-- - TemplateResRef (ResRef): Blueprint identifier
-- - Tag (String): Instance identifier
-- - LocalizedName (LocalizedString): Sound name
-- - Sounds (List): Sound file references
-- - Volume, MaxDistance, MinDistance: Audio properties
-- - Looping, Random, Positional: Sound behavior
Uts = class.class(KaitaiStruct)

function Uts:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Uts:_read()
  self.gff_data = Gff(self._io)
end

Uts.property.file_type_valid = {}
function Uts.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "UTS "
  return self._m_file_type_valid
end

Uts.property.version_valid = {}
function Uts.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3")) 
  return self._m_version_valid
end


