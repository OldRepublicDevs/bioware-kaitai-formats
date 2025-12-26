// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Gff'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Gff'));
  } else {
    factory(root.Git || (root.Git = {}), root.KaitaiStream, root.Gff || (root.Gff = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Git_, KaitaiStream, Gff_) {
/**
 * GIT (Game Instance Template) files store dynamic area instance data including
 * placed creatures, placeables, doors, triggers, waypoints, sounds, stores, and encounters.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * GIT Root Struct Fields:
 * - CreatureList (List): Placed creatures with positions, orientations
 * - DoorList (List): Placed doors with states, scripts
 * - PlaceableList (List): Placed placeables (chests, etc.)
 * - TriggerList (List): Trigger zones
 * - WaypointList (List): Navigation waypoints
 * - SoundList (List): Ambient sounds
 * - StoreList (List): Merchant shops
 * - EncounterList (List): Spawn encounters
 * - CameraList (List): Camera points
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GIT.md
 */

var Git = (function() {
  function Git(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Git.prototype._read = function() {
    this.gffData = new Gff_.Gff.Gff(this._io, null, null);
  }
  Object.defineProperty(Git.prototype, 'fileTypeValid', {
    get: function() {
      if (this._m_fileTypeValid !== undefined)
        return this._m_fileTypeValid;
      this._m_fileTypeValid = this.gffData.header.fileType == "GIT ";
      return this._m_fileTypeValid;
    }
  });
  Object.defineProperty(Git.prototype, 'versionValid', {
    get: function() {
      if (this._m_versionValid !== undefined)
        return this._m_versionValid;
      this._m_versionValid =  ((this.gffData.header.fileVersion == "V3.2") || (this.gffData.header.fileVersion == "V3.3") || (this.gffData.header.fileVersion == "V4.0") || (this.gffData.header.fileVersion == "V4.1")) ;
      return this._m_versionValid;
    }
  });

  return Git;
})();
Git_.Git = Git;
});
