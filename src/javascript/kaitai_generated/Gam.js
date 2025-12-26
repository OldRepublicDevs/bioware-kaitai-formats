// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Gam || (root.Gam = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Gam_, KaitaiStream, Gff_) {
/**
 * GAM (Game State) files are GFF-based format files that store game state information
 * including party members, global variables, game time, and time played.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds GAM-specific
 * validation and documentation.
 * 
 * GAM files are used by:
 * - Aurora Engine (Neverwinter Nights, Neverwinter Nights 2)
 * - Infinity Engine (Mass Effect, Dragon Age Origins, Dragon Age 2)
 * 
 * NOTE: Odyssey Engine (Knights of the Old Republic) does NOT use GAM format -
 * it uses NFO format for save games instead.
 * 
 * GAM Root Struct Fields:
 * - GameTimeHour, GameTimeMinute, GameTimeSecond, GameTimeMillisecond (Int32): Game time
 * - TimePlayed (Int32): Total playtime in seconds
 * - PartyList (List): Party member ResRefs
 * - GlobalBooleans, GlobalNumbers, GlobalStrings (Lists): Global variable storage
 * 
 * Aurora-specific: ModuleName, CurrentArea, PlayerCharacter
 * Infinity-specific: GameName, Chapter, JournalEntries
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GAM.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 */

var Gam = (function() {
  function Gam(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Gam.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }

  /**
   * Validates that this is a GAM file (file type must be "GAM ")
   */
  Object.defineProperty(Gam.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "GAM ";
      return this._m_fileTypeValid;
    }
  });

  /**
   * Validates GFF version is supported
   */
  Object.defineProperty(Gam.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3") || (this.gffData.header.fileVersion == "V4.0") || (this.gffData.header.fileVersion == "V4.1")) ;
      return this._m_versionValid;
    }
  });

  /**
   * Complete GFF structure. GAM files use standard GFF format with "GAM " file type.
   * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
   */

  return Gam;
})();
Gam_.Gam = Gam;
});
