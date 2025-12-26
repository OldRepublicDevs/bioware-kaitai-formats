<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * BZF (BioWare Zipped File) files are LZMA-compressed BIF files used primarily in iOS
 * (and maybe Android) ports of KotOR. The BZF header contains "BZF " + "V1.0", followed
 * by LZMA-compressed BIF data. Decompression reveals a standard BIF structure.
 * 
 * Format Structure:
 * - Header (8 bytes): File type signature "BZF " and version "V1.0"
 * - Compressed Data: LZMA-compressed BIF file data
 * 
 * After decompression, the data follows the standard BIF format structure.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/BIF-File-Format.md - BZF compression section
 * - BIF.ksy - Standard BIF format (decompressed BZF data matches this)
 */

namespace {
    class Bzf extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Bzf $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fileType = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            if (!($this->_m_fileType == "BZF ")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("BZF ", $this->_m_fileType, $this->_io, "/seq/0");
            }
            $this->_m_version = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            if (!($this->_m_version == "V1.0")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("V1.0", $this->_m_version, $this->_io, "/seq/1");
            }
            $this->_m_compressedData = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_compressedData[] = $this->_io->readU1();
                $i++;
            }
        }
        protected $_m_fileType;
        protected $_m_version;
        protected $_m_compressedData;

        /**
         * File type signature. Must be "BZF " for compressed BIF files.
         */
        public function fileType() { return $this->_m_fileType; }

        /**
         * File format version. Always "V1.0" for BZF files.
         */
        public function version() { return $this->_m_version; }

        /**
         * LZMA-compressed BIF file data.
         * This data must be decompressed using LZMA algorithm to obtain the standard BIF structure.
         * After decompression, the data can be parsed using the BIF format definition.
         */
        public function compressedData() { return $this->_m_compressedData; }
    }
}
