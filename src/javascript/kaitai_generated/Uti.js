// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Uti || (root.Uti = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Uti_, KaitaiStream, Gff_) {
/**
 * UTI (Item Template) files define item properties, stats, and behavior.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTI Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Item name
 * - Description (LocalizedString): Item description
 * - BaseItem (Int32): Base item type (baseitems.2da)
 * - Cost, StackSize, Charges: Item economics
 * - ModelVariation, TextureVar, BodyVariation: Item appearance
 * - PropertiesList (List): Item properties (damage, attack bonus, etc.)
 */

var Uti = (function() {
  function Uti(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Uti.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }
  Object.defineProperty(Uti.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "UTI ";
      return this._m_fileTypeValid;
    }
  });
  Object.defineProperty(Uti.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3")) ;
      return this._m_versionValid;
    }
  });

  return Uti;
})();
Uti_.Uti = Uti;
});
