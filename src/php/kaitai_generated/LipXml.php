<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * LIP XML format is a human-readable XML representation of LIP (Lipsync) binary files.
 * Provides easier editing than binary LIP format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/lip.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/io_lip_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/graphics/format/lipreader.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/LIP-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/graphics/aurora/lipfile.cpp
 * 
 * - ../GFF/GFF
 * - ../GFF/XML/GFF_XML
 * - ../LIP/LIP
 */

namespace {
    class LipXml extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\LipXml $_root = null) {
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
