<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Human-readable XML representation of UTC (Creature Template) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../utc/utc.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-UTC.md, GFF-File-Format.md)
 */

namespace {
    class UtcXml extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\UtcXml $_root = null) {
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
