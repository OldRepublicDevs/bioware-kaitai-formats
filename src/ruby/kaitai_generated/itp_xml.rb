# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# ITP XML format is a human-readable XML representation of ITP (Palette) binary files.
# ITP files use GFF format (FileType "ITP " in GFF header).
# Uses GFF XML structure with root element <gff3> containing <struct> elements.
# Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/itp/itp.py
# - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
# - https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/gff/itp.cpp
# - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
# - https://github.com/OldRepublicDevs/PyKotor/wiki/ITP-File-Format.md
# - https://github.com/xoreos/xoreos/tree/master/src/aurora/gff3file.cpp
class ItpXml < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @xml_content = (@_io.read_bytes_full).force_encoding("UTF-8")
    self
  end

  ##
  # XML document content as UTF-8 text
  attr_reader :xml_content
end
