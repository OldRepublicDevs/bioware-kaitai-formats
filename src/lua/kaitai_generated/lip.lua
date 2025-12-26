-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")

-- 
-- LIP (LIP Synchronization) files drive mouth animation for voiced dialogue in BioWare games.
-- Each file contains a compact series of keyframes that map timestamps to discrete viseme
-- (mouth shape) indices so that the engine can interpolate character lip movement while
-- playing the companion WAV audio line.
-- 
-- LIP files are always binary and contain only animation data. They are paired with WAV
-- voice-over resources of identical duration; the LIP length field must match the WAV
-- playback time for glitch-free animation.
-- 
-- Keyframes are sorted chronologically and store a timestamp (float seconds) plus a
-- 1-byte viseme index (0-15). The format uses the 16-shape Preston Blair phoneme set.
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/LIP-File-Format.md
-- - https://github.com/seedhartha/reone/blob/master/src/libs/graphics/format/lipreader.cpp:27-42
-- - https://github.com/xoreos/xoreos/blob/master/src/graphics/aurora/lipfile.cpp
-- - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/LIPObject.ts:93-146
Lip = class.class(KaitaiStruct)

Lip.LipShapes = enum.Enum {
  neutral = 0,
  ee = 1,
  eh = 2,
  ah = 3,
  oh = 4,
  ooh = 5,
  y = 6,
  sts = 7,
  fv = 8,
  ng = 9,
  th = 10,
  mpb = 11,
  td = 12,
  sh = 13,
  l = 14,
  kg = 15,
}

function Lip:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lip:_read()
  self.file_type = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.file_version = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.length = self._io:read_f4le()
  self.num_keyframes = self._io:read_u4le()
  self.keyframes = {}
  for i = 0, self.num_keyframes - 1 do
    self.keyframes[i + 1] = Lip.KeyframeEntry(self._io, self, self._root)
  end
end

-- 
-- File type signature. Must be "LIP " (space-padded) for LIP files.
-- 
-- File format version. Must be "V1.0" for LIP files.
-- 
-- Duration in seconds. Must equal the paired WAV file playback time for
-- glitch-free animation. This is the total length of the lip sync animation.
-- 
-- Number of keyframes immediately following. Each keyframe contains a timestamp
-- and a viseme shape index. Keyframes should be sorted ascending by timestamp.
-- 
-- Array of keyframe entries. Each entry maps a timestamp to a mouth shape.
-- Entries must be stored in chronological order (ascending by timestamp).

-- 
-- A single keyframe entry mapping a timestamp to a viseme (mouth shape).
-- Keyframes are used by the engine to interpolate between mouth shapes during
-- audio playback to create lip sync animation.
Lip.KeyframeEntry = class.class(KaitaiStruct)

function Lip.KeyframeEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Lip.KeyframeEntry:_read()
  self.timestamp = self._io:read_f4le()
  self.shape = Lip.LipShapes(self._io:read_u1())
end

-- 
-- Seconds from animation start. Must be >= 0 and <= length.
-- Keyframes should be sorted ascending by timestamp.
-- 
-- Viseme index (0-15) indicating which mouth shape to use at this timestamp.
-- Uses the 16-shape Preston Blair phoneme set. See lip_shapes enum for details.

