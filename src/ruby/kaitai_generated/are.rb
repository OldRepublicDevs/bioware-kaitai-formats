# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'gff'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# ARE (Area) files are GFF-based format files that store static area information including
# lighting, fog, grass, weather, script hooks, and map data. ARE files use the GFF (Generic File Format)
# binary structure with file type signature "ARE ".
# 
# This format inherits the complete GFF structure from gff.ksy and adds ARE-specific
# validation and documentation.
# 
# ARE Root Struct Fields (Common):
# - "Tag" (String): Unique area identifier
# - "Name" (LocalizedString): Area display name
# - "SunAmbientColor", "SunDiffuseColor" (UInt32): Lighting colors (BGR format)
# - "SunFogOn", "SunFogNear", "SunFogFar", "SunFogColor": Fog settings
# - "Grass_*": Grass rendering properties
# - "OnEnter", "OnExit", "OnHeartbeat", "OnUserDefined": Script hooks (ResRef)
# - "Map" (Struct): Minimap coordinate mapping
# - "Rooms" (List): Audio zones and weather regions
# 
# KotOR 2 adds weather fields:
# - "ChanceRain", "ChanceSnow", "ChanceLightning" (Int32)
# - "Dirty*" fields for dust particle effects
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-ARE.md
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
# - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/are.py
# - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/are.cpp
class Are < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @gff_data = Gff::Gff.new(@_io)
    self
  end

  ##
  # Validates that this is an ARE file (file type must be "ARE ")
  def file_type_valid
    return @file_type_valid unless @file_type_valid.nil?
    @file_type_valid = gff_data.header.file_type == "ARE "
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
  # Complete GFF structure. ARE files use standard GFF format with "ARE " file type.
  # Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
  attr_reader :gff_data
end
