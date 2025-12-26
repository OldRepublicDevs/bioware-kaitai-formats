// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * Human-readable XML representation of UTE (Encounter Template) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../ute/ute.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-UTE.md, GFF-File-Format.md)
 */
public class UteXml extends KaitaiStruct {
    public static UteXml fromFile(String fileName) throws IOException {
        return new UteXml(new ByteBufferKaitaiStream(fileName));
    }

    public UteXml(KaitaiStream _io) {
        this(_io, null, null);
    }

    public UteXml(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public UteXml(KaitaiStream _io, KaitaiStruct _parent, UteXml _root) {
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
    private UteXml _root;
    private KaitaiStruct _parent;

    /**
     * XML document content as UTF-8 text
     */
    public String xmlContent() { return xmlContent; }
    public UteXml _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
