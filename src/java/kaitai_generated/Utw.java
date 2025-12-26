// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * UTW (Waypoint Template) files define navigation waypoints and spawn points.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTW Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Waypoint name
 * - Appearance (UInt32): Visual appearance (if visible)
 * - HasMapNote, MapNote (LocalizedString): Map markers
 * - LinkedTo (String): Connected waypoint tag
 */
public class Utw extends KaitaiStruct {
    public static Utw fromFile(String fileName) throws IOException {
        return new Utw(new ByteBufferKaitaiStream(fileName));
    }

    public Utw(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Utw(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Utw(KaitaiStream _io, KaitaiStruct _parent, Utw _root) {
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
        this.fileTypeValid = gffData().header().fileType().equals("UTW ");
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
    private Utw _root;
    private KaitaiStruct _parent;
    public Gff.Gff gffData() { return gffData; }
    public Utw _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
