// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.LipJson || (root.LipJson = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (LipJson_, KaitaiStream) {
/**
 * LIP JSON format is a human-readable JSON representation of LIP (Lipsync) binary files.
 * Provides easier editing than binary LIP format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/io_lip_xml.py
 */

var LipJson = (function() {
  function LipJson(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  LipJson.prototype._read = function() {
    this.jsonContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * JSON document content as UTF-8 text
   */

  return LipJson;
})();
LipJson_.LipJson = LipJson;
});
