// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * ARE (Area) files are GFF-based format files that store static area information including
 * lighting, fog, grass, weather, script hooks, and map data. ARE files use the GFF (Generic File Format)
 * binary structure with file type signature "ARE ".
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds ARE-specific
 * validation and documentation.
 * 
 * ARE Root Struct Fields (Common):
 * - "Tag" (String): Unique area identifier
 * - "Name" (LocalizedString): Area display name
 * - "SunAmbientColor", "SunDiffuseColor" (UInt32): Lighting colors (BGR format)
 * - "SunFogOn", "SunFogNear", "SunFogFar", "SunFogColor": Fog settings
 * - "Grass_*": Grass rendering properties
 * - "OnEnter", "OnExit", "OnHeartbeat", "OnUserDefined": Script hooks (ResRef)
 * - "Map" (Struct): Minimap coordinate mapping
 * - "Rooms" (List): Audio zones and weather regions
 * 
 * KotOR 2 adds weather fields:
 * - "ChanceRain", "ChanceSnow", "ChanceLightning" (Int32)
 * - "Dirty*" fields for dust particle effects
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-ARE.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/are.py
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/are.cpp
 */
public class Are extends KaitaiStruct {
    public static Are fromFile(String fileName) throws IOException {
        return new Are(new ByteBufferKaitaiStream(fileName));
    }

    public Are(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Are(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Are(KaitaiStream _io, KaitaiStruct _parent, Are _root) {
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
     * Validates that this is an ARE file (file type must be "ARE ")
     */
    public Boolean fileTypeValid() {
        if (this.fileTypeValid != null)
            return this.fileTypeValid;
        this.fileTypeValid = gffData().header().fileType().equals("ARE ");
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
    private Are _root;
    private KaitaiStruct _parent;

    /**
     * Complete GFF structure. ARE files use standard GFF format with "ARE " file type.
     * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
     */
    public Gff.Gff gffData() { return gffData; }
    public Are _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
