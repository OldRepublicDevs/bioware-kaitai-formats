-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- JRL (Journal) files store quest journal entries and categories.
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- JRL Root Struct Fields:
-- - Categories (List): Journal categories
-- - Each category contains quest entries with text, states, priorities
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-JRL.md
Jrl = class.class(KaitaiStruct)

function Jrl:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Jrl:_read()
  self.gff_data = Gff(self._io)
end

Jrl.property.file_type_valid = {}
function Jrl.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "JRL "
  return self._m_file_type_valid
end

Jrl.property.version_valid = {}
function Jrl.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3") or (self.gff_data.header.file_version == "V4.0") or (self.gff_data.header.file_version == "V4.1")) 
  return self._m_version_valid
end


