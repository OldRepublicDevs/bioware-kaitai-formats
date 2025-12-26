-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- DLG (Dialogue) files are GFF-based format files that store conversation trees with entries, replies,
-- links, and conversation metadata for Odyssey and Aurora engines.
-- 
-- This format inherits the complete GFF structure from gff.ksy and adds DLG-specific
-- validation and documentation.
-- 
-- DLG files contain:
-- - Root struct with conversation metadata (NumWords, Skippable, ConversationType, etc.)
-- - EntryList: Array of dialogue entries (NPC lines)
-- - ReplyList: Array of reply options (player responses)
-- - StartingList: Array of entry points into conversation tree
-- - StuntList: Array of cutscene/animation sequences
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-DLG.md
-- - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/dlg/
Dlg = class.class(KaitaiStruct)

function Dlg:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dlg:_read()
  self.gff_data = Gff(self._io)
end

-- 
-- Validates DLG file type.
Dlg.property.file_type_valid = {}
function Dlg.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "DLG "
  return self._m_file_type_valid
end

-- 
-- Validates GFF version.
Dlg.property.version_valid = {}
function Dlg.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3") or (self.gff_data.header.file_version == "V4.0") or (self.gff_data.header.file_version == "V4.1")) 
  return self._m_version_valid
end

-- 
-- Complete GFF structure with "DLG " file type.

