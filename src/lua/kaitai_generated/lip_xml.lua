-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- LIP XML format is a human-readable XML representation of LIP (Lipsync) binary files.
-- Provides easier editing than binary LIP format.
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/lip.py
-- - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/io_lip_xml.py
-- - https://github.com/seedhartha/reone/tree/master/src/libs/graphics/format/lipreader.cpp
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/LIP-File-Format.md
-- - https://github.com/xoreos/xoreos/tree/master/src/graphics/aurora/lipfile.cpp
-- 
-- - ../GFF/GFF
-- - ../GFF/XML/GFF_XML
-- - ../LIP/LIP
LipXml = class.class(KaitaiStruct)

function LipXml:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function LipXml:_read()
  self.xml_content = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

-- 
-- XML document content as UTF-8 text.

