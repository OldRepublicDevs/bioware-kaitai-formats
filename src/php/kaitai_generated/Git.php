<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * GIT (Game Instance Template) files store dynamic area instance data including
 * placed creatures, placeables, doors, triggers, waypoints, sounds, stores, and encounters.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * GIT Root Struct Fields:
 * - CreatureList (List): Placed creatures with positions, orientations
 * - DoorList (List): Placed doors with states, scripts
 * - PlaceableList (List): Placed placeables (chests, etc.)
 * - TriggerList (List): Trigger zones
 * - WaypointList (List): Navigation waypoints
 * - SoundList (List): Ambient sounds
 * - StoreList (List): Merchant shops
 * - EncounterList (List): Spawn encounters
 * - CameraList (List): Camera points
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GIT.md
 */

namespace {
    class Git extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Git $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_gffData = new \Gff($this->_io);
        }
        protected $_m_fileTypeValid;
        public function fileTypeValid() {
            if ($this->_m_fileTypeValid !== null)
                return $this->_m_fileTypeValid;
            $this->_m_fileTypeValid = $this->gffData()->header()->fileType() == "GIT ";
            return $this->_m_fileTypeValid;
        }
        protected $_m_versionValid;
        public function versionValid() {
            if ($this->_m_versionValid !== null)
                return $this->_m_versionValid;
            $this->_m_versionValid =  (($this->gffData()->header()->fileVersion() == "V3.2") || ($this->gffData()->header()->fileVersion() == "V3.3") || ($this->gffData()->header()->fileVersion() == "V4.0") || ($this->gffData()->header()->fileVersion() == "V4.1")) ;
            return $this->_m_versionValid;
        }
        protected $_m_gffData;
        public function gffData() { return $this->_m_gffData; }
    }
}
