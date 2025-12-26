# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# TwoDA CSV format is a human-readable CSV (Comma-Separated Values) representation of TwoDA files.
# Provides easier editing in spreadsheet applications than binary TwoDA format.
# 
# Each row represents a data row, with the first row containing column headers.
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
class TwodaCsv < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @csv_content = (@_io.read_bytes_full).force_encoding("UTF-8")
    self
  end

  ##
  # CSV text content with rows separated by newlines and columns by commas
  attr_reader :csv_content
end
