// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * TwoDA CSV format is a human-readable CSV (Comma-Separated Values) representation of TwoDA files.
 * Provides easier editing in spreadsheet applications than binary TwoDA format.
 * 
 * Each row represents a data row, with the first row containing column headers.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
 */
public class TwodaCsv extends KaitaiStruct {
    public static TwodaCsv fromFile(String fileName) throws IOException {
        return new TwodaCsv(new ByteBufferKaitaiStream(fileName));
    }

    public TwodaCsv(KaitaiStream _io) {
        this(_io, null, null);
    }

    public TwodaCsv(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public TwodaCsv(KaitaiStream _io, KaitaiStruct _parent, TwodaCsv _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.csvContent = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
    }

    public void _fetchInstances() {
    }
    private String csvContent;
    private TwodaCsv _root;
    private KaitaiStruct _parent;

    /**
     * CSV text content with rows separated by newlines and columns by commas
     */
    public String csvContent() { return csvContent; }
    public TwodaCsv _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
