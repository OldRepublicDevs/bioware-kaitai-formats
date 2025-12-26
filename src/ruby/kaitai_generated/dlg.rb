# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'gff'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# DLG (Dialogue) files are GFF-based format files that store conversation trees with entries, replies,
# links, and conversation metadata for Odyssey and Aurora engines.
# 
# This format inherits the complete GFF structure from gff.ksy and adds DLG-specific
# validation and documentation.
# 
# DLG files contain:
# - Root struct with conversation metadata (NumWords, Skippable, ConversationType, etc.)
# - EntryList: Array of dialogue entries (NPC lines)
# - ReplyList: Array of reply options (player responses)
# - StartingList: Array of entry points into conversation tree
# - StuntList: Array of cutscene/animation sequences
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-DLG.md
# - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/dlg/
class Dlg < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @gff_data = Gff::Gff.new(@_io)
    self
  end

  ##
  # Validates DLG file type
  def file_type_valid
    return @file_type_valid unless @file_type_valid.nil?
    @file_type_valid = gff_data.header.file_type == "DLG "
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
  # Complete GFF structure with "DLG " file type
  attr_reader :gff_data
end
