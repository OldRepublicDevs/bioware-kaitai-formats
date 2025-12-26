<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * IFO (Module Information) files store module metadata including entry points,
 * starting locations, and module properties.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * IFO Root Struct Fields:
 * - Mod_ID (ResRef): Module identifier
 * - Mod_Name (LocalizedString): Module display name
 * - Mod_Entry_Area (ResRef): Starting area
 * - Mod_Entry_X, Mod_Entry_Y, Mod_Entry_Z (Float): Starting position
 * - Mod_Entry_Dir_X, Mod_Entry_Dir_Y (Float): Starting orientation
 * - Mod_OnHeartbeat, Mod_OnModLoad, Mod_OnModStart (ResRef): Script hooks
 * - Mod_MinGameVer (String): Minimum game version required
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-IFO.md
 */

namespace {
    class Ifo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Ifo $_root = null) {
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
            $this->_m_fileTypeValid = $this->gffData()->header()->fileType() == "IFO ";
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
