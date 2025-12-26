-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- Human-readable XML representation of UTC (Creature Template) binary files.
-- Uses GFF XML structure with <gff3> root element.
-- 
-- Binary format reference: ../utc/utc.ksy
-- 
-- References:
-- - PyKotor wiki (GFF-UTC.md, GFF-File-Format.md)
UtcXml = class.class(KaitaiStruct)

function UtcXml:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function UtcXml:_read()
  self.xml_content = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

-- 
-- XML document content as UTF-8 text.

