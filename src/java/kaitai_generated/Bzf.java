// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;


/**
 * BZF (BioWare Zipped File) files are LZMA-compressed BIF files used primarily in iOS
 * (and maybe Android) ports of KotOR. The BZF header contains "BZF " + "V1.0", followed
 * by LZMA-compressed BIF data. Decompression reveals a standard BIF structure.
 * 
 * Format Structure:
 * - Header (8 bytes): File type signature "BZF " and version "V1.0"
 * - Compressed Data: LZMA-compressed BIF file data
 * 
 * After decompression, the data follows the standard BIF format structure.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/BIF-File-Format.md - BZF compression section
 * - BIF.ksy - Standard BIF format (decompressed BZF data matches this)
 */
public class Bzf extends KaitaiStruct {
    public static Bzf fromFile(String fileName) throws IOException {
        return new Bzf(new ByteBufferKaitaiStream(fileName));
    }

    public Bzf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Bzf(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Bzf(KaitaiStream _io, KaitaiStruct _parent, Bzf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.fileType = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
        if (!(this.fileType.equals("BZF "))) {
            throw new KaitaiStream.ValidationNotEqualError("BZF ", this.fileType, this._io, "/seq/0");
        }
        this.version = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
        if (!(this.version.equals("V1.0"))) {
            throw new KaitaiStream.ValidationNotEqualError("V1.0", this.version, this._io, "/seq/1");
        }
        this.compressedData = new ArrayList<Integer>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.compressedData.add(this._io.readU1());
                i++;
            }
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.compressedData.size(); i++) {
        }
    }
    private String fileType;
    private String version;
    private List<Integer> compressedData;
    private Bzf _root;
    private KaitaiStruct _parent;

    /**
     * File type signature. Must be "BZF " for compressed BIF files.
     */
    public String fileType() { return fileType; }

    /**
     * File format version. Always "V1.0" for BZF files.
     */
    public String version() { return version; }

    /**
     * LZMA-compressed BIF file data.
     * This data must be decompressed using LZMA algorithm to obtain the standard BIF structure.
     * After decompression, the data can be parsed using the BIF format definition.
     */
    public List<Integer> compressedData() { return compressedData; }
    public Bzf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
