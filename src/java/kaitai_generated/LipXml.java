// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * LIP XML format is a human-readable XML representation of LIP (Lipsync) binary files.
 * Provides easier editing than binary LIP format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/lip.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/io_lip_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/graphics/format/lipreader.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/LIP-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/graphics/aurora/lipfile.cpp
 * 
 * - ../GFF/GFF
 * - ../GFF/XML/GFF_XML
 * - ../LIP/LIP
 */
public class LipXml extends KaitaiStruct {
    public static LipXml fromFile(String fileName) throws IOException {
        return new LipXml(new ByteBufferKaitaiStream(fileName));
    }

    public LipXml(KaitaiStream _io) {
        this(_io, null, null);
    }

    public LipXml(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public LipXml(KaitaiStream _io, KaitaiStruct _parent, LipXml _root) {
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
    private LipXml _root;
    private KaitaiStruct _parent;

    /**
     * XML document content as UTF-8 text
     */
    public String xmlContent() { return xmlContent; }
    public LipXml _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
