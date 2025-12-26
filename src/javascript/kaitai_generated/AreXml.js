// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.AreXml || (root.AreXml = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (AreXml_, KaitaiStream) {
/**
 * Human-readable XML representation of ARE (Area) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../are/are.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-ARE.md, GFF-File-Format.md)
 */

var AreXml = (function() {
  function AreXml(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AreXml.prototype._read = function() {
    this.xmlContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * XML document content as UTF-8 text
   */

  return AreXml;
})();
AreXml_.AreXml = AreXml;
});
