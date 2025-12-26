// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * GAM (Game State) files are GFF-based format files that store game state information
 * including party members, global variables, game time, and time played.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds GAM-specific
 * validation and documentation.
 * 
 * GAM files are used by:
 * - Aurora Engine (Neverwinter Nights, Neverwinter Nights 2)
 * - Infinity Engine (Mass Effect, Dragon Age Origins, Dragon Age 2)
 * 
 * NOTE: Odyssey Engine (Knights of the Old Republic) does NOT use GAM format -
 * it uses NFO format for save games instead.
 * 
 * GAM Root Struct Fields:
 * - GameTimeHour, GameTimeMinute, GameTimeSecond, GameTimeMillisecond (Int32): Game time
 * - TimePlayed (Int32): Total playtime in seconds
 * - PartyList (List): Party member ResRefs
 * - GlobalBooleans, GlobalNumbers, GlobalStrings (Lists): Global variable storage
 * 
 * Aurora-specific: ModuleName, CurrentArea, PlayerCharacter
 * Infinity-specific: GameName, Chapter, JournalEntries
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GAM.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 */
public class Gam extends KaitaiStruct {
    public static Gam fromFile(String fileName) throws IOException {
        return new Gam(new ByteBufferKaitaiStream(fileName));
    }

    public Gam(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Gam(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Gam(KaitaiStream _io, KaitaiStruct _parent, Gam _root) {
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
     * Validates that this is a GAM file (file type must be "GAM ")
     */
    public Boolean fileTypeValid() {
        if (this.fileTypeValid != null)
            return this.fileTypeValid;
        this.fileTypeValid = gffData().header().fileType().equals("GAM ");
        return this.fileTypeValid;
    }
    private Boolean versionValid;

    /**
     * Validates GFF version is supported
     */
    public Boolean versionValid() {
        if (this.versionValid != null)
            return this.versionValid;
        this.versionValid =  ((gffData().header().fileVersion().equals("V3.2")) || (gffData().header().fileVersion().equals("V3.3")) || (gffData().header().fileVersion().equals("V4.0")) || (gffData().header().fileVersion().equals("V4.1"))) ;
        return this.versionValid;
    }
    private Gff.Gff gffData;
    private Gam _root;
    private KaitaiStruct _parent;

    /**
     * Complete GFF structure. GAM files use standard GFF format with "GAM " file type.
     * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
     */
    public Gff.Gff gffData() { return gffData; }
    public Gam _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
