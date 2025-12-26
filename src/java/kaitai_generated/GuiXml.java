// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * Human-readable XML representation of GUI (Graphical User Interface) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../gui/gui.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-GUI.md, GFF-File-Format.md)
 */
public class GuiXml extends KaitaiStruct {
    public static GuiXml fromFile(String fileName) throws IOException {
        return new GuiXml(new ByteBufferKaitaiStream(fileName));
    }

    public GuiXml(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GuiXml(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public GuiXml(KaitaiStream _io, KaitaiStruct _parent, GuiXml _root) {
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
    private GuiXml _root;
    private KaitaiStruct _parent;

    /**
     * XML document content as UTF-8 text
     */
    public String xmlContent() { return xmlContent; }
    public GuiXml _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
