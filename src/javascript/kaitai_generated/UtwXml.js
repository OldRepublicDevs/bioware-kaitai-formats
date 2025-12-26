// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.UtwXml || (root.UtwXml = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (UtwXml_, KaitaiStream) {
/**
 * Human-readable XML representation of UTW (Waypoint Template) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../utw/utw.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-UTW.md, GFF-File-Format.md)
 */

var UtwXml = (function() {
  function UtwXml(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  UtwXml.prototype._read = function() {
    this.xmlContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * XML document content as UTF-8 text
   */

  return UtwXml;
})();
UtwXml_.UtwXml = UtwXml;
});
