-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- CNV (Conversation) files are GFF-based format files that store conversation trees with entries, replies,
-- links, and conversation metadata. CNV files use the GFF (Generic File Format) binary structure
-- with file type signature "CNV ".
-- 
-- This format inherits the complete GFF structure from gff.ksy and adds CNV-specific
-- validation and documentation.
-- 
-- CNV files are used by Eclipse Engine games (Dragon Age Origins, Dragon Age 2, Mass Effect, Mass Effect 2).
-- They are similar to DLG files used by Odyssey and Aurora engines but adapted for Eclipse's conversation system.
-- 
-- CNV Root Struct Fields:
-- - NumWords (Int32): Word count for conversation
-- - Skippable (UInt8): Whether conversation can be skipped
-- - ConversationType (Int32): Conversation type identifier
-- - EntryList (List): NPC dialogue lines (CNVEntry structs)
-- - ReplyList (List): Player response options (CNVReply structs)
-- - StartingList (List): Entry points (CNVLink structs)
-- - StuntList (List): Special animations (CNVStunt structs)
-- 
-- Each Entry/Reply contains:
-- - Text (LocalizedString): Dialogue text
-- - Script (ResRef): Conditional/action scripts
-- - Camera settings, animations, links to other nodes
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-CNV.md
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
Cnv = class.class(KaitaiStruct)

function Cnv:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Cnv:_read()
  self.gff_data = Gff(self._io)
end

-- 
-- Validates that this is a CNV file (file type must be "CNV ").
Cnv.property.file_type_valid = {}
function Cnv.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "CNV "
  return self._m_file_type_valid
end

-- 
-- Validates GFF version is supported.
Cnv.property.version_valid = {}
function Cnv.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3") or (self.gff_data.header.file_version == "V4.0") or (self.gff_data.header.file_version == "V4.1")) 
  return self._m_version_valid
end

-- 
-- Complete GFF structure. CNV files use standard GFF format with "CNV " file type.
-- Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.

