// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * Human-readable XML representation of UTW (Waypoint Template) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../utw/utw.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-UTW.md, GFF-File-Format.md)
 */
public class UtwXml extends KaitaiStruct {
    public static UtwXml fromFile(String fileName) throws IOException {
        return new UtwXml(new ByteBufferKaitaiStream(fileName));
    }

    public UtwXml(KaitaiStream _io) {
        this(_io, null, null);
    }

    public UtwXml(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public UtwXml(KaitaiStream _io, KaitaiStruct _parent, UtwXml _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.xmlContent = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
    }

    public void _fetchInstances() {
    }
    private String xmlContent;
    private UtwXml _root;
    private KaitaiStruct _parent;

    /**
     * XML document content as UTF-8 text
     */
    public String xmlContent() { return xmlContent; }
    public UtwXml _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
