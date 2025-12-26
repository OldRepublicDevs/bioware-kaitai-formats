<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * TwoDA JSON format is a human-readable JSON representation of TwoDA files.
 * Provides easier editing and interoperability with modern tools than binary TwoDA format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
 */

namespace {
    class TwodaJson extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\TwodaJson $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_jsonContent = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_jsonContent;

        /**
         * JSON document content as UTF-8 text
         */
        public function jsonContent() { return $this->_m_jsonContent; }
    }
}
