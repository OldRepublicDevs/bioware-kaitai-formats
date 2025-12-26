# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# LIP (LIP Synchronization) files drive mouth animation for voiced dialogue in BioWare games.
# Each file contains a compact series of keyframes that map timestamps to discrete viseme
# (mouth shape) indices so that the engine can interpolate character lip movement while
# playing the companion WAV audio line.
# 
# LIP files are always binary and contain only animation data. They are paired with WAV
# voice-over resources of identical duration; the LIP length field must match the WAV
# playback time for glitch-free animation.
# 
# Keyframes are sorted chronologically and store a timestamp (float seconds) plus a
# 1-byte viseme index (0-15). The format uses the 16-shape Preston Blair phoneme set.
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/LIP-File-Format.md
# - https://github.com/seedhartha/reone/blob/master/src/libs/graphics/format/lipreader.cpp:27-42
# - https://github.com/xoreos/xoreos/blob/master/src/graphics/aurora/lipfile.cpp
# - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/LIPObject.ts:93-146
class Lip < Kaitai::Struct::Struct

  LIP_SHAPES = {
    0 => :lip_shapes_neutral,
    1 => :lip_shapes_ee,
    2 => :lip_shapes_eh,
    3 => :lip_shapes_ah,
    4 => :lip_shapes_oh,
    5 => :lip_shapes_ooh,
    6 => :lip_shapes_y,
    7 => :lip_shapes_sts,
    8 => :lip_shapes_fv,
    9 => :lip_shapes_ng,
    10 => :lip_shapes_th,
    11 => :lip_shapes_mpb,
    12 => :lip_shapes_td,
    13 => :lip_shapes_sh,
    14 => :lip_shapes_l,
    15 => :lip_shapes_kg,
  }
  I__LIP_SHAPES = LIP_SHAPES.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @file_type = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
    @file_version = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
    @length = @_io.read_f4le
    @num_keyframes = @_io.read_u4le
    @keyframes = []
    (num_keyframes).times { |i|
      @keyframes << KeyframeEntry.new(@_io, self, @_root)
    }
    self
  end

  ##
  # A single keyframe entry mapping a timestamp to a viseme (mouth shape).
  # Keyframes are used by the engine to interpolate between mouth shapes during
  # audio playback to create lip sync animation.
  class KeyframeEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @timestamp = @_io.read_f4le
      @shape = Kaitai::Struct::Stream::resolve_enum(Lip::LIP_SHAPES, @_io.read_u1)
      self
    end

    ##
    # Seconds from animation start. Must be >= 0 and <= length.
    # Keyframes should be sorted ascending by timestamp.
    attr_reader :timestamp

    ##
    # Viseme index (0-15) indicating which mouth shape to use at this timestamp.
    # Uses the 16-shape Preston Blair phoneme set. See lip_shapes enum for details.
    attr_reader :shape
  end

  ##
  # File type signature. Must be "LIP " (space-padded) for LIP files.
  attr_reader :file_type

  ##
  # File format version. Must be "V1.0" for LIP files.
  attr_reader :file_version

  ##
  # Duration in seconds. Must equal the paired WAV file playback time for
  # glitch-free animation. This is the total length of the lip sync animation.
  attr_reader :length

  ##
  # Number of keyframes immediately following. Each keyframe contains a timestamp
  # and a viseme shape index. Keyframes should be sorted ascending by timestamp.
  attr_reader :num_keyframes

  ##
  # Array of keyframe entries. Each entry maps a timestamp to a mouth shape.
  # Entries must be stored in chronological order (ascending by timestamp).
  attr_reader :keyframes
end
