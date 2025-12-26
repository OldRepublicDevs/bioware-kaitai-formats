// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * UTP (Placeable Template) files define placeable objects (containers, furniture, etc.).
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTP Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Placeable name
 * - Appearance (UInt32): Placeable appearance ID
 * - HasInventory, ItemList (List): Container contents
 * - Locked, KeyRequired, Trap: Security settings
 * - Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnHeartbeat, etc.
 */
public class Utp extends KaitaiStruct {
    public static Utp fromFile(String fileName) throws IOException {
        return new Utp(new ByteBufferKaitaiStream(fileName));
    }

    public Utp(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Utp(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Utp(KaitaiStream _io, KaitaiStruct _parent, Utp _root) {
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
        this.fileTypeValid = gffData().header().fileType().equals("UTP ");
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
    private Utp _root;
    private KaitaiStruct _parent;
    public Gff.Gff gffData() { return gffData; }
    public Utp _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
