// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * UTC (Creature Template) files are GFF-based format files that store creature definitions
 * including stats, appearance, inventory, feats, and script hooks. UTC files are used to
 * define NPCs, party members, enemies, and the player character in Knights of the Old Republic.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds UTC-specific
 * validation and documentation.
 * 
 * UTC Root Struct Fields (Common):
 * - "TemplateResRef" (ResRef): Blueprint identifier
 * - "Tag" (String): Unique instance identifier
 * - "FirstName", "LastName" (LocalizedString): Creature name
 * - "Appearance_Type" (UInt32): Appearance ID (appearance.2da)
 * - "PortraitId" (UInt16): Portrait index (portraits.2da)
 * - "Gender", "Race" (UInt8/UInt16): Character attributes
 * - "Str", "Dex", "Con", "Int", "Wis", "Cha" (UInt8): Ability scores
 * - "HitPoints", "MaxHitPoints", "ForcePoints" (Int16): Health/Force stats
 * - "ClassList" (List): Character classes with levels
 * - "FeatList" (List): Known feats
 * - "SkillList" (List): Skill ranks
 * - "ItemList" (List): Inventory items
 * - "Equip_ItemList" (List): Equipped items with slots
 * - Script hooks: "ScriptAttacked", "ScriptDamaged", "ScriptDeath", etc. (ResRef)
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTC.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utc.py
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/utc.cpp
 */
public class Utc extends KaitaiStruct {
    public static Utc fromFile(String fileName) throws IOException {
        return new Utc(new ByteBufferKaitaiStream(fileName));
    }

    public Utc(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Utc(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Utc(KaitaiStream _io, KaitaiStruct _parent, Utc _root) {
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
     * Validates that this is a UTC file (file type must be "UTC ")
     */
    public Boolean fileTypeValid() {
        if (this.fileTypeValid != null)
            return this.fileTypeValid;
        this.fileTypeValid = gffData().header().fileType().equals("UTC ");
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
    private Utc _root;
    private KaitaiStruct _parent;

    /**
     * Complete GFF structure. UTC files use standard GFF format with "UTC " file type.
     * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
     */
    public Gff.Gff gffData() { return gffData; }
    public Utc _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
