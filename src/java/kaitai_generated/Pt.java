// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * PT (Party Table) files are GFF-based format files that store party and game state information
 * for Odyssey Engine games (KotOR and KotOR 2). PT files use the GFF (Generic File Format) binary
 * structure with file type signature "PT  ".
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds PT-specific
 * validation and documentation.
 * 
 * PT files are typically named "PARTYTABLE.res" and are stored in savegame.sav ERF archives.
 * They contain comprehensive party and game state information including:
 * - Party composition (current members, available NPCs, leader)
 * - Resources (gold/credits, XP pool, components, chemicals)
 * - Journal entries with states, dates, and times
 * - Pazaak cards and side decks for the mini-game
 * - UI state (last panel, messages, tutorial windows shown)
 * - AI state (follow mode, AI enabled, solo mode)
 * - K2-specific: Influence values per companion
 * 
 * PT Root Struct Fields (Common):
 * - "PT_PCNAME" (String): Player character name
 * - "PT_GOLD" (Int32): Credits/gold amount
 * - "PT_XP_POOL" (Int32): Experience points
 * - "PT_PLAYEDSECONDS" (UInt32): Total playtime in seconds
 * - "PT_NUM_MEMBERS" (Int32): Party member count
 * - "PT_CONTROLLED_NPC", "PT_SOLOMODE", "PT_AISTATE", "PT_FOLLOWSTATE" (Int32): AI/party state
 * - "PT_MEMBERS" (List): Party member ResRefs and leader flags
 * - "PT_AVAIL_NPCS" (List): Available NPCs for recruitment
 * - "PT_INFLUENCE" (List): Influence values (KotOR 2 only)
 * - "PT_PAZAAKCARDS", "PT_PAZSIDELIST" (List): Pazaak card collections
 * - Journal/message lists: "PT_FB_MSG_LIST", "PT_DLG_MSG_LIST", "PT_COM_MSG_LIST"
 * 
 * Based on swkotor2.exe: SavePartyTable @ 0x0057bd70
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/extract/savedata.py
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PT.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 */
public class Pt extends KaitaiStruct {
    public static Pt fromFile(String fileName) throws IOException {
        return new Pt(new ByteBufferKaitaiStream(fileName));
    }

    public Pt(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Pt(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Pt(KaitaiStream _io, KaitaiStruct _parent, Pt _root) {
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
     * Validates that this is a PT file (file type must be "PT  ")
     */
    public Boolean fileTypeValid() {
        if (this.fileTypeValid != null)
            return this.fileTypeValid;
        this.fileTypeValid = gffData().header().fileType().equals("PT  ");
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
    private Pt _root;
    private KaitaiStruct _parent;

    /**
     * Complete GFF structure. PT files use standard GFF format with "PT  " file type.
     * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
     */
    public Gff.Gff gffData() { return gffData; }
    public Pt _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
