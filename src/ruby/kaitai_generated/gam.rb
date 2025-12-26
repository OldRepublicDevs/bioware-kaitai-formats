# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'gff'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# GAM (Game State) files are GFF-based format files that store game state information
# including party members, global variables, game time, and time played.
# 
# This format inherits the complete GFF structure from gff.ksy and adds GAM-specific
# validation and documentation.
# 
# GAM files are used by:
# - Aurora Engine (Neverwinter Nights, Neverwinter Nights 2)
# - Infinity Engine (Mass Effect, Dragon Age Origins, Dragon Age 2)
# 
# NOTE: Odyssey Engine (Knights of the Old Republic) does NOT use GAM format -
# it uses NFO format for save games instead.
# 
# GAM Root Struct Fields:
# - GameTimeHour, GameTimeMinute, GameTimeSecond, GameTimeMillisecond (Int32): Game time
# - TimePlayed (Int32): Total playtime in seconds
# - PartyList (List): Party member ResRefs
# - GlobalBooleans, GlobalNumbers, GlobalStrings (Lists): Global variable storage
# 
# Aurora-specific: ModuleName, CurrentArea, PlayerCharacter
# Infinity-specific: GameName, Chapter, JournalEntries
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GAM.md
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
class Gam < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @gff_data = Gff::Gff.new(@_io)
    self
  end

  ##
  # Validates that this is a GAM file (file type must be "GAM ")
  def file_type_valid
    return @file_type_valid unless @file_type_valid.nil?
    @file_type_valid = gff_data.header.file_type == "GAM "
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
  # Complete GFF structure. GAM files use standard GFF format with "GAM " file type.
  # Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
  attr_reader :gff_data
end
