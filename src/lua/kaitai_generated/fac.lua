-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- FAC (Faction) files are GFF-based format files that store faction relationships,
-- reputation values, and faction metadata.
-- 
-- This format inherits the complete GFF structure from gff.ksy and adds FAC-specific
-- validation and documentation.
-- 
-- FAC Root Struct Fields:
-- - FactionName (String): Faction identifier
-- - FactionParentID (UInt16): Parent faction ID
-- - FactionGlobal (UInt16): Global faction flag
-- - RepList (List): Reputation values with other factions
--   - FactionID (UInt32): Target faction ID
--   - FactionRep (UInt32): Reputation value (0-100)
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-FAC.md
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
-- - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/fac.py
Fac = class.class(KaitaiStruct)

function Fac:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Fac:_read()
  self.gff_data = Gff(self._io)
end

-- 
-- Validates FAC file type.
Fac.property.file_type_valid = {}
function Fac.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "FAC "
  return self._m_file_type_valid
end

-- 
-- Validates GFF version.
Fac.property.version_valid = {}
function Fac.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3") or (self.gff_data.header.file_version == "V4.0") or (self.gff_data.header.file_version == "V4.1")) 
  return self._m_version_valid
end

-- 
-- Complete GFF structure with "FAC " file type.

