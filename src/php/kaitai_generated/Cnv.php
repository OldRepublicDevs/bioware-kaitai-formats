<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * CNV (Conversation) files are GFF-based format files that store conversation trees with entries, replies,
 * links, and conversation metadata. CNV files use the GFF (Generic File Format) binary structure
 * with file type signature "CNV ".
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds CNV-specific
 * validation and documentation.
 * 
 * CNV files are used by Eclipse Engine games (Dragon Age Origins, Dragon Age 2, Mass Effect, Mass Effect 2).
 * They are similar to DLG files used by Odyssey and Aurora engines but adapted for Eclipse's conversation system.
 * 
 * CNV Root Struct Fields:
 * - NumWords (Int32): Word count for conversation
 * - Skippable (UInt8): Whether conversation can be skipped
 * - ConversationType (Int32): Conversation type identifier
 * - EntryList (List): NPC dialogue lines (CNVEntry structs)
 * - ReplyList (List): Player response options (CNVReply structs)
 * - StartingList (List): Entry points (CNVLink structs)
 * - StuntList (List): Special animations (CNVStunt structs)
 * 
 * Each Entry/Reply contains:
 * - Text (LocalizedString): Dialogue text
 * - Script (ResRef): Conditional/action scripts
 * - Camera settings, animations, links to other nodes
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-CNV.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 */

namespace {
    class Cnv extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Cnv $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_gffData = new \Gff($this->_io);
        }
        protected $_m_fileTypeValid;

        /**
         * Validates that this is a CNV file (file type must be "CNV ")
         */
        public function fileTypeValid() {
            if ($this->_m_fileTypeValid !== null)
                return $this->_m_fileTypeValid;
            $this->_m_fileTypeValid = $this->gffData()->header()->fileType() == "CNV ";
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
         * Complete GFF structure. CNV files use standard GFF format with "CNV " file type.
         * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
         */
        public function gffData() { return $this->_m_gffData; }
    }
}
