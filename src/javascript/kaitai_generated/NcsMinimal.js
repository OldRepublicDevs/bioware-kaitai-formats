// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.NcsMinimal || (root.NcsMinimal = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (NcsMinimal_, KaitaiStream) {
var NcsMinimal = (function() {
  function NcsMinimal(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  NcsMinimal.prototype._read = function() {
    this.fileType = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
    this.fileVersion = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
    this.sizeMarker = this._io.readU1();
    this.totalFileSize = this._io.readU4be();
    this.instructions = [];
    var i = 0;
    do {
      var _ = new Instruction(this._io, this, this._root);
      this.instructions.push(_);
      i++;
    } while (!(this._io.pos >= this._root.totalFileSize));
  }

  var Instruction = NcsMinimal.Instruction = (function() {
    function Instruction(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Instruction.prototype._read = function() {
      this.bytecode = this._io.readU1();
      this.qualifier = this._io.readU1();
    }

    return Instruction;
  })();

  return NcsMinimal;
})();
NcsMinimal_.NcsMinimal = NcsMinimal;
});
