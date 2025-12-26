# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# LTR (Letter) resources store third-order Markov chain probability tables that the game uses
# to procedurally generate NPC names. The data encodes likelihoods for characters appearing at
# the start, middle, and end of names given zero, one, or two-character context.
# 
# KotOR always uses the 28-character alphabet (a-z plus ' and -). Neverwinter Nights (NWN) used
# 26 characters; the header explicitly stores the count. This is a KotOR-specific difference from NWN.
# 
# LTR files are binary and consist of a short header followed by three probability tables
# (singles, doubles, triples) stored as contiguous float arrays.
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/LTR-File-Format.md
# - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/ltrreader.cpp:27-74
# - https://github.com/xoreos/xoreos/blob/master/src/aurora/ltrfile.cpp:135-168
# - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/LTRObject.ts:61-117
class Ltr < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @file_type = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
    @file_version = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
    @letter_count = @_io.read_u1
    @single_letter_block = LetterBlock.new(@_io, self, @_root)
    @double_letter_blocks = DoubleLetterBlocksArray.new(@_io, self, @_root)
    @triple_letter_blocks = TripleLetterBlocksArray.new(@_io, self, @_root)
    self
  end

  ##
  # Array of double-letter blocks. One block per character in the alphabet.
  # Each block is indexed by the previous character (context length 1).
  class DoubleLetterBlocksArray < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @blocks = []
      (_root.letter_count).times { |i|
        @blocks << LetterBlock.new(@_io, self, @_root)
      }
      self
    end

    ##
    # Array of letter_count blocks, each containing start/middle/end probability arrays.
    # Block index corresponds to the previous character in the alphabet.
    attr_reader :blocks
  end

  ##
  # A probability block containing three arrays of probabilities (start, middle, end).
  # Each array has letter_count floats representing cumulative probabilities for each character
  # in the alphabet appearing at that position (start, middle, or end of name).
  # 
  # Blocks store cumulative probabilities (monotonically increasing floats) that are compared
  # against random roll values during name generation.
  class LetterBlock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @start_probabilities = []
      (_root.letter_count).times { |i|
        @start_probabilities << @_io.read_f4le
      }
      @middle_probabilities = []
      (_root.letter_count).times { |i|
        @middle_probabilities << @_io.read_f4le
      }
      @end_probabilities = []
      (_root.letter_count).times { |i|
        @end_probabilities << @_io.read_f4le
      }
      self
    end

    ##
    # Array of start probabilities. One float per character in alphabet.
    # Probability of each letter starting a name (no context for singles,
    # after previous character for doubles, after previous two for triples).
    attr_reader :start_probabilities

    ##
    # Array of middle probabilities. One float per character in alphabet.
    # Probability of each letter appearing in the middle of a name.
    attr_reader :middle_probabilities

    ##
    # Array of end probabilities. One float per character in alphabet.
    # Probability of each letter ending a name.
    attr_reader :end_probabilities
  end

  ##
  # Two-dimensional array of triple-letter blocks. letter_count × letter_count blocks total.
  # Each block is indexed by the previous two characters (context length 2).
  class TripleLetterBlocksArray < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @rows = []
      (_root.letter_count).times { |i|
        @rows << TripleLetterRow.new(@_io, self, @_root)
      }
      self
    end

    ##
    # Array of letter_count rows, each containing letter_count blocks.
    # First index corresponds to the second-to-last character.
    # Second index corresponds to the last character.
    attr_reader :rows
  end

  ##
  # A row in the triple-letter blocks array. Contains letter_count blocks,
  # each indexed by the last character in the two-character context.
  class TripleLetterRow < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @blocks = []
      (_root.letter_count).times { |i|
        @blocks << LetterBlock.new(@_io, self, @_root)
      }
      self
    end

    ##
    # Array of letter_count blocks, each containing start/middle/end probability arrays.
    # Block index corresponds to the last character in the two-character context.
    attr_reader :blocks
  end

  ##
  # File type signature. Must be "LTR " (space-padded) for LTR files.
  attr_reader :file_type

  ##
  # File format version. Must be "V1.0" for LTR files.
  attr_reader :file_version

  ##
  # Number of characters in the alphabet. Must be 26 (NWN) or 28 (KotOR).
  # KotOR uses 28 characters: "abcdefghijklmnopqrstuvwxyz'-"
  # NWN uses 26 characters: "abcdefghijklmnopqrstuvwxyz"
  attr_reader :letter_count

  ##
  # Single-letter probability block (no context).
  # Used for generating the first character of names.
  # Contains start/middle/end probability arrays, each with letter_count floats.
  # Total size: letter_count × 3 × 4 bytes = 336 bytes for KotOR (28 chars).
  attr_reader :single_letter_block

  ##
  # Double-letter probability blocks (1-character context).
  # Array of letter_count blocks, each indexed by the previous character.
  # Used for generating the second character based on the first character.
  # Each block contains start/middle/end probability arrays.
  # Total size: letter_count × 3 × letter_count × 4 bytes = 9,408 bytes for KotOR.
  attr_reader :double_letter_blocks

  ##
  # Triple-letter probability blocks (2-character context).
  # Two-dimensional array of letter_count × letter_count blocks.
  # Each block is indexed by the previous two characters.
  # Used for generating third and subsequent characters.
  # Each block contains start/middle/end probability arrays.
  # Total size: letter_count × letter_count × 3 × letter_count × 4 bytes = 73,472 bytes for KotOR.
  attr_reader :triple_letter_blocks
end
