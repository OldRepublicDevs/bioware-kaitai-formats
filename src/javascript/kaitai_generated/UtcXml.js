// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.UtcXml || (root.UtcXml = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (UtcXml_, KaitaiStream) {
/**
 * Human-readable XML representation of UTC (Creature Template) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../utc/utc.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-UTC.md, GFF-File-Format.md)
 */

var UtcXml = (function() {
  function UtcXml(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  UtcXml.prototype._read = function() {
    this.xmlContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * XML document content as UTF-8 text
   */

  return UtcXml;
})();
UtcXml_.UtcXml = UtcXml;
});
