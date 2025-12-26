# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# SSF XML format is a human-readable XML representation of SSF (Soundset) binary files.
# Provides easier editing than binary SSF format.
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf.py
# - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/io_ssf_xml.py
# - https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/ssf.cpp
# - https://github.com/OldRepublicDevs/PyKotor/wiki/SSF-File-Format.md
# - https://github.com/xoreos/xoreos/tree/master/src/aurora/ssffile.cpp
class SsfXml < Kaitai::Struct::Struct
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
