// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * Human-readable XML representation of UTM (Store/Merchant Template) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../utm/utm.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-UTM.md, GFF-File-Format.md)
 */
public class UtmXml extends KaitaiStruct {
    public static UtmXml fromFile(String fileName) throws IOException {
        return new UtmXml(new ByteBufferKaitaiStream(fileName));
    }

    public UtmXml(KaitaiStream _io) {
        this(_io, null, null);
    }

    public UtmXml(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public UtmXml(KaitaiStream _io, KaitaiStruct _parent, UtmXml _root) {
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
    private UtmXml _root;
    private KaitaiStruct _parent;

    /**
     * XML document content as UTF-8 text
     */
    public String xmlContent() { return xmlContent; }
    public UtmXml _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
