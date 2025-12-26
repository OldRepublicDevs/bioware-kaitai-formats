// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * TwoDA JSON format is a human-readable JSON representation of TwoDA files.
 * Provides easier editing and interoperability with modern tools than binary TwoDA format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
 */
public class TwodaJson extends KaitaiStruct {
    public static TwodaJson fromFile(String fileName) throws IOException {
        return new TwodaJson(new ByteBufferKaitaiStream(fileName));
    }

    public TwodaJson(KaitaiStream _io) {
        this(_io, null, null);
    }

    public TwodaJson(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public TwodaJson(KaitaiStream _io, KaitaiStruct _parent, TwodaJson _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.jsonContent = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
    }

    public void _fetchInstances() {
    }
    private String jsonContent;
    private TwodaJson _root;
    private KaitaiStruct _parent;

    /**
     * JSON document content as UTF-8 text
     */
    public String jsonContent() { return jsonContent; }
    public TwodaJson _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
