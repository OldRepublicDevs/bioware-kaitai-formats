// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * GIT (Game Instance Template) files store dynamic area instance data including
 * placed creatures, placeables, doors, triggers, waypoints, sounds, stores, and encounters.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * GIT Root Struct Fields:
 * - CreatureList (List): Placed creatures with positions, orientations
 * - DoorList (List): Placed doors with states, scripts
 * - PlaceableList (List): Placed placeables (chests, etc.)
 * - TriggerList (List): Trigger zones
 * - WaypointList (List): Navigation waypoints
 * - SoundList (List): Ambient sounds
 * - StoreList (List): Merchant shops
 * - EncounterList (List): Spawn encounters
 * - CameraList (List): Camera points
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GIT.md
 */
public class Git extends KaitaiStruct {
    public static Git fromFile(String fileName) throws IOException {
        return new Git(new ByteBufferKaitaiStream(fileName));
    }

    public Git(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Git(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Git(KaitaiStream _io, KaitaiStruct _parent, Git _root) {
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
        this.fileTypeValid = gffData().header().fileType().equals("GIT ");
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
    private Git _root;
    private KaitaiStruct _parent;
    public Gff.Gff gffData() { return gffData; }
    public Git _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
