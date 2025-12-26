-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- TwoDA CSV format is a human-readable CSV (Comma-Separated Values) representation of TwoDA files.
-- Provides easier editing in spreadsheet applications than binary TwoDA format.
-- 
-- Each row represents a data row, with the first row containing column headers.
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
TwodaCsv = class.class(KaitaiStruct)

function TwodaCsv:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TwodaCsv:_read()
  self.csv_content = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

-- 
-- CSV text content with rows separated by newlines and columns by commas.

