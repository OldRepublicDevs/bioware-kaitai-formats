// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * UTE (Encounter Template) files define spawn encounters with creature lists and probabilities.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTE Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Encounter name
 * - CreatureList (List): Creatures to spawn with probabilities
 * - Difficulty, MaxCreatures, RecCreatures, SpawnOption: Spawn behavior
 * - Script hooks: OnEntered, OnExhausted, OnExit, OnHeartbeat, OnUserDefined
 */
public class Ute extends KaitaiStruct {
    public static Ute fromFile(String fileName) throws IOException {
        return new Ute(new ByteBufferKaitaiStream(fileName));
    }

    public Ute(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ute(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Ute(KaitaiStream _io, KaitaiStruct _parent, Ute _root) {
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
        this.fileTypeValid = gffData().header().fileType().equals("UTE ");
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
    private Ute _root;
    private KaitaiStruct _parent;
    public Gff.Gff gffData() { return gffData; }
    public Ute _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
