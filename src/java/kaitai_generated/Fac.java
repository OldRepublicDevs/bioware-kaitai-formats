// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * FAC (Faction) files are GFF-based format files that store faction relationships,
 * reputation values, and faction metadata.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds FAC-specific
 * validation and documentation.
 * 
 * FAC Root Struct Fields:
 * - FactionName (String): Faction identifier
 * - FactionParentID (UInt16): Parent faction ID
 * - FactionGlobal (UInt16): Global faction flag
 * - RepList (List): Reputation values with other factions
 *   - FactionID (UInt32): Target faction ID
 *   - FactionRep (UInt32): Reputation value (0-100)
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-FAC.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/fac.py
 */
public class Fac extends KaitaiStruct {
    public static Fac fromFile(String fileName) throws IOException {
        return new Fac(new ByteBufferKaitaiStream(fileName));
    }

    public Fac(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Fac(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Fac(KaitaiStream _io, KaitaiStruct _parent, Fac _root) {
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

    /**
     * Validates FAC file type
     */
    public Boolean fileTypeValid() {
        if (this.fileTypeValid != null)
            return this.fileTypeValid;
        this.fileTypeValid = gffData().header().fileType().equals("FAC ");
        return this.fileTypeValid;
    }
    private Boolean versionValid;

    /**
     * Validates GFF version
     */
    public Boolean versionValid() {
        if (this.versionValid != null)
            return this.versionValid;
        this.versionValid =  ((gffData().header().fileVersion().equals("V3.2")) || (gffData().header().fileVersion().equals("V3.3")) || (gffData().header().fileVersion().equals("V4.0")) || (gffData().header().fileVersion().equals("V4.1"))) ;
        return this.versionValid;
    }
    private Gff.Gff gffData;
    private Fac _root;
    private KaitaiStruct _parent;

    /**
     * Complete GFF structure with "FAC " file type
     */
    public Gff.Gff gffData() { return gffData; }
    public Fac _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
