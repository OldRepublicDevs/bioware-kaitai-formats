// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Utd || (root.Utd = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Utd_, KaitaiStream, Gff_) {
/**
 * UTD (Door Template) files define door properties, scripts, and behavior.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTD Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Door name
 * - Appearance (UInt32): Door appearance ID
 * - Locked, KeyRequired, Trap, Faction (various): Door state/behavior
 * - Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnFailToOpen, etc.
 */

var Utd = (function() {
  function Utd(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Utd.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }
  Object.defineProperty(Utd.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "UTD ";
      return this._m_fileTypeValid;
    }
  });
  Object.defineProperty(Utd.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3")) ;
      return this._m_versionValid;
    }
  });

  return Utd;
})();
Utd_.Utd = Utd;
});
