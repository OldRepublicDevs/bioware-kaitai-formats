// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * SSF XML format is a human-readable XML representation of SSF (Soundset) binary files.
 * Provides easier editing than binary SSF format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/io_ssf_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/ssf.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/SSF-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/aurora/ssffile.cpp
 */
public class SsfXml extends KaitaiStruct {
    public static SsfXml fromFile(String fileName) throws IOException {
        return new SsfXml(new ByteBufferKaitaiStream(fileName));
    }

    public SsfXml(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SsfXml(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public SsfXml(KaitaiStream _io, KaitaiStruct _parent, SsfXml _root) {
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
    private SsfXml _root;
    private KaitaiStruct _parent;

    /**
     * XML document content as UTF-8 text
     */
    public String xmlContent() { return xmlContent; }
    public SsfXml _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
