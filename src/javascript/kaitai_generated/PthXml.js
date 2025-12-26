// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.PthXml || (root.PthXml = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (PthXml_, KaitaiStream) {
/**
 * Human-readable XML representation of PTH (Path/Pathfinding) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../pth/pth.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-PTH.md, GFF-File-Format.md)
 */

var PthXml = (function() {
  function PthXml(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  PthXml.prototype._read = function() {
    this.xmlContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * XML document content as UTF-8 text
   */

  return PthXml;
})();
PthXml_.PthXml = PthXml;
});
