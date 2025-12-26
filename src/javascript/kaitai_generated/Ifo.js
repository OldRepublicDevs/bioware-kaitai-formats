// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Ifo || (root.Ifo = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Ifo_, KaitaiStream, Gff_) {
/**
 * IFO (Module Information) files store module metadata including entry points,
 * starting locations, and module properties.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * IFO Root Struct Fields:
 * - Mod_ID (ResRef): Module identifier
 * - Mod_Name (LocalizedString): Module display name
 * - Mod_Entry_Area (ResRef): Starting area
 * - Mod_Entry_X, Mod_Entry_Y, Mod_Entry_Z (Float): Starting position
 * - Mod_Entry_Dir_X, Mod_Entry_Dir_Y (Float): Starting orientation
 * - Mod_OnHeartbeat, Mod_OnModLoad, Mod_OnModStart (ResRef): Script hooks
 * - Mod_MinGameVer (String): Minimum game version required
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-IFO.md
 */

var Ifo = (function() {
  function Ifo(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Ifo.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }
  Object.defineProperty(Ifo.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "IFO ";
      return this._m_fileTypeValid;
    }
  });
  Object.defineProperty(Ifo.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3") || (this.gffData.header.fileVersion == "V4.0") || (this.gffData.header.fileVersion == "V4.1")) ;
      return this._m_versionValid;
    }
  });

  return Ifo;
})();
Ifo_.Ifo = Ifo;
});
