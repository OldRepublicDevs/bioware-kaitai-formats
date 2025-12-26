// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Pt || (root.Pt = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Pt_, KaitaiStream, Gff_) {
/**
 * PT (Party Table) files are GFF-based format files that store party and game state information
 * for Odyssey Engine games (KotOR and KotOR 2). PT files use the GFF (Generic File Format) binary
 * structure with file type signature "PT  ".
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds PT-specific
 * validation and documentation.
 * 
 * PT files are typically named "PARTYTABLE.res" and are stored in savegame.sav ERF archives.
 * They contain comprehensive party and game state information including:
 * - Party composition (current members, available NPCs, leader)
 * - Resources (gold/credits, XP pool, components, chemicals)
 * - Journal entries with states, dates, and times
 * - Pazaak cards and side decks for the mini-game
 * - UI state (last panel, messages, tutorial windows shown)
 * - AI state (follow mode, AI enabled, solo mode)
 * - K2-specific: Influence values per companion
 * 
 * PT Root Struct Fields (Common):
 * - "PT_PCNAME" (String): Player character name
 * - "PT_GOLD" (Int32): Credits/gold amount
 * - "PT_XP_POOL" (Int32): Experience points
 * - "PT_PLAYEDSECONDS" (UInt32): Total playtime in seconds
 * - "PT_NUM_MEMBERS" (Int32): Party member count
 * - "PT_CONTROLLED_NPC", "PT_SOLOMODE", "PT_AISTATE", "PT_FOLLOWSTATE" (Int32): AI/party state
 * - "PT_MEMBERS" (List): Party member ResRefs and leader flags
 * - "PT_AVAIL_NPCS" (List): Available NPCs for recruitment
 * - "PT_INFLUENCE" (List): Influence values (KotOR 2 only)
 * - "PT_PAZAAKCARDS", "PT_PAZSIDELIST" (List): Pazaak card collections
 * - Journal/message lists: "PT_FB_MSG_LIST", "PT_DLG_MSG_LIST", "PT_COM_MSG_LIST"
 * 
 * Based on swkotor2.exe: SavePartyTable @ 0x0057bd70
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/extract/savedata.py
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PT.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 */

var Pt = (function() {
  function Pt(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Pt.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }

  /**
   * Validates that this is a PT file (file type must be "PT  ")
   */
  Object.defineProperty(Pt.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "PT  ";
      return this._m_fileTypeValid;
    }
  });

  /**
   * Validates GFF version is supported
   */
  Object.defineProperty(Pt.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3") || (this.gffData.header.fileVersion == "V4.0") || (this.gffData.header.fileVersion == "V4.1")) ;
      return this._m_versionValid;
    }
  });

  /**
   * Complete GFF structure. PT files use standard GFF format with "PT  " file type.
   * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
   */

  return Pt;
})();
Pt_.Pt = Pt;
});
