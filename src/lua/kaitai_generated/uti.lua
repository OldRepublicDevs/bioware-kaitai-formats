-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- UTI (Item Template) files define item properties, stats, and behavior.
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- UTI Root Struct Fields:
-- - TemplateResRef (ResRef): Blueprint identifier
-- - Tag (String): Instance identifier
-- - LocalizedName (LocalizedString): Item name
-- - Description (LocalizedString): Item description
-- - BaseItem (Int32): Base item type (baseitems.2da)
-- - Cost, StackSize, Charges: Item economics
-- - ModelVariation, TextureVar, BodyVariation: Item appearance
-- - PropertiesList (List): Item properties (damage, attack bonus, etc.)
Uti = class.class(KaitaiStruct)

function Uti:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Uti:_read()
  self.gff_data = Gff(self._io)
end

Uti.property.file_type_valid = {}
function Uti.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "UTI "
  return self._m_file_type_valid
end

Uti.property.version_valid = {}
function Uti.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3")) 
  return self._m_version_valid
end


