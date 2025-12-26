# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'gff'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# GUI (Graphical User Interface) files define UI layouts, controls, and properties.
# 
# This format inherits the complete GFF structure from gff.ksy.
# 
# GUI Root Struct Fields:
# - CONTROLS (List): UI control elements (buttons, labels, listboxes, etc.)
# - Each control contains:
#   - CONTROLTYPE (Int32): Control type (button=4, label=5, listbox=9, etc.)
#   - TAG (String): Control identifier
#   - X, Y, WIDTH, HEIGHT (Int32): Position and size
#   - TEXT (Struct): Text properties with STRREF, color, alignment
#   - BORDER (Struct): Border properties
#   - EXTENT (Struct): Dimensions
#   - Various control-specific fields
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GUI.md
class Gui < Kaitai::Struct::Struct
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
    @file_type_valid = gff_data.header.file_type == "GUI "
    @file_type_valid
  end
  def version_valid
    return @version_valid unless @version_valid.nil?
    @version_valid =  ((gff_data.header.file_version == "V3.2") || (gff_data.header.file_version == "V3.3") || (gff_data.header.file_version == "V4.0") || (gff_data.header.file_version == "V4.1")) 
    @version_valid
  end
  attr_reader :gff_data
end
