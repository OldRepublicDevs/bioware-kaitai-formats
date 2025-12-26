// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * GVT (Global Variables Table) files store global game variables.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * GVT Root Struct Fields:
 * - ValNumber, ValBoolean, ValString lists for different variable types
 */
public class Gvt extends KaitaiStruct {
    public static Gvt fromFile(String fileName) throws IOException {
        return new Gvt(new ByteBufferKaitaiStream(fileName));
    }

    public Gvt(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Gvt(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Gvt(KaitaiStream _io, KaitaiStruct _parent, Gvt _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.gffData = new Gff.Gff(this._io);
    }

    public void _fetchInstances() {
        this.gffData._fetchInstances();
    }
    private Boolean fileTypeValid;
    public Boolean fileTypeValid() {
        if (this.fileTypeValid != null)
            return this.fileTypeValid;
        this.fileTypeValid = gffData().header().fileType().equals("GVT ");
        return this.fileTypeValid;
    }
    private Boolean versionValid;
    public Boolean versionValid() {
        if (this.versionValid != null)
            return this.versionValid;
        this.versionValid =  ((gffData().header().fileVersion().equals("V3.2")) || (gffData().header().fileVersion().equals("V3.3")) || (gffData().header().fileVersion().equals("V4.0")) || (gffData().header().fileVersion().equals("V4.1"))) ;
        return this.versionValid;
    }
    private Gff.Gff gffData;
    private Gvt _root;
    private KaitaiStruct _parent;
    public Gff.Gff gffData() { return gffData; }
    public Gvt _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
