-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- UTC (Creature Template) files are GFF-based format files that store creature definitions
-- including stats, appearance, inventory, feats, and script hooks. UTC files are used to
-- define NPCs, party members, enemies, and the player character in Knights of the Old Republic.
-- 
-- This format inherits the complete GFF structure from gff.ksy and adds UTC-specific
-- validation and documentation.
-- 
-- UTC Root Struct Fields (Common):
-- - "TemplateResRef" (ResRef): Blueprint identifier
-- - "Tag" (String): Unique instance identifier
-- - "FirstName", "LastName" (LocalizedString): Creature name
-- - "Appearance_Type" (UInt32): Appearance ID (appearance.2da)
-- - "PortraitId" (UInt16): Portrait index (portraits.2da)
-- - "Gender", "Race" (UInt8/UInt16): Character attributes
-- - "Str", "Dex", "Con", "Int", "Wis", "Cha" (UInt8): Ability scores
-- - "HitPoints", "MaxHitPoints", "ForcePoints" (Int16): Health/Force stats
-- - "ClassList" (List): Character classes with levels
-- - "FeatList" (List): Known feats
-- - "SkillList" (List): Skill ranks
-- - "ItemList" (List): Inventory items
-- - "Equip_ItemList" (List): Equipped items with slots
-- - Script hooks: "ScriptAttacked", "ScriptDamaged", "ScriptDeath", etc. (ResRef)
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTC.md
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
-- - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utc.py
-- - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/utc.cpp
Utc = class.class(KaitaiStruct)

function Utc:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Utc:_read()
  self.gff_data = Gff(self._io)
end

-- 
-- Validates that this is a UTC file (file type must be "UTC ").
Utc.property.file_type_valid = {}
function Utc.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "UTC "
  return self._m_file_type_valid
end

-- 
-- Validates GFF version is supported.
Utc.property.version_valid = {}
function Utc.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3") or (self.gff_data.header.file_version == "V4.0") or (self.gff_data.header.file_version == "V4.1")) 
  return self._m_version_valid
end

-- 
-- Complete GFF structure. UTC files use standard GFF format with "UTC " file type.
-- Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.

