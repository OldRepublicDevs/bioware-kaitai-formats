-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- Human-readable XML representation of GAM (Game State) binary files.
-- Uses GFF XML structure with <gff3> root element.
-- 
-- Binary format reference: ../gam/gam.ksy
-- 
-- References:
-- - PyKotor wiki (GFF-GAM.md, GFF-File-Format.md)
GamXml = class.class(KaitaiStruct)

function GamXml:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GamXml:_read()
  self.xml_content = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

-- 
-- XML document content as UTF-8 text.

