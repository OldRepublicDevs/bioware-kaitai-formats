// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Utc || (root.Utc = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Utc_, KaitaiStream, Gff_) {
/**
 * UTC (Creature Template) files are GFF-based format files that store creature definitions
 * including stats, appearance, inventory, feats, and script hooks. UTC files are used to
 * define NPCs, party members, enemies, and the player character in Knights of the Old Republic.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds UTC-specific
 * validation and documentation.
 * 
 * UTC Root Struct Fields (Common):
 * - "TemplateResRef" (ResRef): Blueprint identifier
 * - "Tag" (String): Unique instance identifier
 * - "FirstName", "LastName" (LocalizedString): Creature name
 * - "Appearance_Type" (UInt32): Appearance ID (appearance.2da)
 * - "PortraitId" (UInt16): Portrait index (portraits.2da)
 * - "Gender", "Race" (UInt8/UInt16): Character attributes
 * - "Str", "Dex", "Con", "Int", "Wis", "Cha" (UInt8): Ability scores
 * - "HitPoints", "MaxHitPoints", "ForcePoints" (Int16): Health/Force stats
 * - "ClassList" (List): Character classes with levels
 * - "FeatList" (List): Known feats
 * - "SkillList" (List): Skill ranks
 * - "ItemList" (List): Inventory items
 * - "Equip_ItemList" (List): Equipped items with slots
 * - Script hooks: "ScriptAttacked", "ScriptDamaged", "ScriptDeath", etc. (ResRef)
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTC.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utc.py
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/utc.cpp
 */

var Utc = (function() {
  function Utc(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Utc.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }

  /**
   * Validates that this is a UTC file (file type must be "UTC ")
   */
  Object.defineProperty(Utc.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "UTC ";
      return this._m_fileTypeValid;
    }
  });

  /**
   * Validates GFF version is supported
   */
  Object.defineProperty(Utc.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3") || (this.gffData.header.fileVersion == "V4.0") || (this.gffData.header.fileVersion == "V4.1")) ;
      return this._m_versionValid;
    }
  });

  /**
   * Complete GFF structure. UTC files use standard GFF format with "UTC " file type.
   * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
   */

  return Utc;
})();
Utc_.Utc = Utc;
});
