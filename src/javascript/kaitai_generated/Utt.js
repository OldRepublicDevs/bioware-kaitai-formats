// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Utt || (root.Utt = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Utt_, KaitaiStream, Gff_) {
/**
 * UTT (Trigger Template) files define trigger zones and their properties.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTT Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Trigger name
 * - Geometry (List): Trigger zone vertices
 * - TriggerType, Cursor, Faction: Trigger behavior
 * - Script hooks: OnClick, OnDisarm, OnHeartbeat, OnTrapTriggered, OnUserDefined
 */

var Utt = (function() {
  function Utt(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Utt.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }
  Object.defineProperty(Utt.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "UTT ";
      return this._m_fileTypeValid;
    }
  });
  Object.defineProperty(Utt.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3")) ;
      return this._m_versionValid;
    }
  });

  return Utt;
})();
Utt_.Utt = Utt;
});
