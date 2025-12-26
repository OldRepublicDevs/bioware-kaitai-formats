// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.CnvXml || (root.CnvXml = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (CnvXml_, KaitaiStream) {
/**
 * Human-readable XML representation of CNV (Conversation) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../cnv/cnv.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-CNV.md, GFF-File-Format.md)
 */

var CnvXml = (function() {
  function CnvXml(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  CnvXml.prototype._read = function() {
    this.xmlContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * XML document content as UTF-8 text
   */

  return CnvXml;
})();
CnvXml_.CnvXml = CnvXml;
});
