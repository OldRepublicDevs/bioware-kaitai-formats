# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'gff'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# PT (Party Table) files are GFF-based format files that store party and game state information
# for Odyssey Engine games (KotOR and KotOR 2). PT files use the GFF (Generic File Format) binary
# structure with file type signature "PT  ".
# 
# This format inherits the complete GFF structure from gff.ksy and adds PT-specific
# validation and documentation.
# 
# PT files are typically named "PARTYTABLE.res" and are stored in savegame.sav ERF archives.
# They contain comprehensive party and game state information including:
# - Party composition (current members, available NPCs, leader)
# - Resources (gold/credits, XP pool, components, chemicals)
# - Journal entries with states, dates, and times
# - Pazaak cards and side decks for the mini-game
# - UI state (last panel, messages, tutorial windows shown)
# - AI state (follow mode, AI enabled, solo mode)
# - K2-specific: Influence values per companion
# 
# PT Root Struct Fields (Common):
# - "PT_PCNAME" (String): Player character name
# - "PT_GOLD" (Int32): Credits/gold amount
# - "PT_XP_POOL" (Int32): Experience points
# - "PT_PLAYEDSECONDS" (UInt32): Total playtime in seconds
# - "PT_NUM_MEMBERS" (Int32): Party member count
# - "PT_CONTROLLED_NPC", "PT_SOLOMODE", "PT_AISTATE", "PT_FOLLOWSTATE" (Int32): AI/party state
# - "PT_MEMBERS" (List): Party member ResRefs and leader flags
# - "PT_AVAIL_NPCS" (List): Available NPCs for recruitment
# - "PT_INFLUENCE" (List): Influence values (KotOR 2 only)
# - "PT_PAZAAKCARDS", "PT_PAZSIDELIST" (List): Pazaak card collections
# - Journal/message lists: "PT_FB_MSG_LIST", "PT_DLG_MSG_LIST", "PT_COM_MSG_LIST"
# 
# Based on swkotor2.exe: SavePartyTable @ 0x0057bd70
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/extract/savedata.py
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PT.md
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
class Pt < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @gff_data = Gff::Gff.new(@_io)
    self
  end

  ##
  # Validates that this is a PT file (file type must be "PT  ")
  def file_type_valid
    return @file_type_valid unless @file_type_valid.nil?
    @file_type_valid = gff_data.header.file_type == "PT  "
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
  # Complete GFF structure. PT files use standard GFF format with "PT  " file type.
  # Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
  attr_reader :gff_data
end
