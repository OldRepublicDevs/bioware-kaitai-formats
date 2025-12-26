// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * NFO (Module Info) files store save game module information for KotOR.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * Note: This is different from IFO files. NFO is used in save games,
 * while IFO is used in module definitions.
 */
public class Nfo extends KaitaiStruct {
    public static Nfo fromFile(String fileName) throws IOException {
        return new Nfo(new ByteBufferKaitaiStream(fileName));
    }

    public Nfo(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Nfo(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Nfo(KaitaiStream _io, KaitaiStruct _parent, Nfo _root) {
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
        this.fileTypeValid = gffData().header().fileType().equals("NFO ");
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
    private Nfo _root;
    private KaitaiStruct _parent;
    public Gff.Gff gffData() { return gffData; }
    public Nfo _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
