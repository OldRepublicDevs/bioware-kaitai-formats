-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- NSS (NWScript Source) files contain human-readable NWScript source code
-- that compiles to NCS bytecode. NWScript is the scripting language used
-- in KotOR, TSL, and Neverwinter Nights.
-- 
-- NSS files are plain text files (typically Windows-1252 or UTF-8 encoding)
-- containing NWScript source code. The nwscript.nss file defines all
-- engine-exposed functions and constants available to scripts.
-- 
-- Format:
-- - Plain text source code
-- - May include BOM (Byte Order Mark) for UTF-8 files
-- - Lines are typically terminated with CRLF (\r\n) or LF (\n)
-- - Comments: // for single-line, /* */ for multi-line
-- - Preprocessor directives: #include, #define, etc.
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/NSS-File-Format.md
-- - https://github.com/xoreos/xoreos-tools/tree/master/src/nwscript/ (NWScript compiler)
-- - https://github.com/seedhartha/reone/blob/master/src/libs/script/ (Script execution engine)
Nss = class.class(KaitaiStruct)

function Nss:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nss:_read()
  if self._io:pos() == 0 then
    self.bom = self._io:read_u2le()
    if not( ((self.bom == 65279) or (self.bom == 0)) ) then
      error("ValidationNotAnyOfError")
    end
  end
  self.source_code = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

-- 
-- Optional UTF-8 BOM (Byte Order Mark) at the start of the file.
-- If present, will be 0xFEFF (UTF-8 BOM).
-- Most NSS files do not include a BOM.
-- 
-- Complete NWScript source code.
-- Contains function definitions, variable declarations, control flow
-- statements, and engine function calls.
-- 
-- Common elements:
-- - Function definitions: void function_name() { ... }
-- - Variable declarations: int variable_name;
-- - Control flow: if, while, for, switch
-- - Engine function calls: GetFirstObject(), GetObjectByTag(), etc.
-- - Constants: OBJECT_SELF, OBJECT_INVALID, etc.
-- 
-- The source code is compiled to NCS bytecode by the NWScript compiler.

-- 
-- NWScript source code structure.
-- This is primarily a text format, so the main content is the source_code string.
-- 
-- The source can be parsed into:
-- - Tokens (keywords, identifiers, operators, literals)
-- - Statements (declarations, assignments, control flow)
-- - Functions (definitions with parameters and body)
-- - Preprocessor directives (#include, #define)
Nss.NssSource = class.class(KaitaiStruct)

function Nss.NssSource:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Nss.NssSource:_read()
  self.content = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

-- 
-- Complete source code content.

