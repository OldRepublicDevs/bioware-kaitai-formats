-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

NcsMinimal = class.class(KaitaiStruct)

function NcsMinimal:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function NcsMinimal:_read()
  self.file_type = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.file_version = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.size_marker = self._io:read_u1()
  self.total_file_size = self._io:read_u4be()
  self.instructions = {}
  local i = 0
  while true do
    local _ = NcsMinimal.Instruction(self._io, self, self._root)
    self.instructions[i + 1] = _
    if self._io:pos() >= self._root.total_file_size then
      break
    end
    i = i + 1
  end
end


NcsMinimal.Instruction = class.class(KaitaiStruct)

function NcsMinimal.Instruction:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function NcsMinimal.Instruction:_read()
  self.bytecode = self._io:read_u1()
  self.qualifier = self._io:read_u1()
end


