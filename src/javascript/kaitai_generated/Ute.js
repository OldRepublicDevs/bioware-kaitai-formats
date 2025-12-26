// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Ute || (root.Ute = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Ute_, KaitaiStream, Gff_) {
/**
 * UTE (Encounter Template) files define spawn encounters with creature lists and probabilities.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTE Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Encounter name
 * - CreatureList (List): Creatures to spawn with probabilities
 * - Difficulty, MaxCreatures, RecCreatures, SpawnOption: Spawn behavior
 * - Script hooks: OnEntered, OnExhausted, OnExit, OnHeartbeat, OnUserDefined
 */

var Ute = (function() {
  function Ute(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Ute.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }
  Object.defineProperty(Ute.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "UTE ";
      return this._m_fileTypeValid;
    }
  });
  Object.defineProperty(Ute.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3")) ;
      return this._m_versionValid;
    }
  });

  return Ute;
})();
Ute_.Ute = Ute;
});
