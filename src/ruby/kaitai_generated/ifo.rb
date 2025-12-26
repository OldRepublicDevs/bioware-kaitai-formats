# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'gff'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# IFO (Module Information) files store module metadata including entry points,
# starting locations, and module properties.
# 
# This format inherits the complete GFF structure from gff.ksy.
# 
# IFO Root Struct Fields:
# - Mod_ID (ResRef): Module identifier
# - Mod_Name (LocalizedString): Module display name
# - Mod_Entry_Area (ResRef): Starting area
# - Mod_Entry_X, Mod_Entry_Y, Mod_Entry_Z (Float): Starting position
# - Mod_Entry_Dir_X, Mod_Entry_Dir_Y (Float): Starting orientation
# - Mod_OnHeartbeat, Mod_OnModLoad, Mod_OnModStart (ResRef): Script hooks
# - Mod_MinGameVer (String): Minimum game version required
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-IFO.md
class Ifo < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @gff_data = Gff::Gff.new(@_io)
    self
  end
  def file_type_valid
    return @file_type_valid unless @file_type_valid.nil?
    @file_type_valid = gff_data.header.file_type == "IFO "
    @file_type_valid
  end
  def version_valid
    return @version_valid unless @version_valid.nil?
    @version_valid =  ((gff_data.header.file_version == "V3.2") || (gff_data.header.file_version == "V3.3") || (gff_data.header.file_version == "V4.0") || (gff_data.header.file_version == "V4.1")) 
    @version_valid
  end
  attr_reader :gff_data
end
