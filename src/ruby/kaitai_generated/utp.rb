# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'gff'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# UTP (Placeable Template) files define placeable objects (containers, furniture, etc.).
# 
# This format inherits the complete GFF structure from gff.ksy.
# 
# UTP Root Struct Fields:
# - TemplateResRef (ResRef): Blueprint identifier
# - Tag (String): Instance identifier
# - LocalizedName (LocalizedString): Placeable name
# - Appearance (UInt32): Placeable appearance ID
# - HasInventory, ItemList (List): Container contents
# - Locked, KeyRequired, Trap: Security settings
# - Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnHeartbeat, etc.
class Utp < Kaitai::Struct::Struct
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
    @file_type_valid = gff_data.header.file_type == "UTP "
    @file_type_valid
  end
  def version_valid
    return @version_valid unless @version_valid.nil?
    @version_valid =  ((gff_data.header.file_version == "V3.2") || (gff_data.header.file_version == "V3.3")) 
    @version_valid
  end
  attr_reader :gff_data
end
