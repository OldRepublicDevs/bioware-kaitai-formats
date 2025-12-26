// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * DLG (Dialogue) files are GFF-based format files that store conversation trees with entries, replies,
 * links, and conversation metadata for Odyssey and Aurora engines.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds DLG-specific
 * validation and documentation.
 * 
 * DLG files contain:
 * - Root struct with conversation metadata (NumWords, Skippable, ConversationType, etc.)
 * - EntryList: Array of dialogue entries (NPC lines)
 * - ReplyList: Array of reply options (player responses)
 * - StartingList: Array of entry points into conversation tree
 * - StuntList: Array of cutscene/animation sequences
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-DLG.md
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/dlg/
 */
public class Dlg extends KaitaiStruct {
    public static Dlg fromFile(String fileName) throws IOException {
        return new Dlg(new ByteBufferKaitaiStream(fileName));
    }

    public Dlg(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Dlg(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Dlg(KaitaiStream _io, KaitaiStruct _parent, Dlg _root) {
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
     * Validates DLG file type
     */
    public Boolean fileTypeValid() {
        if (this.fileTypeValid != null)
            return this.fileTypeValid;
        this.fileTypeValid = gffData().header().fileType().equals("DLG ");
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
    private Dlg _root;
    private KaitaiStruct _parent;

    /**
     * Complete GFF structure with "DLG " file type
     */
    public Gff.Gff gffData() { return gffData; }
    public Dlg _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
