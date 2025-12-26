// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * CNV (Conversation) files are GFF-based format files that store conversation trees with entries, replies,
 * links, and conversation metadata. CNV files use the GFF (Generic File Format) binary structure
 * with file type signature "CNV ".
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds CNV-specific
 * validation and documentation.
 * 
 * CNV files are used by Eclipse Engine games (Dragon Age Origins, Dragon Age 2, Mass Effect, Mass Effect 2).
 * They are similar to DLG files used by Odyssey and Aurora engines but adapted for Eclipse's conversation system.
 * 
 * CNV Root Struct Fields:
 * - NumWords (Int32): Word count for conversation
 * - Skippable (UInt8): Whether conversation can be skipped
 * - ConversationType (Int32): Conversation type identifier
 * - EntryList (List): NPC dialogue lines (CNVEntry structs)
 * - ReplyList (List): Player response options (CNVReply structs)
 * - StartingList (List): Entry points (CNVLink structs)
 * - StuntList (List): Special animations (CNVStunt structs)
 * 
 * Each Entry/Reply contains:
 * - Text (LocalizedString): Dialogue text
 * - Script (ResRef): Conditional/action scripts
 * - Camera settings, animations, links to other nodes
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-CNV.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 */
public class Cnv extends KaitaiStruct {
    public static Cnv fromFile(String fileName) throws IOException {
        return new Cnv(new ByteBufferKaitaiStream(fileName));
    }

    public Cnv(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Cnv(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Cnv(KaitaiStream _io, KaitaiStruct _parent, Cnv _root) {
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
     * Validates that this is a CNV file (file type must be "CNV ")
     */
    public Boolean fileTypeValid() {
        if (this.fileTypeValid != null)
            return this.fileTypeValid;
        this.fileTypeValid = gffData().header().fileType().equals("CNV ");
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
    private Cnv _root;
    private KaitaiStruct _parent;

    /**
     * Complete GFF structure. CNV files use standard GFF format with "CNV " file type.
     * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
     */
    public Gff.Gff gffData() { return gffData; }
    public Cnv _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
