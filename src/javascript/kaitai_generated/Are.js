// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Are || (root.Are = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Are_, KaitaiStream, Gff_) {
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

var Are = (function() {
  function Are(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Are.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }

  /**
   * Validates that this is an ARE file (file type must be "ARE ")
   */
  Object.defineProperty(Are.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "ARE ";
      return this._m_fileTypeValid;
    }
  });

  /**
   * Convenience access to the decoded GFF root struct (struct_array[0]).
   * Use this to iterate all resolved fields (label + typed value), including:
   * "Tag", "Name", "AlphaTest", "Map" (struct), "Rooms" (list), and all KotOR2/deprecated keys.
   */
  Object.defineProperty(Are.prototype, 'rootStructResolved', {
    get: function() {
      if (this._m_rootStructResolved !== undefined)
        return this._m_rootStructResolved;
      this._m_rootStructResolved = this.gffData.rootStructResolved;
      return this._m_rootStructResolved;
    }
  });

  /**
   * Validates GFF version is supported
   */
  Object.defineProperty(Are.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3") || (this.gffData.header.fileVersion == "V4.0") || (this.gffData.header.fileVersion == "V4.1")) ;
      return this._m_versionValid;
    }
  });

  /**
   * Complete GFF structure. ARE files use standard GFF format with "ARE " file type.
   * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
   */

  return Are;
})();
Are_.Are = Are;
});
