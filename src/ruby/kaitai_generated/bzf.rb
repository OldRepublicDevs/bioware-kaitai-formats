# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# BZF (BioWare Zipped File) files are LZMA-compressed BIF files used primarily in iOS
# (and maybe Android) ports of KotOR. The BZF header contains "BZF " + "V1.0", followed
# by LZMA-compressed BIF data. Decompression reveals a standard BIF structure.
# 
# Format Structure:
# - Header (8 bytes): File type signature "BZF " and version "V1.0"
# - Compressed Data: LZMA-compressed BIF file data
# 
# After decompression, the data follows the standard BIF format structure.
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/BIF-File-Format.md - BZF compression section
# - BIF.ksy - Standard BIF format (decompressed BZF data matches this)
class Bzf < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @file_type = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
    raise Kaitai::Struct::ValidationNotEqualError.new("BZF ", @file_type, @_io, "/seq/0") if not @file_type == "BZF "
    @version = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
    raise Kaitai::Struct::ValidationNotEqualError.new("V1.0", @version, @_io, "/seq/1") if not @version == "V1.0"
    @compressed_data = []
    i = 0
    while not @_io.eof?
      @compressed_data << @_io.read_u1
      i += 1
    end
    self
  end

  ##
  # File type signature. Must be "BZF " for compressed BIF files.
  attr_reader :file_type

  ##
  # File format version. Always "V1.0" for BZF files.
  attr_reader :version

  ##
  # LZMA-compressed BIF file data.
  # This data must be decompressed using LZMA algorithm to obtain the standard BIF structure.
  # After decompression, the data can be parsed using the BIF format definition.
  attr_reader :compressed_data
end
