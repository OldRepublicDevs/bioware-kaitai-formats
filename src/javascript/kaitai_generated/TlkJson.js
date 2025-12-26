// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.TlkJson || (root.TlkJson = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (TlkJson_, KaitaiStream) {
/**
 * TLK JSON format is a human-readable JSON representation of TLK (Talk Table) binary files.
 * Provides easier editing and translation than binary TLK format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/io_tlk_xml.py
 */

var TlkJson = (function() {
  function TlkJson(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  TlkJson.prototype._read = function() {
    this.jsonContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * JSON document content as UTF-8 text
   */

  return TlkJson;
})();
TlkJson_.TlkJson = TlkJson;
});
