# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class NcsMinimal < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @file_type = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
    @file_version = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
    @size_marker = @_io.read_u1
    @total_file_size = @_io.read_u4be
    @instructions = []
    i = 0
    begin
      _ = Instruction.new(@_io, self, @_root)
      @instructions << _
      i += 1
    end until _io.pos >= _root.total_file_size
    self
  end
  class Instruction < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bytecode = @_io.read_u1
      @qualifier = @_io.read_u1
      self
    end
    attr_reader :bytecode
    attr_reader :qualifier
  end
  attr_reader :file_type
  attr_reader :file_version
  attr_reader :size_marker
  attr_reader :total_file_size
  attr_reader :instructions
end
