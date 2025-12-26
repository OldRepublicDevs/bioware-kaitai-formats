-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- GVT (Global Variables Table) files store global game variables.
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- GVT Root Struct Fields:
-- - ValNumber, ValBoolean, ValString lists for different variable types
Gvt = class.class(KaitaiStruct)

function Gvt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gvt:_read()
  self.gff_data = Gff(self._io)
end

Gvt.property.file_type_valid = {}
function Gvt.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "GVT "
  return self._m_file_type_valid
end

Gvt.property.version_valid = {}
function Gvt.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3") or (self.gff_data.header.file_version == "V4.0") or (self.gff_data.header.file_version == "V4.1")) 
  return self._m_version_valid
end


