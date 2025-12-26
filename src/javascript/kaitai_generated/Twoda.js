// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Twoda || (root.Twoda = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Twoda_, KaitaiStream) {
/**
 * TwoDA (2D Array) files store tabular data in a binary format used by BioWare games
 * including Knights of the Old Republic (KotOR) and The Sith Lords (TSL).
 * 
 * TwoDA files are essentially two-dimensional arrays (tables) with:
 * - Column headers (first row defines column names)
 * - Row labels (first column defines row identifiers)
 * - Cell values (data at row/column intersections)
 * 
 * Binary Format Structure:
 * - File Header (9 bytes): Magic "2DA " (space-padded), version "V2.b", and newline
 * - Column Headers Section: Tab-separated column names, terminated by null byte
 * - Row Count (4 bytes): uint32 indicating number of data rows
 * - Row Labels Section: Tab-separated row labels (one per row)
 * - Cell Offsets Array: Array of uint16 offsets (rowCount * columnCount entries)
 * - Data Size (2 bytes): uint16 indicating total size of cell data section
 * - Cell Values Section: Null-terminated strings at offsets specified in offsets array
 * 
 * The format uses an offset-based string table for cell values, allowing efficient
 * storage of duplicate values (shared strings are stored once and referenced by offset).
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/twoda_data.py
 */

var Twoda = (function() {
  function Twoda(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Twoda.prototype._read = function() {
    this.header = new TwodaHeader(this._io, this, this._root);
    this.columnHeadersRaw = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII");
    this.rowCount = this._io.readU4le();
    this.rowLabelsSection = new RowLabelsSection(this._io, this, this._root);
    this.cellOffsetsArray = new CellOffsetsArray(this._io, this, this._root);
    this.lenCellValuesSection = this._io.readU2le();
    this._raw_cellValuesSection = this._io.readBytes(this.lenCellValuesSection);
    var _io__raw_cellValuesSection = new KaitaiStream(this._raw_cellValuesSection);
    this.cellValuesSection = new CellValuesSection(_io__raw_cellValuesSection, this, this._root);
  }

  var CellOffsetsArray = Twoda.CellOffsetsArray = (function() {
    function CellOffsetsArray(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    CellOffsetsArray.prototype._read = function() {
      this.offsets = [];
      var i = 0;
      do {
        var _ = this._io.readU2le();
        this.offsets.push(_);
        i++;
      } while (!(this._io.pos >= this._io.size - 2));
    }

    /**
     * Array of cell value offsets (uint16, little-endian).
     * Each offset points to a null-terminated string in the cell_values_section.
     * Offsets are relative to the start of cell_values_section.
     * 
     * Reading continues until we reach 2 bytes before end of file (where len_cell_values_section field is).
     * Then len_cell_values_section is read, followed by cell_values_section.
     * 
     * The actual count is: row_count * column_count
     * where column_count = number of tab-separated parts in column_headers_raw.
     * 
     * Cell access pattern:
     * - Cell at row i, column j = offsets[i * column_count + j]
     * - Value = read string at cell_values_section start + offsets[i * column_count + j]
     * 
     * Duplicate cell values share the same offset (string deduplication).
     */

    return CellOffsetsArray;
  })();

  var CellValuesSection = Twoda.CellValuesSection = (function() {
    function CellValuesSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    CellValuesSection.prototype._read = function() {
      this.rawData = KaitaiStream.bytesToStr(this._io.readBytes(this._root.lenCellValuesSection), "ASCII");
    }

    /**
     * Raw cell values data as a single string.
     * Contains all null-terminated cell value strings concatenated together.
     * Individual strings can be extracted using offsets from cell_offsets_array.
     * Note: To read a specific cell value, seek to (cell_values_section start + offset) and read a null-terminated string.
     */

    return CellValuesSection;
  })();

  var RowLabelEntry = Twoda.RowLabelEntry = (function() {
    function RowLabelEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    RowLabelEntry.prototype._read = function() {
      this.labelValue = KaitaiStream.bytesToStr(this._io.readBytesTerm(9, false, true, false), "ASCII");
    }

    /**
     * Row label value (ASCII string terminated by tab character 0x09).
     * Tab terminator is consumed but not included in the string value.
     * Row labels uniquely identify each row in the table.
     * Often numeric (e.g., "0", "1", "2") but can be any string identifier.
     */

    return RowLabelEntry;
  })();

  var RowLabelsSection = Twoda.RowLabelsSection = (function() {
    function RowLabelsSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    RowLabelsSection.prototype._read = function() {
      this.labels = [];
      for (var i = 0; i < this._root.rowCount; i++) {
        this.labels.push(new RowLabelEntry(this._io, this, this._root));
      }
    }

    /**
     * Array of row label entries, one per row.
     * Each label is terminated by tab character (0x09).
     * Total count equals row_count from the header.
     * Row labels typically identify each data row (e.g., numeric IDs, names, etc.).
     */

    return RowLabelsSection;
  })();

  var TwodaHeader = Twoda.TwodaHeader = (function() {
    function TwodaHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    TwodaHeader.prototype._read = function() {
      this.magic = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.version = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.newline = this._io.readU1();
    }

    /**
     * Validation check that the file is a valid TwoDA file.
     * All header fields must match expected values.
     */
    Object.defineProperty(TwodaHeader.prototype, 'isValidTwoda', {
      get: function() {
        if (this._m_isValidTwoda !== undefined)
          return this._m_isValidTwoda;
        this._m_isValidTwoda =  ((this.magic == "2DA ") && (this.version == "V2.b") && (this.newline == 10)) ;
        return this._m_isValidTwoda;
      }
    });

    /**
     * File type signature. Must be "2DA " (space-padded).
     * Bytes: 0x32 0x44 0x41 0x20
     * The space after "2DA" is significant and must be present.
     */

    /**
     * File format version. Always "V2.b" for KotOR/TSL TwoDA files.
     * Bytes: 0x56 0x32 0x2E 0x62
     * This is the binary version identifier (V2.b = Version 2 binary).
     */

    /**
     * Newline character (0x0A = '\n').
     * Separates header from column headers section.
     */

    return TwodaHeader;
  })();

  /**
   * TwoDA file header (9 bytes) - magic "2DA ", version "V2.b", and newline character
   */

  /**
   * Column headers section as a single null-terminated string.
   * Contains tab-separated column names. The null terminator marks the end.
   * Column names can be extracted by splitting on tab characters (0x09).
   * Example: "col1\tcol2\tcol3\0" represents three columns: "col1", "col2", "col3"
   */

  /**
   * Number of data rows in the TwoDA table.
   * This count determines how many row labels and how many cell entries per column.
   */

  /**
   * Row labels section - tab-separated row labels (one per row)
   */

  /**
   * Array of cell value offsets (uint16 per cell).
   * Total entries = row_count * column_count (where column_count = number of tab-separated parts in column_headers_raw).
   * Each offset points to a null-terminated string in the cell values section.
   */

  /**
   * Total size in bytes of the cell values data section.
   * This is the size of all unique cell value strings combined (including null terminators).
   * Not used during reading but stored for format consistency.
   */

  /**
   * Cell values data section containing all unique cell value strings.
   * Each string is null-terminated. Offsets from cell_offsets_array point into this section.
   * The section starts immediately after len_cell_values_section field and has size = len_cell_values_section bytes.
   */

  return Twoda;
})();
Twoda_.Twoda = Twoda;
});
