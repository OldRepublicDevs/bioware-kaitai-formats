-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- SSF XML format is a human-readable XML representation of SSF (Soundset) binary files.
-- Provides easier editing than binary SSF format.
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf.py
-- - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/io_ssf_xml.py
-- - https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/ssf.cpp
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/SSF-File-Format.md
-- - https://github.com/xoreos/xoreos/tree/master/src/aurora/ssffile.cpp
SsfXml = class.class(KaitaiStruct)

function SsfXml:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SsfXml:_read()
  self.xml_content = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

-- 
-- XML document content as UTF-8 text.

