# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'gff'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# FAC (Faction) files are GFF-based format files that store faction relationships,
# reputation values, and faction metadata.
# 
# This format inherits the complete GFF structure from gff.ksy and adds FAC-specific
# validation and documentation.
# 
# FAC Root Struct Fields:
# - FactionName (String): Faction identifier
# - FactionParentID (UInt16): Parent faction ID
# - FactionGlobal (UInt16): Global faction flag
# - RepList (List): Reputation values with other factions
#   - FactionID (UInt32): Target faction ID
#   - FactionRep (UInt32): Reputation value (0-100)
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-FAC.md
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
# - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/fac.py
class Fac < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @gff_data = Gff::Gff.new(@_io)
    self
  end

  ##
  # Validates FAC file type
  def file_type_valid
    return @file_type_valid unless @file_type_valid.nil?
    @file_type_valid = gff_data.header.file_type == "FAC "
    @file_type_valid
  end

  ##
  # Validates GFF version
  def version_valid
    return @version_valid unless @version_valid.nil?
    @version_valid =  ((gff_data.header.file_version == "V3.2") || (gff_data.header.file_version == "V3.3") || (gff_data.header.file_version == "V4.0") || (gff_data.header.file_version == "V4.1")) 
    @version_valid
  end

  ##
  # Complete GFF structure with "FAC " file type
  attr_reader :gff_data
end
