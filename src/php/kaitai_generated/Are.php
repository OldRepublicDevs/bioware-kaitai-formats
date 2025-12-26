<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * ARE (Area) files are GFF-based format files that store static area information including
 * lighting, fog, grass, weather, script hooks, and map data. ARE files use the GFF (Generic File Format)
 * binary structure with file type signature "ARE ".
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds ARE-specific
 * validation and documentation.
 * 
 * ARE Root Struct Fields (Common):
 * - "Tag" (String): Unique area identifier
 * - "Name" (LocalizedString): Area display name
 * - "SunAmbientColor", "SunDiffuseColor" (UInt32): Lighting colors (BGR format)
 * - "SunFogOn", "SunFogNear", "SunFogFar", "SunFogColor": Fog settings
 * - "Grass_*": Grass rendering properties
 * - "OnEnter", "OnExit", "OnHeartbeat", "OnUserDefined": Script hooks (ResRef)
 * - "Map" (Struct): Minimap coordinate mapping
 * - "Rooms" (List): Audio zones and weather regions
 * 
 * KotOR 2 adds weather fields:
 * - "ChanceRain", "ChanceSnow", "ChanceLightning" (Int32)
 * - "Dirty*" fields for dust particle effects
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-ARE.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/are.py
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/are.cpp
 */

namespace {
    class Are extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Are $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_gffData = new \Gff($this->_io);
        }
        protected $_m_fileTypeValid;

        /**
         * Validates that this is an ARE file (file type must be "ARE ")
         */
        public function fileTypeValid() {
            if ($this->_m_fileTypeValid !== null)
                return $this->_m_fileTypeValid;
            $this->_m_fileTypeValid = $this->gffData()->header()->fileType() == "ARE ";
            return $this->_m_fileTypeValid;
        }
        protected $_m_versionValid;

        /**
         * Validates GFF version is supported
         */
        public function versionValid() {
            if ($this->_m_versionValid !== null)
                return $this->_m_versionValid;
            $this->_m_versionValid =  (($this->gffData()->header()->fileVersion() == "V3.2") || ($this->gffData()->header()->fileVersion() == "V3.3") || ($this->gffData()->header()->fileVersion() == "V4.0") || ($this->gffData()->header()->fileVersion() == "V4.1")) ;
            return $this->_m_versionValid;
        }
        protected $_m_gffData;

        /**
         * Complete GFF structure. ARE files use standard GFF format with "ARE " file type.
         * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
         */
        public function gffData() { return $this->_m_gffData; }
    }
}
