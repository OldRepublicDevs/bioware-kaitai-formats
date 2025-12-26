// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * ITP XML format is a human-readable XML representation of ITP (Palette) binary files.
 * ITP files use GFF format (FileType "ITP " in GFF header).
 * Uses GFF XML structure with root element <gff3> containing <struct> elements.
 * Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/itp/itp.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/gff/itp.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/ITP-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/aurora/gff3file.cpp
 */
public class ItpXml extends KaitaiStruct {
    public static ItpXml fromFile(String fileName) throws IOException {
        return new ItpXml(new ByteBufferKaitaiStream(fileName));
    }

    public ItpXml(KaitaiStream _io) {
        this(_io, null, null);
    }

    public ItpXml(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public ItpXml(KaitaiStream _io, KaitaiStruct _parent, ItpXml _root) {
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
    private ItpXml _root;
    private KaitaiStruct _parent;

    /**
     * XML document content as UTF-8 text
     */
    public String xmlContent() { return xmlContent; }
    public ItpXml _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
