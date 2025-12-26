// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.GffXml || (root.GffXml = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (GffXml_, KaitaiStream) {
/**
 * GFF XML format is a human-readable XML representation of GFF (Generic File Format) binary files.
 * Used by xoreos-tools and other modding tools for easier editing than binary GFF format.
 * 
 * The XML format represents the hierarchical GFF structure using XML elements:
 * - Root element: <gff3>
 * - Contains a <struct> element with id attribute
 * - Struct contains field elements (byte, uint32, exostring, locstring, resref, list, etc.)
 * - Each field has a label attribute
 * - Lists contain nested <struct> elements
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 * - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffdumper.cpp
 * - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffcreator.cpp
 */

var GffXml = (function() {
  function GffXml(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  GffXml.prototype._read = function() {
    this.xmlContent = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
  }

  /**
   * XML document content as UTF-8 text.
   * Structure: <gff3><struct id="...">...</struct></gff3>
   * Note: Kaitai Struct has limited XML parsing capabilities. For full XML parsing,
   * use an XML parser library. This definition serves as a format identifier.
   */

  return GffXml;
})();
GffXml_.GffXml = GffXml;
});
