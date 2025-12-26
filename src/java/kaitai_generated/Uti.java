// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * UTI (Item Template) files define item properties, stats, and behavior.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTI Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Item name
 * - Description (LocalizedString): Item description
 * - BaseItem (Int32): Base item type (baseitems.2da)
 * - Cost, StackSize, Charges: Item economics
 * - ModelVariation, TextureVar, BodyVariation: Item appearance
 * - PropertiesList (List): Item properties (damage, attack bonus, etc.)
 */
public class Uti extends KaitaiStruct {
    public static Uti fromFile(String fileName) throws IOException {
        return new Uti(new ByteBufferKaitaiStream(fileName));
    }

    public Uti(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Uti(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Uti(KaitaiStream _io, KaitaiStruct _parent, Uti _root) {
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
        this.fileTypeValid = gffData().header().fileType().equals("UTI ");
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
    private Uti _root;
    private KaitaiStruct _parent;
    public Gff.Gff gffData() { return gffData; }
    public Uti _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
