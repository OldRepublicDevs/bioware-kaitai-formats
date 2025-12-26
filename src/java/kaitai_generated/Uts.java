// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * UTS (Sound Template) files define ambient sound sources and properties.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTS Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Sound name
 * - Sounds (List): Sound file references
 * - Volume, MaxDistance, MinDistance: Audio properties
 * - Looping, Random, Positional: Sound behavior
 */
public class Uts extends KaitaiStruct {
    public static Uts fromFile(String fileName) throws IOException {
        return new Uts(new ByteBufferKaitaiStream(fileName));
    }

    public Uts(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Uts(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Uts(KaitaiStream _io, KaitaiStruct _parent, Uts _root) {
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
        this.fileTypeValid = gffData().header().fileType().equals("UTS ");
        return this.fileTypeValid;
    }
    private Boolean versionValid;
    public Boolean versionValid() {
        if (this.versionValid != null)
            return this.versionValid;
        this.versionValid =  ((gffData().header().fileVersion().equals("V3.2")) || (gffData().header().fileVersion().equals("V3.3"))) ;
        return this.versionValid;
    }
    private Gff.Gff gffData;
    private Uts _root;
    private KaitaiStruct _parent;
    public Gff.Gff gffData() { return gffData; }
    public Uts _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
