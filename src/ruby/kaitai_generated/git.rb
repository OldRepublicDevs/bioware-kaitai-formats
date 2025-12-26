# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'gff'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# GIT (Game Instance Template) files store dynamic area instance data including
# placed creatures, placeables, doors, triggers, waypoints, sounds, stores, and encounters.
# 
# This format inherits the complete GFF structure from gff.ksy.
# 
# GIT Root Struct Fields:
# - CreatureList (List): Placed creatures with positions, orientations
# - DoorList (List): Placed doors with states, scripts
# - PlaceableList (List): Placed placeables (chests, etc.)
# - TriggerList (List): Trigger zones
# - WaypointList (List): Navigation waypoints
# - SoundList (List): Ambient sounds
# - StoreList (List): Merchant shops
# - EncounterList (List): Spawn encounters
# - CameraList (List): Camera points
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GIT.md
class Git < Kaitai::Struct::Struct
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
    @file_type_valid = gff_data.header.file_type == "GIT "
    @file_type_valid
  end
  def version_valid
    return @version_valid unless @version_valid.nil?
    @version_valid =  ((gff_data.header.file_version == "V3.2") || (gff_data.header.file_version == "V3.3") || (gff_data.header.file_version == "V4.0") || (gff_data.header.file_version == "V4.1")) 
    @version_valid
  end
  attr_reader :gff_data
end
