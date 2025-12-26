// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.ItpXml || (root.ItpXml = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (ItpXml_, KaitaiStream) {
/**
 * ITP XML format is a human-readable XML representation of ITP (Palette) binary files.
 * ITP files use GFF format (FileType "ITP " in GFF header).
 * Uses GFF XML structure with root element <gff3> containing <struct> elements.
 * Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/itp/itp.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/gff/itp.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/ITP-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/aurora/gff3file.cpp
 */

var ItpXml = (function() {
  function ItpXml(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  ItpXml.prototype._read = function() {
    this.xmlContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * XML document content as UTF-8 text
   */

  return ItpXml;
})();
ItpXml_.ItpXml = ItpXml;
});
