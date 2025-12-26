# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Human-readable XML representation of DLG (Dialogue) binary files.
# Uses GFF XML structure with <gff3> root element.
# 
# Binary format reference: ../dlg/dlg.ksy
# 
# References:
# - PyKotor wiki (GFF-DLG.md, GFF-File-Format.md)
class DlgXml < Kaitai::Struct::Struct
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
