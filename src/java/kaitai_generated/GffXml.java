// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * GFF XML format is a human-readable XML representation of GFF (Generic File Format) binary files.
 * Used by xoreos-tools and other modding tools for easier editing than binary GFF format.
 * 
 * The XML format represents the hierarchical GFF structure using XML elements:
 * - Root element: <gff3>
 * - Contains a <struct> element with id attribute
 * - Struct contains field elements (byte, uint32, exostring, locstring, resref, list, etc.)
 * - Each field has a label attribute
 * - Lists contain nested <struct> elements
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 * - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffdumper.cpp
 * - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffcreator.cpp
 */
public class GffXml extends KaitaiStruct {
    public static GffXml fromFile(String fileName) throws IOException {
        return new GffXml(new ByteBufferKaitaiStream(fileName));
    }

    public GffXml(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GffXml(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public GffXml(KaitaiStream _io, KaitaiStruct _parent, GffXml _root) {
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
    private GffXml _root;
    private KaitaiStruct _parent;

    /**
     * XML document content as UTF-8 text.
     * Structure: <gff3><struct id="...">...</struct></gff3>
     * Note: Kaitai Struct has limited XML parsing capabilities. For full XML parsing,
     * use an XML parser library. This definition serves as a format identifier.
     */
    public String xmlContent() { return xmlContent; }
    public GffXml _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
