-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- NFO (Module Info) files store save game module information for KotOR.
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- Note: This is different from IFO files. NFO is used in save games,
-- while IFO is used in module definitions.
Nfo = class.class(KaitaiStruct)

function Nfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nfo:_read()
  self.gff_data = Gff(self._io)
end

Nfo.property.file_type_valid = {}
function Nfo.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "NFO "
  return self._m_file_type_valid
end

Nfo.property.version_valid = {}
function Nfo.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3") or (self.gff_data.header.file_version == "V4.0") or (self.gff_data.header.file_version == "V4.1")) 
  return self._m_version_valid
end


