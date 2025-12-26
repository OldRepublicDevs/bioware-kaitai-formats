// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * LIP JSON format is a human-readable JSON representation of LIP (Lipsync) binary files.
 * Provides easier editing than binary LIP format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/io_lip_xml.py
 */
public class LipJson extends KaitaiStruct {
    public static LipJson fromFile(String fileName) throws IOException {
        return new LipJson(new ByteBufferKaitaiStream(fileName));
    }

    public LipJson(KaitaiStream _io) {
        this(_io, null, null);
    }

    public LipJson(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public LipJson(KaitaiStream _io, KaitaiStruct _parent, LipJson _root) {
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
    private LipJson _root;
    private KaitaiStruct _parent;

    /**
     * JSON document content as UTF-8 text
     */
    public String jsonContent() { return jsonContent; }
    public LipJson _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
