<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * UTT (Trigger Template) files define trigger zones and their properties.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTT Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Trigger name
 * - Geometry (List): Trigger zone vertices
 * - TriggerType, Cursor, Faction: Trigger behavior
 * - Script hooks: OnClick, OnDisarm, OnHeartbeat, OnTrapTriggered, OnUserDefined
 */

namespace {
    class Utt extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Utt $_root = null) {
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
            $this->_m_fileTypeValid = $this->gffData()->header()->fileType() == "UTT ";
            return $this->_m_fileTypeValid;
        }
        protected $_m_versionValid;
        public function versionValid() {
            if ($this->_m_versionValid !== null)
                return $this->_m_versionValid;
            $this->_m_versionValid =  (($this->gffData()->header()->fileVersion() == "V3.2") || ($this->gffData()->header()->fileVersion() == "V3.3")) ;
            return $this->_m_versionValid;
        }
        protected $_m_gffData;
        public function gffData() { return $this->_m_gffData; }
    }
}
