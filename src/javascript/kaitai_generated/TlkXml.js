// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.TlkXml || (root.TlkXml = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (TlkXml_, KaitaiStream) {
/**
 * TLK XML format is a human-readable XML representation of TLK (Talk Table) binary files.
 * Provides easier editing and translation than binary TLK format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/tlk.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/io_tlk_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/resource/format/tlkreader.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/TLK-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/aurora/talktable.cpp
 * 
 * - ../GFF/GFF
 * - ../GFF/XML/GFF_XML
 * - ../TLK/TLK
 */

var TlkXml = (function() {
  function TlkXml(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  TlkXml.prototype._read = function() {
    this.xmlContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * XML document content as UTF-8 text
   */

  return TlkXml;
})();
TlkXml_.TlkXml = TlkXml;
});
