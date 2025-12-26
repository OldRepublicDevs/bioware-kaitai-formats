-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- BZF (BioWare Zipped File) files are LZMA-compressed BIF files used primarily in iOS
-- (and maybe Android) ports of KotOR. The BZF header contains "BZF " + "V1.0", followed
-- by LZMA-compressed BIF data. Decompression reveals a standard BIF structure.
-- 
-- Format Structure:
-- - Header (8 bytes): File type signature "BZF " and version "V1.0"
-- - Compressed Data: LZMA-compressed BIF file data
-- 
-- After decompression, the data follows the standard BIF format structure.
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/BIF-File-Format.md - BZF compression section
-- - BIF.ksy - Standard BIF format (decompressed BZF data matches this)
Bzf = class.class(KaitaiStruct)

function Bzf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bzf:_read()
  self.file_type = str_decode.decode(self._io:read_bytes(4), "ASCII")
  if not(self.file_type == "BZF ") then
    error("not equal, expected " .. "BZF " .. ", but got " .. self.file_type)
  end
  self.version = str_decode.decode(self._io:read_bytes(4), "ASCII")
  if not(self.version == "V1.0") then
    error("not equal, expected " .. "V1.0" .. ", but got " .. self.version)
  end
  self.compressed_data = {}
  local i = 0
  while not self._io:is_eof() do
    self.compressed_data[i + 1] = self._io:read_u1()
    i = i + 1
  end
end

-- 
-- File type signature. Must be "BZF " for compressed BIF files.
-- 
-- File format version. Always "V1.0" for BZF files.
-- 
-- LZMA-compressed BIF file data.
-- This data must be decompressed using LZMA algorithm to obtain the standard BIF structure.
-- After decompression, the data can be parsed using the BIF format definition.

