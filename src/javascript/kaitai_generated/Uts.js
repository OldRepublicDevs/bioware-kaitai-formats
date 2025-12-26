// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Uts || (root.Uts = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Uts_, KaitaiStream, Gff_) {
/**
 * UTS (Sound Template) files define ambient sound sources and properties.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTS Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Sound name
 * - Sounds (List): Sound file references
 * - Volume, MaxDistance, MinDistance: Audio properties
 * - Looping, Random, Positional: Sound behavior
 */

var Uts = (function() {
  function Uts(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Uts.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }
  Object.defineProperty(Uts.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "UTS ";
      return this._m_fileTypeValid;
    }
  });
  Object.defineProperty(Uts.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3")) ;
      return this._m_versionValid;
    }
  });

  return Uts;
})();
Uts_.Uts = Uts;
});
