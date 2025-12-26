# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'gff'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# PTH (Path/Pathfinding) files store pathfinding waypoint graphs for AI navigation.
# 
# This format inherits the complete GFF structure from gff.ksy.
# 
# PTH Root Struct Fields:
# - Path_Points (List): Waypoint positions (X, Y coordinates)
# - Connections (List): Connections between waypoints
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PTH.md
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
# - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/pth.py
class Pth < Kaitai::Struct::Struct
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
    @file_type_valid = gff_data.header.file_type == "PTH "
    @file_type_valid
  end
  def version_valid
    return @version_valid unless @version_valid.nil?
    @version_valid =  ((gff_data.header.file_version == "V3.2") || (gff_data.header.file_version == "V3.3") || (gff_data.header.file_version == "V4.0") || (gff_data.header.file_version == "V4.1")) 
    @version_valid
  end
  attr_reader :gff_data
end
