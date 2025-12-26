<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * TLK XML format is a human-readable XML representation of TLK (Talk Table) binary files.
 * Provides easier editing and translation than binary TLK format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/tlk.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/io_tlk_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/resource/format/tlkreader.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/TLK-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/aurora/talktable.cpp
 * 
 * - ../GFF/GFF
 * - ../GFF/XML/GFF_XML
 * - ../TLK/TLK
 */

namespace {
    class TlkXml extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\TlkXml $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_xmlContent = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_xmlContent;

        /**
         * XML document content as UTF-8 text
         */
        public function xmlContent() { return $this->_m_xmlContent; }
    }
}
