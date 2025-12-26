-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- ITP XML format is a human-readable XML representation of ITP (Palette) binary files.
-- ITP files use GFF format (FileType "ITP " in GFF header).
-- Uses GFF XML structure with root element <gff3> containing <struct> elements.
-- Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/itp/itp.py
-- - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
-- - https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/gff/itp.cpp
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/ITP-File-Format.md
-- - https://github.com/xoreos/xoreos/tree/master/src/aurora/gff3file.cpp
ItpXml = class.class(KaitaiStruct)

function ItpXml:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ItpXml:_read()
  self.xml_content = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

-- 
-- XML document content as UTF-8 text.

