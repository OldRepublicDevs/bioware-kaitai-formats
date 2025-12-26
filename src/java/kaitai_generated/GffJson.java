// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * GFF JSON format is a human-readable JSON representation of GFF (Generic File Format) binary files.
 * Provides easier editing and interoperability with modern tools than binary GFF format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 */
public class GffJson extends KaitaiStruct {
    public static GffJson fromFile(String fileName) throws IOException {
        return new GffJson(new ByteBufferKaitaiStream(fileName));
    }

    public GffJson(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GffJson(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public GffJson(KaitaiStream _io, KaitaiStruct _parent, GffJson _root) {
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
    private GffJson _root;
    private KaitaiStruct _parent;

    /**
     * JSON document content as UTF-8 text
     */
    public String jsonContent() { return jsonContent; }
    public GffJson _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
