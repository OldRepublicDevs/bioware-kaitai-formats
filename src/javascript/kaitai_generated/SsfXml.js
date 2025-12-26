// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.SsfXml || (root.SsfXml = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (SsfXml_, KaitaiStream) {
/**
 * SSF XML format is a human-readable XML representation of SSF (Soundset) binary files.
 * Provides easier editing than binary SSF format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/io_ssf_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/ssf.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/SSF-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/aurora/ssffile.cpp
 */

var SsfXml = (function() {
  function SsfXml(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  SsfXml.prototype._read = function() {
    this.xmlContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * XML document content as UTF-8 text
   */

  return SsfXml;
})();
SsfXml_.SsfXml = SsfXml;
});
