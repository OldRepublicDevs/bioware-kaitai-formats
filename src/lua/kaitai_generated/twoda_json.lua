-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- TwoDA JSON format is a human-readable JSON representation of TwoDA files.
-- Provides easier editing and interoperability with modern tools than binary TwoDA format.
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
TwodaJson = class.class(KaitaiStruct)

function TwodaJson:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TwodaJson:_read()
  self.json_content = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

-- 
-- JSON document content as UTF-8 text.

