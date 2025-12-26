// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * TLK XML format is a human-readable XML representation of TLK (Talk Table) binary files.
 * Provides easier editing and translation than binary TLK format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/tlk.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/io_tlk_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/resource/format/tlkreader.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/TLK-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/aurora/talktable.cpp
 * 
 * - ../GFF/GFF
 * - ../GFF/XML/GFF_XML
 * - ../TLK/TLK
 */
public class TlkXml extends KaitaiStruct {
    public static TlkXml fromFile(String fileName) throws IOException {
        return new TlkXml(new ByteBufferKaitaiStream(fileName));
    }

    public TlkXml(KaitaiStream _io) {
        this(_io, null, null);
    }

    public TlkXml(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public TlkXml(KaitaiStream _io, KaitaiStruct _parent, TlkXml _root) {
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
    private TlkXml _root;
    private KaitaiStruct _parent;

    /**
     * XML document content as UTF-8 text
     */
    public String xmlContent() { return xmlContent; }
    public TlkXml _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
