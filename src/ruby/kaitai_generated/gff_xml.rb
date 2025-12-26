# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# GFF XML format is a human-readable XML representation of GFF (Generic File Format) binary files.
# Used by xoreos-tools and other modding tools for easier editing than binary GFF format.
# 
# The XML format represents the hierarchical GFF structure using XML elements:
# - Root element: <gff3>
# - Contains a <struct> element with id attribute
# - Struct contains field elements (byte, uint32, exostring, locstring, resref, list, etc.)
# - Each field has a label attribute
# - Lists contain nested <struct> elements
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
# - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffdumper.cpp
# - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffcreator.cpp
class GffXml < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @xml_content = (@_io.read_bytes_full).force_encoding("UTF-8")
    self
  end

  ##
  # XML document content as UTF-8 text.
  # Structure: <gff3><struct id="...">...</struct></gff3>
  # Note: Kaitai Struct has limited XML parsing capabilities. For full XML parsing,
  # use an XML parser library. This definition serves as a format identifier.
  attr_reader :xml_content
end
