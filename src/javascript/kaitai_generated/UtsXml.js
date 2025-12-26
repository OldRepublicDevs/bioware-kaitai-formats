// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.UtsXml || (root.UtsXml = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (UtsXml_, KaitaiStream) {
/**
 * Human-readable XML representation of UTS (Sound Template) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../uts/uts.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-UTS.md, GFF-File-Format.md)
 */

var UtsXml = (function() {
  function UtsXml(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  UtsXml.prototype._read = function() {
    this.xmlContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * XML document content as UTF-8 text
   */

  return UtsXml;
})();
UtsXml_.UtsXml = UtsXml;
});
