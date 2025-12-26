// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.UtiXml || (root.UtiXml = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (UtiXml_, KaitaiStream) {
/**
 * Human-readable XML representation of UTI (Item Template) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../uti/uti.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-UTI.md, GFF-File-Format.md)
 */

var UtiXml = (function() {
  function UtiXml(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  UtiXml.prototype._read = function() {
    this.xmlContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * XML document content as UTF-8 text
   */

  return UtiXml;
})();
UtiXml_.UtiXml = UtiXml;
});
