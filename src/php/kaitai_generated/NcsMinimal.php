<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class NcsMinimal extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\NcsMinimal $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fileType = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            $this->_m_fileVersion = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            $this->_m_sizeMarker = $this->_io->readU1();
            $this->_m_totalFileSize = $this->_io->readU4be();
            $this->_m_instructions = [];
            $i = 0;
            do {
                $_ = new \NcsMinimal\Instruction($this->_io, $this, $this->_root);
                $this->_m_instructions[] = $_;
                $i++;
            } while (!($this->_io()->pos() >= $this->_root()->totalFileSize()));
        }
        protected $_m_fileType;
        protected $_m_fileVersion;
        protected $_m_sizeMarker;
        protected $_m_totalFileSize;
        protected $_m_instructions;
        public function fileType() { return $this->_m_fileType; }
        public function fileVersion() { return $this->_m_fileVersion; }
        public function sizeMarker() { return $this->_m_sizeMarker; }
        public function totalFileSize() { return $this->_m_totalFileSize; }
        public function instructions() { return $this->_m_instructions; }
    }
}

namespace NcsMinimal {
    class Instruction extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\NcsMinimal $_parent = null, ?\NcsMinimal $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_bytecode = $this->_io->readU1();
            $this->_m_qualifier = $this->_io->readU1();
        }
        protected $_m_bytecode;
        protected $_m_qualifier;
        public function bytecode() { return $this->_m_bytecode; }
        public function qualifier() { return $this->_m_qualifier; }
    }
}
