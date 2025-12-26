// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Dlg || (root.Dlg = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Dlg_, KaitaiStream, Gff_) {
/**
 * DLG (Dialogue) files are GFF-based format files that store conversation trees with entries, replies,
 * links, and conversation metadata for Odyssey and Aurora engines.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds DLG-specific
 * validation and documentation.
 * 
 * DLG files contain:
 * - Root struct with conversation metadata (NumWords, Skippable, ConversationType, etc.)
 * - EntryList: Array of dialogue entries (NPC lines)
 * - ReplyList: Array of reply options (player responses)
 * - StartingList: Array of entry points into conversation tree
 * - StuntList: Array of cutscene/animation sequences
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-DLG.md
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/dlg/
 */

var Dlg = (function() {
  function Dlg(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Dlg.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }

  /**
   * Validates DLG file type
   */
  Object.defineProperty(Dlg.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "DLG ";
      return this._m_fileTypeValid;
    }
  });

  /**
   * Validates GFF version
   */
  Object.defineProperty(Dlg.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3") || (this.gffData.header.fileVersion == "V4.0") || (this.gffData.header.fileVersion == "V4.1")) ;
      return this._m_versionValid;
    }
  });

  /**
   * Complete GFF structure with "DLG " file type
   */

  return Dlg;
})();
Dlg_.Dlg = Dlg;
});
