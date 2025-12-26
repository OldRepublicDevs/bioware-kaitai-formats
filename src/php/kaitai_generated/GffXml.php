<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * GFF XML format is a human-readable XML representation of GFF (Generic File Format) binary files.
 * Used by xoreos-tools and other modding tools for easier editing than binary GFF format.
 * 
 * The XML format represents the hierarchical GFF structure using XML elements:
 * - Root element: <gff3>
 * - Contains a <struct> element with id attribute
 * - Struct contains field elements (byte, uint32, exostring, locstring, resref, list, etc.)
 * - Each field has a label attribute
 * - Lists contain nested <struct> elements
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 * - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffdumper.cpp
 * - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffcreator.cpp
 */

namespace {
    class GffXml extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\GffXml $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_xmlContent = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_xmlContent;

        /**
         * XML document content as UTF-8 text.
         * Structure: <gff3><struct id="...">...</struct></gff3>
         * Note: Kaitai Struct has limited XML parsing capabilities. For full XML parsing,
         * use an XML parser library. This definition serves as a format identifier.
         */
        public function xmlContent() { return $this->_m_xmlContent; }
    }
}
