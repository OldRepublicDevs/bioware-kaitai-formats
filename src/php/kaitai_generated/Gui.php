<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * GUI (Graphical User Interface) files define UI layouts, controls, and properties.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * GUI Root Struct Fields:
 * - CONTROLS (List): UI control elements (buttons, labels, listboxes, etc.)
 * - Each control contains:
 *   - CONTROLTYPE (Int32): Control type (button=4, label=5, listbox=9, etc.)
 *   - TAG (String): Control identifier
 *   - X, Y, WIDTH, HEIGHT (Int32): Position and size
 *   - TEXT (Struct): Text properties with STRREF, color, alignment
 *   - BORDER (Struct): Border properties
 *   - EXTENT (Struct): Dimensions
 *   - Various control-specific fields
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GUI.md
 */

namespace {
    class Gui extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Gui $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_gffData = new \Gff($this->_io);
        }
        protected $_m_fileTypeValid;
        public function fileTypeValid() {
            if ($this->_m_fileTypeValid !== null)
                return $this->_m_fileTypeValid;
            $this->_m_fileTypeValid = $this->gffData()->header()->fileType() == "GUI ";
            return $this->_m_fileTypeValid;
        }
        protected $_m_versionValid;
        public function versionValid() {
            if ($this->_m_versionValid !== null)
                return $this->_m_versionValid;
            $this->_m_versionValid =  (($this->gffData()->header()->fileVersion() == "V3.2") || ($this->gffData()->header()->fileVersion() == "V3.3") || ($this->gffData()->header()->fileVersion() == "V4.0") || ($this->gffData()->header()->fileVersion() == "V4.1")) ;
            return $this->_m_versionValid;
        }
        protected $_m_gffData;
        public function gffData() { return $this->_m_gffData; }
    }
}
