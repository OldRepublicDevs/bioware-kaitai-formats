-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- ARE (Area) files are GFF-based format files that store static area information including
-- lighting, fog, grass, weather, script hooks, and map data. ARE files use the GFF (Generic File Format)
-- binary structure with file type signature "ARE ".
-- 
-- This format inherits the complete GFF structure from gff.ksy and adds ARE-specific
-- validation and documentation.
-- 
-- ARE Root Struct Fields (Common):
-- - "Tag" (String): Unique area identifier
-- - "Name" (LocalizedString): Area display name
-- - "SunAmbientColor", "SunDiffuseColor" (UInt32): Lighting colors (BGR format)
-- - "SunFogOn", "SunFogNear", "SunFogFar", "SunFogColor": Fog settings
-- - "Grass_*": Grass rendering properties
-- - "OnEnter", "OnExit", "OnHeartbeat", "OnUserDefined": Script hooks (ResRef)
-- - "Map" (Struct): Minimap coordinate mapping
-- - "Rooms" (List): Audio zones and weather regions
-- 
-- KotOR 2 adds weather fields:
-- - "ChanceRain", "ChanceSnow", "ChanceLightning" (Int32)
-- - "Dirty*" fields for dust particle effects
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-ARE.md
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
-- - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/are.py
-- - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/are.cpp
Are = class.class(KaitaiStruct)

function Are:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Are:_read()
  self.gff_data = Gff(self._io)
end

-- 
-- Validates that this is an ARE file (file type must be "ARE ").
Are.property.file_type_valid = {}
function Are.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "ARE "
  return self._m_file_type_valid
end

-- 
-- Convenience access to the decoded GFF root struct (struct_array[0]).
-- Use this to iterate all resolved fields (label + typed value), including:
-- "Tag", "Name", "AlphaTest", "Map" (struct), "Rooms" (list), and all KotOR2/deprecated keys.
Are.property.root_struct_resolved = {}
function Are.property.root_struct_resolved:get()
  if self._m_root_struct_resolved ~= nil then
    return self._m_root_struct_resolved
  end

  self._m_root_struct_resolved = self.gff_data.root_struct_resolved
  return self._m_root_struct_resolved
end

-- 
-- Validates GFF version is supported.
Are.property.version_valid = {}
function Are.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3") or (self.gff_data.header.file_version == "V4.0") or (self.gff_data.header.file_version == "V4.1")) 
  return self._m_version_valid
end

-- 
-- Complete GFF structure. ARE files use standard GFF format with "ARE " file type.
-- Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.

