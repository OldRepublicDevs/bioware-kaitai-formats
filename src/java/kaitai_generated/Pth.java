// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * PTH (Path/Pathfinding) files store pathfinding waypoint graphs for AI navigation.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * PTH Root Struct Fields:
 * - Path_Points (List): Waypoint positions (X, Y coordinates)
 * - Connections (List): Connections between waypoints
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PTH.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/pth.py
 */
public class Pth extends KaitaiStruct {
    public static Pth fromFile(String fileName) throws IOException {
        return new Pth(new ByteBufferKaitaiStream(fileName));
    }

    public Pth(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Pth(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Pth(KaitaiStream _io, KaitaiStruct _parent, Pth _root) {
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
        this.fileTypeValid = gffData().header().fileType().equals("PTH ");
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
    private Pth _root;
    private KaitaiStruct _parent;
    public Gff.Gff gffData() { return gffData; }
    public Pth _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
