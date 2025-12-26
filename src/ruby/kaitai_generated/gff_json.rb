# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# GFF JSON format is a human-readable JSON representation of GFF (Generic File Format) binary files.
# Provides easier editing and interoperability with modern tools than binary GFF format.
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
class GffJson < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @json_content = (@_io.read_bytes_full).force_encoding("UTF-8")
    self
  end

  ##
  # JSON document content as UTF-8 text
  attr_reader :json_content
end
