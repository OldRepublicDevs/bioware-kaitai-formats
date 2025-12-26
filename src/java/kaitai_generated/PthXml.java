// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * Human-readable XML representation of PTH (Path/Pathfinding) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../pth/pth.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-PTH.md, GFF-File-Format.md)
 */
public class PthXml extends KaitaiStruct {
    public static PthXml fromFile(String fileName) throws IOException {
        return new PthXml(new ByteBufferKaitaiStream(fileName));
    }

    public PthXml(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PthXml(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public PthXml(KaitaiStream _io, KaitaiStruct _parent, PthXml _root) {
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
    private PthXml _root;
    private KaitaiStruct _parent;

    /**
     * XML document content as UTF-8 text
     */
    public String xmlContent() { return xmlContent; }
    public PthXml _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
