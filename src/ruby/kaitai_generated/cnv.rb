# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'gff'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# CNV (Conversation) files are GFF-based format files that store conversation trees with entries, replies,
# links, and conversation metadata. CNV files use the GFF (Generic File Format) binary structure
# with file type signature "CNV ".
# 
# This format inherits the complete GFF structure from gff.ksy and adds CNV-specific
# validation and documentation.
# 
# CNV files are used by Eclipse Engine games (Dragon Age Origins, Dragon Age 2, Mass Effect, Mass Effect 2).
# They are similar to DLG files used by Odyssey and Aurora engines but adapted for Eclipse's conversation system.
# 
# CNV Root Struct Fields:
# - NumWords (Int32): Word count for conversation
# - Skippable (UInt8): Whether conversation can be skipped
# - ConversationType (Int32): Conversation type identifier
# - EntryList (List): NPC dialogue lines (CNVEntry structs)
# - ReplyList (List): Player response options (CNVReply structs)
# - StartingList (List): Entry points (CNVLink structs)
# - StuntList (List): Special animations (CNVStunt structs)
# 
# Each Entry/Reply contains:
# - Text (LocalizedString): Dialogue text
# - Script (ResRef): Conditional/action scripts
# - Camera settings, animations, links to other nodes
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-CNV.md
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
class Cnv < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @gff_data = Gff::Gff.new(@_io)
    self
  end

  ##
  # Validates that this is a CNV file (file type must be "CNV ")
  def file_type_valid
    return @file_type_valid unless @file_type_valid.nil?
    @file_type_valid = gff_data.header.file_type == "CNV "
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
  # Complete GFF structure. CNV files use standard GFF format with "CNV " file type.
  # Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
  attr_reader :gff_data
end
