<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * LIP (LIP Synchronization) files drive mouth animation for voiced dialogue in BioWare games.
 * Each file contains a compact series of keyframes that map timestamps to discrete viseme
 * (mouth shape) indices so that the engine can interpolate character lip movement while
 * playing the companion WAV audio line.
 * 
 * LIP files are always binary and contain only animation data. They are paired with WAV
 * voice-over resources of identical duration; the LIP length field must match the WAV
 * playback time for glitch-free animation.
 * 
 * Keyframes are sorted chronologically and store a timestamp (float seconds) plus a
 * 1-byte viseme index (0-15). The format uses the 16-shape Preston Blair phoneme set.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/LIP-File-Format.md
 * - https://github.com/seedhartha/reone/blob/master/src/libs/graphics/format/lipreader.cpp:27-42
 * - https://github.com/xoreos/xoreos/blob/master/src/graphics/aurora/lipfile.cpp
 * - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/LIPObject.ts:93-146
 */

namespace {
    class Lip extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Lip $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fileType = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            $this->_m_fileVersion = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            $this->_m_length = $this->_io->readF4le();
            $this->_m_numKeyframes = $this->_io->readU4le();
            $this->_m_keyframes = [];
            $n = $this->numKeyframes();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_keyframes[] = new \Lip\KeyframeEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_fileType;
        protected $_m_fileVersion;
        protected $_m_length;
        protected $_m_numKeyframes;
        protected $_m_keyframes;

        /**
         * File type signature. Must be "LIP " (space-padded) for LIP files.
         */
        public function fileType() { return $this->_m_fileType; }

        /**
         * File format version. Must be "V1.0" for LIP files.
         */
        public function fileVersion() { return $this->_m_fileVersion; }

        /**
         * Duration in seconds. Must equal the paired WAV file playback time for
         * glitch-free animation. This is the total length of the lip sync animation.
         */
        public function length() { return $this->_m_length; }

        /**
         * Number of keyframes immediately following. Each keyframe contains a timestamp
         * and a viseme shape index. Keyframes should be sorted ascending by timestamp.
         */
        public function numKeyframes() { return $this->_m_numKeyframes; }

        /**
         * Array of keyframe entries. Each entry maps a timestamp to a mouth shape.
         * Entries must be stored in chronological order (ascending by timestamp).
         */
        public function keyframes() { return $this->_m_keyframes; }
    }
}

/**
 * A single keyframe entry mapping a timestamp to a viseme (mouth shape).
 * Keyframes are used by the engine to interpolate between mouth shapes during
 * audio playback to create lip sync animation.
 */

namespace Lip {
    class KeyframeEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Lip $_parent = null, ?\Lip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_timestamp = $this->_io->readF4le();
            $this->_m_shape = $this->_io->readU1();
        }
        protected $_m_timestamp;
        protected $_m_shape;

        /**
         * Seconds from animation start. Must be >= 0 and <= length.
         * Keyframes should be sorted ascending by timestamp.
         */
        public function timestamp() { return $this->_m_timestamp; }

        /**
         * Viseme index (0-15) indicating which mouth shape to use at this timestamp.
         * Uses the 16-shape Preston Blair phoneme set. See lip_shapes enum for details.
         */
        public function shape() { return $this->_m_shape; }
    }
}

namespace Lip {
    class LipShapes {
        const NEUTRAL = 0;
        const EE = 1;
        const EH = 2;
        const AH = 3;
        const OH = 4;
        const OOH = 5;
        const Y = 6;
        const STS = 7;
        const FV = 8;
        const NG = 9;
        const TH = 10;
        const MPB = 11;
        const TD = 12;
        const SH = 13;
        const L = 14;
        const KG = 15;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
