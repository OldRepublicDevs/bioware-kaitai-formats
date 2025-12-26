# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'gff'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# UTC (Creature Template) files are GFF-based format files that store creature definitions
# including stats, appearance, inventory, feats, and script hooks. UTC files are used to
# define NPCs, party members, enemies, and the player character in Knights of the Old Republic.
# 
# This format inherits the complete GFF structure from gff.ksy and adds UTC-specific
# validation and documentation.
# 
# UTC Root Struct Fields (Common):
# - "TemplateResRef" (ResRef): Blueprint identifier
# - "Tag" (String): Unique instance identifier
# - "FirstName", "LastName" (LocalizedString): Creature name
# - "Appearance_Type" (UInt32): Appearance ID (appearance.2da)
# - "PortraitId" (UInt16): Portrait index (portraits.2da)
# - "Gender", "Race" (UInt8/UInt16): Character attributes
# - "Str", "Dex", "Con", "Int", "Wis", "Cha" (UInt8): Ability scores
# - "HitPoints", "MaxHitPoints", "ForcePoints" (Int16): Health/Force stats
# - "ClassList" (List): Character classes with levels
# - "FeatList" (List): Known feats
# - "SkillList" (List): Skill ranks
# - "ItemList" (List): Inventory items
# - "Equip_ItemList" (List): Equipped items with slots
# - Script hooks: "ScriptAttacked", "ScriptDamaged", "ScriptDeath", etc. (ResRef)
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTC.md
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
# - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utc.py
# - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/utc.cpp
class Utc < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @gff_data = Gff::Gff.new(@_io)
    self
  end

  ##
  # Validates that this is a UTC file (file type must be "UTC ")
  def file_type_valid
    return @file_type_valid unless @file_type_valid.nil?
    @file_type_valid = gff_data.header.file_type == "UTC "
    @file_type_valid
  end

  ##
  # Validates GFF version is supported
  def version_valid
    return @version_valid unless @version_valid.nil?
    @version_valid =  ((gff_data.header.file_version == "V3.2") || (gff_data.header.file_version == "V3.3") || (gff_data.header.file_version == "V4.0") || (gff_data.header.file_version == "V4.1")) 
    @version_valid
  end

  ##
  # Complete GFF structure. UTC files use standard GFF format with "UTC " file type.
  # Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
  attr_reader :gff_data
end
