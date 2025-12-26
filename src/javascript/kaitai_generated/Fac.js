// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Fac || (root.Fac = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Fac_, KaitaiStream, Gff_) {
/**
 * FAC (Faction) files are GFF-based format files that store faction relationships,
 * reputation values, and faction metadata.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds FAC-specific
 * validation and documentation.
 * 
 * FAC Root Struct Fields:
 * - FactionName (String): Faction identifier
 * - FactionParentID (UInt16): Parent faction ID
 * - FactionGlobal (UInt16): Global faction flag
 * - RepList (List): Reputation values with other factions
 *   - FactionID (UInt32): Target faction ID
 *   - FactionRep (UInt32): Reputation value (0-100)
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-FAC.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/fac.py
 */

var Fac = (function() {
  function Fac(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Fac.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }

  /**
   * Validates FAC file type
   */
  Object.defineProperty(Fac.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "FAC ";
      return this._m_fileTypeValid;
    }
  });

  /**
   * Validates GFF version
   */
  Object.defineProperty(Fac.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3") || (this.gffData.header.fileVersion == "V4.0") || (this.gffData.header.fileVersion == "V4.1")) ;
      return this._m_versionValid;
    }
  });

  /**
   * Complete GFF structure with "FAC " file type
   */

  return Fac;
})();
Fac_.Fac = Fac;
});
