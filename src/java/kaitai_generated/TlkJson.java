// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * TLK JSON format is a human-readable JSON representation of TLK (Talk Table) binary files.
 * Provides easier editing and translation than binary TLK format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/io_tlk_xml.py
 */
public class TlkJson extends KaitaiStruct {
    public static TlkJson fromFile(String fileName) throws IOException {
        return new TlkJson(new ByteBufferKaitaiStream(fileName));
    }

    public TlkJson(KaitaiStream _io) {
        this(_io, null, null);
    }

    public TlkJson(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public TlkJson(KaitaiStream _io, KaitaiStruct _parent, TlkJson _root) {
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
    private TlkJson _root;
    private KaitaiStruct _parent;

    /**
     * JSON document content as UTF-8 text
     */
    public String jsonContent() { return jsonContent; }
    public TlkJson _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
