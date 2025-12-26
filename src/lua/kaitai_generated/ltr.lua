-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- LTR (Letter) resources store third-order Markov chain probability tables that the game uses
-- to procedurally generate NPC names. The data encodes likelihoods for characters appearing at
-- the start, middle, and end of names given zero, one, or two-character context.
-- 
-- KotOR always uses the 28-character alphabet (a-z plus ' and -). Neverwinter Nights (NWN) used
-- 26 characters; the header explicitly stores the count. This is a KotOR-specific difference from NWN.
-- 
-- LTR files are binary and consist of a short header followed by three probability tables
-- (singles, doubles, triples) stored as contiguous float arrays.
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/LTR-File-Format.md
-- - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/ltrreader.cpp:27-74
-- - https://github.com/xoreos/xoreos/blob/master/src/aurora/ltrfile.cpp:135-168
-- - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/LTRObject.ts:61-117
Ltr = class.class(KaitaiStruct)

function Ltr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ltr:_read()
  self.file_type = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.file_version = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.letter_count = self._io:read_u1()
  self.single_letter_block = Ltr.LetterBlock(self._io, self, self._root)
  self.double_letter_blocks = Ltr.DoubleLetterBlocksArray(self._io, self, self._root)
  self.triple_letter_blocks = Ltr.TripleLetterBlocksArray(self._io, self, self._root)
end

-- 
-- File type signature. Must be "LTR " (space-padded) for LTR files.
-- 
-- File format version. Must be "V1.0" for LTR files.
-- 
-- Number of characters in the alphabet. Must be 26 (NWN) or 28 (KotOR).
-- KotOR uses 28 characters: "abcdefghijklmnopqrstuvwxyz'-"
-- NWN uses 26 characters: "abcdefghijklmnopqrstuvwxyz"
-- 
-- Single-letter probability block (no context).
-- Used for generating the first character of names.
-- Contains start/middle/end probability arrays, each with letter_count floats.
-- Total size: letter_count × 3 × 4 bytes = 336 bytes for KotOR (28 chars).
-- 
-- Double-letter probability blocks (1-character context).
-- Array of letter_count blocks, each indexed by the previous character.
-- Used for generating the second character based on the first character.
-- Each block contains start/middle/end probability arrays.
-- Total size: letter_count × 3 × letter_count × 4 bytes = 9,408 bytes for KotOR.
-- 
-- Triple-letter probability blocks (2-character context).
-- Two-dimensional array of letter_count × letter_count blocks.
-- Each block is indexed by the previous two characters.
-- Used for generating third and subsequent characters.
-- Each block contains start/middle/end probability arrays.
-- Total size: letter_count × letter_count × 3 × letter_count × 4 bytes = 73,472 bytes for KotOR.

-- 
-- Array of double-letter blocks. One block per character in the alphabet.
-- Each block is indexed by the previous character (context length 1).
Ltr.DoubleLetterBlocksArray = class.class(KaitaiStruct)

function Ltr.DoubleLetterBlocksArray:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ltr.DoubleLetterBlocksArray:_read()
  self.blocks = {}
  for i = 0, self._root.letter_count - 1 do
    self.blocks[i + 1] = Ltr.LetterBlock(self._io, self, self._root)
  end
end

-- 
-- Array of letter_count blocks, each containing start/middle/end probability arrays.
-- Block index corresponds to the previous character in the alphabet.

-- 
-- A probability block containing three arrays of probabilities (start, middle, end).
-- Each array has letter_count floats representing cumulative probabilities for each character
-- in the alphabet appearing at that position (start, middle, or end of name).
-- 
-- Blocks store cumulative probabilities (monotonically increasing floats) that are compared
-- against random roll values during name generation.
Ltr.LetterBlock = class.class(KaitaiStruct)

function Ltr.LetterBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ltr.LetterBlock:_read()
  self.start_probabilities = {}
  for i = 0, self._root.letter_count - 1 do
    self.start_probabilities[i + 1] = self._io:read_f4le()
  end
  self.middle_probabilities = {}
  for i = 0, self._root.letter_count - 1 do
    self.middle_probabilities[i + 1] = self._io:read_f4le()
  end
  self.end_probabilities = {}
  for i = 0, self._root.letter_count - 1 do
    self.end_probabilities[i + 1] = self._io:read_f4le()
  end
end

-- 
-- Array of start probabilities. One float per character in alphabet.
-- Probability of each letter starting a name (no context for singles,
-- after previous character for doubles, after previous two for triples).
-- 
-- Array of middle probabilities. One float per character in alphabet.
-- Probability of each letter appearing in the middle of a name.
-- 
-- Array of end probabilities. One float per character in alphabet.
-- Probability of each letter ending a name.

-- 
-- Two-dimensional array of triple-letter blocks. letter_count × letter_count blocks total.
-- Each block is indexed by the previous two characters (context length 2).
Ltr.TripleLetterBlocksArray = class.class(KaitaiStruct)

function Ltr.TripleLetterBlocksArray:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ltr.TripleLetterBlocksArray:_read()
  self.rows = {}
  for i = 0, self._root.letter_count - 1 do
    self.rows[i + 1] = Ltr.TripleLetterRow(self._io, self, self._root)
  end
end

-- 
-- Array of letter_count rows, each containing letter_count blocks.
-- First index corresponds to the second-to-last character.
-- Second index corresponds to the last character.

-- 
-- A row in the triple-letter blocks array. Contains letter_count blocks,
-- each indexed by the last character in the two-character context.
Ltr.TripleLetterRow = class.class(KaitaiStruct)

function Ltr.TripleLetterRow:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ltr.TripleLetterRow:_read()
  self.blocks = {}
  for i = 0, self._root.letter_count - 1 do
    self.blocks[i + 1] = Ltr.LetterBlock(self._io, self, self._root)
  end
end

-- 
-- Array of letter_count blocks, each containing start/middle/end probability arrays.
-- Block index corresponds to the last character in the two-character context.

