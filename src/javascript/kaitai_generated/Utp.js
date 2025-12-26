// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Utp || (root.Utp = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Utp_, KaitaiStream, Gff_) {
/**
 * UTP (Placeable Template) files define placeable objects (containers, furniture, etc.).
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTP Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Placeable name
 * - Appearance (UInt32): Placeable appearance ID
 * - HasInventory, ItemList (List): Container contents
 * - Locked, KeyRequired, Trap: Security settings
 * - Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnHeartbeat, etc.
 */

var Utp = (function() {
  function Utp(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Utp.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }
  Object.defineProperty(Utp.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "UTP ";
      return this._m_fileTypeValid;
    }
  });
  Object.defineProperty(Utp.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3")) ;
      return this._m_versionValid;
    }
  });

  return Utp;
})();
Utp_.Utp = Utp;
});
