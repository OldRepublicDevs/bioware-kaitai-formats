// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Pth || (root.Pth = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Pth_, KaitaiStream, Gff_) {
/**
 * PTH (Path/Pathfinding) files store pathfinding waypoint graphs for AI navigation.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * PTH Root Struct Fields:
 * - Path_Points (List): Waypoint positions (X, Y coordinates)
 * - Connections (List): Connections between waypoints
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PTH.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/pth.py
 */

var Pth = (function() {
  function Pth(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Pth.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }
  Object.defineProperty(Pth.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "PTH ";
      return this._m_fileTypeValid;
    }
  });
  Object.defineProperty(Pth.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3") || (this.gffData.header.fileVersion == "V4.0") || (this.gffData.header.fileVersion == "V4.1")) ;
      return this._m_versionValid;
    }
  });

  return Pth;
})();
Pth_.Pth = Pth;
});
