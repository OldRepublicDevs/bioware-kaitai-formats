<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * GAM (Game State) files are GFF-based format files that store game state information
 * including party members, global variables, game time, and time played.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds GAM-specific
 * validation and documentation.
 * 
 * GAM files are used by:
 * - Aurora Engine (Neverwinter Nights, Neverwinter Nights 2)
 * - Infinity Engine (Mass Effect, Dragon Age Origins, Dragon Age 2)
 * 
 * NOTE: Odyssey Engine (Knights of the Old Republic) does NOT use GAM format -
 * it uses NFO format for save games instead.
 * 
 * GAM Root Struct Fields:
 * - GameTimeHour, GameTimeMinute, GameTimeSecond, GameTimeMillisecond (Int32): Game time
 * - TimePlayed (Int32): Total playtime in seconds
 * - PartyList (List): Party member ResRefs
 * - GlobalBooleans, GlobalNumbers, GlobalStrings (Lists): Global variable storage
 * 
 * Aurora-specific: ModuleName, CurrentArea, PlayerCharacter
 * Infinity-specific: GameName, Chapter, JournalEntries
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GAM.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 */

namespace {
    class Gam extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Gam $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_gffData = new \Gff($this->_io);
        }
        protected $_m_fileTypeValid;

        /**
         * Validates that this is a GAM file (file type must be "GAM ")
         */
        public function fileTypeValid() {
            if ($this->_m_fileTypeValid !== null)
                return $this->_m_fileTypeValid;
            $this->_m_fileTypeValid = $this->gffData()->header()->fileType() == "GAM ";
            return $this->_m_fileTypeValid;
        }
        protected $_m_versionValid;

        /**
         * Validates GFF version is supported
         */
        public function versionValid() {
            if ($this->_m_versionValid !== null)
                return $this->_m_versionValid;
            $this->_m_versionValid =  (($this->gffData()->header()->fileVersion() == "V3.2") || ($this->gffData()->header()->fileVersion() == "V3.3") || ($this->gffData()->header()->fileVersion() == "V4.0") || ($this->gffData()->header()->fileVersion() == "V4.1")) ;
            return $this->_m_versionValid;
        }
        protected $_m_gffData;

        /**
         * Complete GFF structure. GAM files use standard GFF format with "GAM " file type.
         * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
         */
        public function gffData() { return $this->_m_gffData; }
    }
}
