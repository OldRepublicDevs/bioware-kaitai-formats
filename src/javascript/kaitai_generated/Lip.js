// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Lip || (root.Lip = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Lip_, KaitaiStream) {
/**
 * LIP (LIP Synchronization) files drive mouth animation for voiced dialogue in BioWare games.
 * Each file contains a compact series of keyframes that map timestamps to discrete viseme
 * (mouth shape) indices so that the engine can interpolate character lip movement while
 * playing the companion WAV audio line.
 * 
 * LIP files are always binary and contain only animation data. They are paired with WAV
 * voice-over resources of identical duration; the LIP length field must match the WAV
 * playback time for glitch-free animation.
 * 
 * Keyframes are sorted chronologically and store a timestamp (float seconds) plus a
 * 1-byte viseme index (0-15). The format uses the 16-shape Preston Blair phoneme set.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/LIP-File-Format.md
 * - https://github.com/seedhartha/reone/blob/master/src/libs/graphics/format/lipreader.cpp:27-42
 * - https://github.com/xoreos/xoreos/blob/master/src/graphics/aurora/lipfile.cpp
 * - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/LIPObject.ts:93-146
 */

var Lip = (function() {
  Lip.LipShapes = Object.freeze({
    NEUTRAL: 0,
    EE: 1,
    EH: 2,
    AH: 3,
    OH: 4,
    OOH: 5,
    Y: 6,
    STS: 7,
    FV: 8,
    NG: 9,
    TH: 10,
    MPB: 11,
    TD: 12,
    SH: 13,
    L: 14,
    KG: 15,

    0: "NEUTRAL",
    1: "EE",
    2: "EH",
    3: "AH",
    4: "OH",
    5: "OOH",
    6: "Y",
    7: "STS",
    8: "FV",
    9: "NG",
    10: "TH",
    11: "MPB",
    12: "TD",
    13: "SH",
    14: "L",
    15: "KG",
  });

  function Lip(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Lip.prototype._read = function() {
    this.fileType = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
    this.fileVersion = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
    this.length = this._io.readF4le();
    this.numKeyframes = this._io.readU4le();
    this.keyframes = [];
    for (var i = 0; i < this.numKeyframes; i++) {
      this.keyframes.push(new KeyframeEntry(this._io, this, this._root));
    }
  }

  /**
   * A single keyframe entry mapping a timestamp to a viseme (mouth shape).
   * Keyframes are used by the engine to interpolate between mouth shapes during
   * audio playback to create lip sync animation.
   */

  var KeyframeEntry = Lip.KeyframeEntry = (function() {
    function KeyframeEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    KeyframeEntry.prototype._read = function() {
      this.timestamp = this._io.readF4le();
      this.shape = this._io.readU1();
    }

    /**
     * Seconds from animation start. Must be >= 0 and <= length.
     * Keyframes should be sorted ascending by timestamp.
     */

    /**
     * Viseme index (0-15) indicating which mouth shape to use at this timestamp.
     * Uses the 16-shape Preston Blair phoneme set. See lip_shapes enum for details.
     */

    return KeyframeEntry;
  })();

  /**
   * File type signature. Must be "LIP " (space-padded) for LIP files.
   */

  /**
   * File format version. Must be "V1.0" for LIP files.
   */

  /**
   * Duration in seconds. Must equal the paired WAV file playback time for
   * glitch-free animation. This is the total length of the lip sync animation.
   */

  /**
   * Number of keyframes immediately following. Each keyframe contains a timestamp
   * and a viseme shape index. Keyframes should be sorted ascending by timestamp.
   */

  /**
   * Array of keyframe entries. Each entry maps a timestamp to a mouth shape.
   * Entries must be stored in chronological order (ascending by timestamp).
   */

  return Lip;
})();
Lip_.Lip = Lip;
});
