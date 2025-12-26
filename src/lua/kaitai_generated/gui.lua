-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("gff")

-- 
-- GUI (Graphical User Interface) files define UI layouts, controls, and properties.
-- 
-- This format inherits the complete GFF structure from gff.ksy.
-- 
-- GUI Root Struct Fields:
-- - CONTROLS (List): UI control elements (buttons, labels, listboxes, etc.)
-- - Each control contains:
--   - CONTROLTYPE (Int32): Control type (button=4, label=5, listbox=9, etc.)
--   - TAG (String): Control identifier
--   - X, Y, WIDTH, HEIGHT (Int32): Position and size
--   - TEXT (Struct): Text properties with STRREF, color, alignment
--   - BORDER (Struct): Border properties
--   - EXTENT (Struct): Dimensions
--   - Various control-specific fields
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GUI.md
Gui = class.class(KaitaiStruct)

function Gui:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gui:_read()
  self.gff_data = Gff(self._io)
end

Gui.property.file_type_valid = {}
function Gui.property.file_type_valid:get()
  if self._m_file_type_valid ~= nil then
    return self._m_file_type_valid
  end

  self._m_file_type_valid = self.gff_data.header.file_type == "GUI "
  return self._m_file_type_valid
end

Gui.property.version_valid = {}
function Gui.property.version_valid:get()
  if self._m_version_valid ~= nil then
    return self._m_version_valid
  end

  self._m_version_valid =  ((self.gff_data.header.file_version == "V3.2") or (self.gff_data.header.file_version == "V3.3") or (self.gff_data.header.file_version == "V4.0") or (self.gff_data.header.file_version == "V4.1")) 
  return self._m_version_valid
end


