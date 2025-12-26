// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Gui || (root.Gui = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Gui_, KaitaiStream, Gff_) {
/**
 * GUI (Graphical User Interface) files define UI layouts, controls, and properties.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * GUI Root Struct Fields:
 * - CONTROLS (List): UI control elements (buttons, labels, listboxes, etc.)
 * - Each control contains:
 *   - CONTROLTYPE (Int32): Control type (button=4, label=5, listbox=9, etc.)
 *   - TAG (String): Control identifier
 *   - X, Y, WIDTH, HEIGHT (Int32): Position and size
 *   - TEXT (Struct): Text properties with STRREF, color, alignment
 *   - BORDER (Struct): Border properties
 *   - EXTENT (Struct): Dimensions
 *   - Various control-specific fields
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GUI.md
 */

var Gui = (function() {
  function Gui(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Gui.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }
  Object.defineProperty(Gui.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "GUI ";
      return this._m_fileTypeValid;
    }
  });
  Object.defineProperty(Gui.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3") || (this.gffData.header.fileVersion == "V4.0") || (this.gffData.header.fileVersion == "V4.1")) ;
      return this._m_versionValid;
    }
  });

  return Gui;
})();
Gui_.Gui = Gui;
});
