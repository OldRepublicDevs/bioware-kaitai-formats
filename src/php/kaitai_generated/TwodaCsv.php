<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * TwoDA CSV format is a human-readable CSV (Comma-Separated Values) representation of TwoDA files.
 * Provides easier editing in spreadsheet applications than binary TwoDA format.
 * 
 * Each row represents a data row, with the first row containing column headers.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
 */

namespace {
    class TwodaCsv extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\TwodaCsv $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_csvContent = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_csvContent;

        /**
         * CSV text content with rows separated by newlines and columns by commas
         */
        public function csvContent() { return $this->_m_csvContent; }
    }
}
