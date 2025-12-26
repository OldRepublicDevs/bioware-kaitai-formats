<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * DLG (Dialogue) files are GFF-based format files that store conversation trees with entries, replies,
 * links, and conversation metadata for Odyssey and Aurora engines.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds DLG-specific
 * validation and documentation.
 * 
 * DLG files contain:
 * - Root struct with conversation metadata (NumWords, Skippable, ConversationType, etc.)
 * - EntryList: Array of dialogue entries (NPC lines)
 * - ReplyList: Array of reply options (player responses)
 * - StartingList: Array of entry points into conversation tree
 * - StuntList: Array of cutscene/animation sequences
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-DLG.md
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/dlg/
 */

namespace {
    class Dlg extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Dlg $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_gffData = new \Gff($this->_io);
        }
        protected $_m_fileTypeValid;

        /**
         * Validates DLG file type
         */
        public function fileTypeValid() {
            if ($this->_m_fileTypeValid !== null)
                return $this->_m_fileTypeValid;
            $this->_m_fileTypeValid = $this->gffData()->header()->fileType() == "DLG ";
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
         * Complete GFF structure with "DLG " file type
         */
        public function gffData() { return $this->_m_gffData; }
    }
}
