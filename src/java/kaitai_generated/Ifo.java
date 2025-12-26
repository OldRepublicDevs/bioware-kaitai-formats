// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * IFO (Module Information) files store module metadata including entry points,
 * starting locations, and module properties.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * IFO Root Struct Fields:
 * - Mod_ID (ResRef): Module identifier
 * - Mod_Name (LocalizedString): Module display name
 * - Mod_Entry_Area (ResRef): Starting area
 * - Mod_Entry_X, Mod_Entry_Y, Mod_Entry_Z (Float): Starting position
 * - Mod_Entry_Dir_X, Mod_Entry_Dir_Y (Float): Starting orientation
 * - Mod_OnHeartbeat, Mod_OnModLoad, Mod_OnModStart (ResRef): Script hooks
 * - Mod_MinGameVer (String): Minimum game version required
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-IFO.md
 */
public class Ifo extends KaitaiStruct {
    public static Ifo fromFile(String fileName) throws IOException {
        return new Ifo(new ByteBufferKaitaiStream(fileName));
    }

    public Ifo(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ifo(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Ifo(KaitaiStream _io, KaitaiStruct _parent, Ifo _root) {
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
        this.fileTypeValid = gffData().header().fileType().equals("IFO ");
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
    private Ifo _root;
    private KaitaiStruct _parent;
    public Gff.Gff gffData() { return gffData; }
    public Ifo _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
