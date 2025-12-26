// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.DlgXml || (root.DlgXml = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (DlgXml_, KaitaiStream) {
/**
 * Human-readable XML representation of DLG (Dialogue) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../dlg/dlg.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-DLG.md, GFF-File-Format.md)
 */

var DlgXml = (function() {
  function DlgXml(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  DlgXml.prototype._read = function() {
    this.xmlContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * XML document content as UTF-8 text
   */

  return DlgXml;
})();
DlgXml_.DlgXml = DlgXml;
});
