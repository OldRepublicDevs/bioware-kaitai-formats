// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.ResXml || (root.ResXml = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (ResXml_, KaitaiStream) {
/**
 * RES XML format is a human-readable XML representation of RES (Save Data) binary files.
 * Uses GFF XML structure with root element <gff3> containing <struct> elements.
 * Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 */

var ResXml = (function() {
  function ResXml(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  ResXml.prototype._read = function() {
    this.xmlContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * XML document content as UTF-8 text
   */

  return ResXml;
})();
ResXml_.ResXml = ResXml;
});
