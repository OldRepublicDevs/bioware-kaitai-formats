<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * FAC (Faction) files are GFF-based format files that store faction relationships,
 * reputation values, and faction metadata.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds FAC-specific
 * validation and documentation.
 * 
 * FAC Root Struct Fields:
 * - FactionName (String): Faction identifier
 * - FactionParentID (UInt16): Parent faction ID
 * - FactionGlobal (UInt16): Global faction flag
 * - RepList (List): Reputation values with other factions
 *   - FactionID (UInt32): Target faction ID
 *   - FactionRep (UInt32): Reputation value (0-100)
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-FAC.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/fac.py
 */

namespace {
    class Fac extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Fac $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_gffData = new \Gff($this->_io);
        }
        protected $_m_fileTypeValid;

        /**
         * Validates FAC file type
         */
        public function fileTypeValid() {
            if ($this->_m_fileTypeValid !== null)
                return $this->_m_fileTypeValid;
            $this->_m_fileTypeValid = $this->gffData()->header()->fileType() == "FAC ";
            return $this->_m_fileTypeValid;
        }
        protected $_m_versionValid;

        /**
         * Validates GFF version
         */
        public function versionValid() {
            if ($this->_m_versionValid !== null)
                return $this->_m_versionValid;
            $this->_m_versionValid =  (($this->gffData()->header()->fileVersion() == "V3.2") || ($this->gffData()->header()->fileVersion() == "V3.3") || ($this->gffData()->header()->fileVersion() == "V4.0") || ($this->gffData()->header()->fileVersion() == "V4.1")) ;
            return $this->_m_versionValid;
        }
        protected $_m_gffData;

        /**
         * Complete GFF structure with "FAC " file type
         */
        public function gffData() { return $this->_m_gffData; }
    }
}
