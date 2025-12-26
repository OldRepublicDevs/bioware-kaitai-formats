// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.TwodaJson || (root.TwodaJson = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (TwodaJson_, KaitaiStream) {
/**
 * TwoDA JSON format is a human-readable JSON representation of TwoDA files.
 * Provides easier editing and interoperability with modern tools than binary TwoDA format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
 */

var TwodaJson = (function() {
  function TwodaJson(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  TwodaJson.prototype._read = function() {
    this.jsonContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * JSON document content as UTF-8 text
   */

  return TwodaJson;
})();
TwodaJson_.TwodaJson = TwodaJson;
});
