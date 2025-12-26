// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * Human-readable XML representation of NFO (Module Info) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../nfo/nfo.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-NFO.md, GFF-File-Format.md)
 */
public class NfoXml extends KaitaiStruct {
    public static NfoXml fromFile(String fileName) throws IOException {
        return new NfoXml(new ByteBufferKaitaiStream(fileName));
    }

    public NfoXml(KaitaiStream _io) {
        this(_io, null, null);
    }

    public NfoXml(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public NfoXml(KaitaiStream _io, KaitaiStruct _parent, NfoXml _root) {
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
    private NfoXml _root;
    private KaitaiStruct _parent;

    /**
     * XML document content as UTF-8 text
     */
    public String xmlContent() { return xmlContent; }
    public NfoXml _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
