// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Bzf || (root.Bzf = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Bzf_, KaitaiStream) {
/**
 * BZF (BioWare Zipped File) files are LZMA-compressed BIF files used primarily in iOS
 * (and maybe Android) ports of KotOR. The BZF header contains "BZF " + "V1.0", followed
 * by LZMA-compressed BIF data. Decompression reveals a standard BIF structure.
 * 
 * Format Structure:
 * - Header (8 bytes): File type signature "BZF " and version "V1.0"
 * - Compressed Data: LZMA-compressed BIF file data
 * 
 * After decompression, the data follows the standard BIF format structure.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/BIF-File-Format.md - BZF compression section
 * - BIF.ksy - Standard BIF format (decompressed BZF data matches this)
 */

var Bzf = (function() {
  function Bzf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Bzf.prototype._read = function() {
    this.fileType = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
    if (!(this.fileType == "BZF ")) {
      throw new KaitaiStream.ValidationNotEqualError("BZF ", this.fileType, this._io, "/seq/0");
    }
    this.version = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
    if (!(this.version == "V1.0")) {
      throw new KaitaiStream.ValidationNotEqualError("V1.0", this.version, this._io, "/seq/1");
    }
    this.compressedData = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.compressedData.push(this._io.readU1());
      i++;
    }
  }

  /**
   * File type signature. Must be "BZF " for compressed BIF files.
   */

  /**
   * File format version. Always "V1.0" for BZF files.
   */

  /**
   * LZMA-compressed BIF file data.
   * This data must be decompressed using LZMA algorithm to obtain the standard BIF structure.
   * After decompression, the data can be parsed using the BIF format definition.
   */

  return Bzf;
})();
Bzf_.Bzf = Bzf;
});
