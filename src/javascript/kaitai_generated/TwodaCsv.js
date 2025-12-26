// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.TwodaCsv || (root.TwodaCsv = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (TwodaCsv_, KaitaiStream) {
/**
 * TwoDA CSV format is a human-readable CSV (Comma-Separated Values) representation of TwoDA files.
 * Provides easier editing in spreadsheet applications than binary TwoDA format.
 * 
 * Each row represents a data row, with the first row containing column headers.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
 */

var TwodaCsv = (function() {
  function TwodaCsv(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  TwodaCsv.prototype._read = function() {
    this.csvContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * CSV text content with rows separated by newlines and columns by commas
   */

  return TwodaCsv;
})();
TwodaCsv_.TwodaCsv = TwodaCsv;
});
