// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * UTD (Door Template) files define door properties, scripts, and behavior.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTD Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Door name
 * - Appearance (UInt32): Door appearance ID
 * - Locked, KeyRequired, Trap, Faction (various): Door state/behavior
 * - Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnFailToOpen, etc.
 */
public class Utd extends KaitaiStruct {
    public static Utd fromFile(String fileName) throws IOException {
        return new Utd(new ByteBufferKaitaiStream(fileName));
    }

    public Utd(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Utd(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Utd(KaitaiStream _io, KaitaiStruct _parent, Utd _root) {
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
        this.fileTypeValid = gffData().header().fileType().equals("UTD ");
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
    private Utd _root;
    private KaitaiStruct _parent;
    public Gff.Gff gffData() { return gffData; }
    public Utd _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
