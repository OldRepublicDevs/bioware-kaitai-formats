// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * GUI (Graphical User Interface) files define UI layouts, controls, and properties.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * GUI Root Struct Fields:
 * - CONTROLS (List): UI control elements (buttons, labels, listboxes, etc.)
 * - Each control contains:
 *   - CONTROLTYPE (Int32): Control type (button=4, label=5, listbox=9, etc.)
 *   - TAG (String): Control identifier
 *   - X, Y, WIDTH, HEIGHT (Int32): Position and size
 *   - TEXT (Struct): Text properties with STRREF, color, alignment
 *   - BORDER (Struct): Border properties
 *   - EXTENT (Struct): Dimensions
 *   - Various control-specific fields
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GUI.md
 */
public class Gui extends KaitaiStruct {
    public static Gui fromFile(String fileName) throws IOException {
        return new Gui(new ByteBufferKaitaiStream(fileName));
    }

    public Gui(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Gui(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Gui(KaitaiStream _io, KaitaiStruct _parent, Gui _root) {
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
        this.fileTypeValid = gffData().header().fileType().equals("GUI ");
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
    private Gui _root;
    private KaitaiStruct _parent;
    public Gff.Gff gffData() { return gffData; }
    public Gui _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
