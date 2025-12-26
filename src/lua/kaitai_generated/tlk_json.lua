-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- TLK JSON format is a human-readable JSON representation of TLK (Talk Table) binary files.
-- Provides easier editing and translation than binary TLK format.
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/io_tlk_xml.py
TlkJson = class.class(KaitaiStruct)

function TlkJson:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TlkJson:_read()
  self.json_content = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

-- 
-- JSON document content as UTF-8 text.

