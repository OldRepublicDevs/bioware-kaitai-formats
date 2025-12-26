// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Jrl || (root.Jrl = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Jrl_, KaitaiStream, Gff_) {
/**
 * JRL (Journal) files store quest journal entries and categories.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * JRL Root Struct Fields:
 * - Categories (List): Journal categories
 * - Each category contains quest entries with text, states, priorities
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-JRL.md
 */

var Jrl = (function() {
  function Jrl(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Jrl.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }
  Object.defineProperty(Jrl.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "JRL ";
      return this._m_fileTypeValid;
    }
  });
  Object.defineProperty(Jrl.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3") || (this.gffData.header.fileVersion == "V4.0") || (this.gffData.header.fileVersion == "V4.1")) ;
      return this._m_versionValid;
    }
  });

  return Jrl;
})();
Jrl_.Jrl = Jrl;
});
