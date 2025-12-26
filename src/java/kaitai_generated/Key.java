// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;


/**
 * KEY files serve as the master index for all BIF files in the game.
 * They map resource names (ResRefs) and types to specific locations within BIF archives.
 * 
 * The KEY file contains:
 * - BIF file entries (filename, size, location)
 * - KEY entries mapping ResRef + ResourceType to Resource ID
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/KEY-File-Format.md
 * - https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/key.html
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/keyreader.cpp
 */
public class Key extends KaitaiStruct {
    public static Key fromFile(String fileName) throws IOException {
        return new Key(new ByteBufferKaitaiStream(fileName));
    }

    public enum XoreosFileTypeId {
        NONE(-1),
        RES(0),
        BMP(1),
        MVE(2),
        TGA(3),
        WAV(4),
        PLT(6),
        INI(7),
        BMU(8),
        MPG(9),
        TXT(10),
        WMA(11),
        WMV(12),
        XMV(13),
        PLH(2000),
        TEX(2001),
        MDL(2002),
        THG(2003),
        FNT(2005),
        LUA(2007),
        SLT(2008),
        NSS(2009),
        NCS(2010),
        MOD(2011),
        ARE(2012),
        SET(2013),
        IFO(2014),
        BIC(2015),
        WOK(2016),
        TWO_DA(2017),
        TLK(2018),
        TXI(2022),
        GIT(2023),
        BTI(2024),
        UTI(2025),
        BTC(2026),
        UTC(2027),
        DLG(2029),
        ITP(2030),
        BTT(2031),
        UTT(2032),
        DDS(2033),
        BTS(2034),
        UTS(2035),
        LTR(2036),
        GFF(2037),
        FAC(2038),
        BTE(2039),
        UTE(2040),
        BTD(2041),
        UTD(2042),
        BTP(2043),
        UTP(2044),
        DFT(2045),
        GIC(2046),
        GUI(2047),
        CSS(2048),
        CCS(2049),
        BTM(2050),
        UTM(2051),
        DWK(2052),
        PWK(2053),
        BTG(2054),
        UTG(2055),
        JRL(2056),
        SAV(2057),
        UTW(2058),
        FOUR_PC(2059),
        SSF(2060),
        HAK(2061),
        NWM(2062),
        BIK(2063),
        NDB(2064),
        PTM(2065),
        PTT(2066),
        NCM(2067),
        MFX(2068),
        MAT(2069),
        MDB(2070),
        SAY(2071),
        TTF(2072),
        TTC(2073),
        CUT(2074),
        KA(2075),
        JPG(2076),
        ICO(2077),
        OGG(2078),
        SPT(2079),
        SPW(2080),
        WFX(2081),
        UGM(2082),
        QDB(2083),
        QST(2084),
        NPC(2085),
        SPN(2086),
        UTX(2087),
        MMD(2088),
        SMM(2089),
        UTA(2090),
        MDE(2091),
        MDV(2092),
        MDA(2093),
        MBA(2094),
        OCT(2095),
        BFX(2096),
        PDB(2097),
        THE_WITCHER_SAVE(2098),
        PVS(2099),
        CFX(2100),
        LUC(2101),
        PRB(2103),
        CAM(2104),
        VDS(2105),
        BIN(2106),
        WOB(2107),
        API(2108),
        PROPERTIES(2109),
        PNG(2110),
        LYT(3000),
        VIS(3001),
        RIM(3002),
        PTH(3003),
        LIP(3004),
        BWM(3005),
        TXB(3006),
        TPC(3007),
        MDX(3008),
        RSV(3009),
        SIG(3010),
        MAB(3011),
        QST2(3012),
        STO(3013),
        HEX(3015),
        MDX2(3016),
        TXB2(3017),
        FSM(3022),
        ART(3023),
        AMP(3024),
        CWA(3025),
        BIP(3028),
        MDB2(4000),
        MDA2(4001),
        SPT2(4002),
        GR2(4003),
        FXA(4004),
        FXE(4005),
        JPG2(4007),
        PWC(4008),
        ONE_DA(9996),
        ERF(9997),
        BIF(9998),
        KEY(9999),
        EXE(19000),
        DBF(19001),
        CDX(19002),
        FPT(19003),
        ZIP(20000),
        FXM(20001),
        FXS(20002),
        XML(20003),
        WLK(20004),
        UTR(20005),
        SEF(20006),
        PFX(20007),
        TFX(20008),
        IFX(20009),
        LFX(20010),
        BBX(20011),
        PFB(20012),
        UPE(20013),
        USC(20014),
        ULT(20015),
        FX(20016),
        MAX(20017),
        DOC(20018),
        SCC(20019),
        WMP(20020),
        OSC(20021),
        TRN(20022),
        UEN(20023),
        ROS(20024),
        RST(20025),
        PTX(20026),
        LTX(20027),
        TRX(20028),
        NDS(21000),
        HERF(21001),
        DICT(21002),
        SMALL(21003),
        CBGT(21004),
        CDPTH(21005),
        EMIT(21006),
        ITM(21007),
        NANR(21008),
        NBFP(21009),
        NBFS(21010),
        NCER(21011),
        NCGR(21012),
        NCLR(21013),
        NFTR(21014),
        NSBCA(21015),
        NSBMD(21016),
        NSBTA(21017),
        NSBTP(21018),
        NSBTX(21019),
        PAL(21020),
        RAW(21021),
        SADL(21022),
        SDAT(21023),
        SMP(21024),
        SPL(21025),
        VX(21026),
        ANB(22000),
        ANI(22001),
        CNS(22002),
        CUR(22003),
        EVT(22004),
        FDL(22005),
        FXO(22006),
        GAD(22007),
        GDA(22008),
        GFX(22009),
        LDF(22010),
        LST(22011),
        MAL(22012),
        MAO(22013),
        MMH(22014),
        MOP(22015),
        MOR(22016),
        MSH(22017),
        MTX(22018),
        NCC(22019),
        PHY(22020),
        PLO(22021),
        STG(22022),
        TBI(22023),
        TNT(22024),
        ARL(22025),
        FEV(22026),
        FSB(22027),
        OPF(22028),
        CRF(22029),
        RIMP(22030),
        MET(22031),
        META(22032),
        FXR(22033),
        CIF(22034),
        CUB(22035),
        DLB(22036),
        NSC(22037),
        MOV(23000),
        CURS(23001),
        PICT(23002),
        RSRC(23003),
        PLIST(23004),
        CRE(24000),
        PSO(24001),
        VSO(24002),
        ABC(24003),
        SBM(24004),
        PVD(24005),
        PLA(24006),
        TRG(24007),
        PK(24008),
        ALS(25000),
        APL(25001),
        ASSEMBLY(25002),
        BAK(25003),
        BNK(25004),
        CL(25005),
        CNV(25006),
        CON(25007),
        DAT(25008),
        DX11(25009),
        IDS(25010),
        LOG(25011),
        MAP(25012),
        MML(25013),
        MP3(25014),
        PCK(25015),
        RML(25016),
        S(25017),
        STA(25018),
        SVR(25019),
        VLM(25020),
        WBD(25021),
        XBX(25022),
        XLS(25023),
        BZF(26000),
        ADV(27000),
        JSON(28000),
        TLK_EXPERT(28001),
        TLK_MOBILE(28002),
        TLK_TOUCH(28003),
        OTF(28004),
        PAR(28005),
        XWB(29000),
        XSB(29001),
        XDS(30000),
        WND(30001),
        XEOSITEX(40000);

        private final long id;
        XoreosFileTypeId(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, XoreosFileTypeId> byId = new HashMap<Long, XoreosFileTypeId>(301);
        static {
            for (XoreosFileTypeId e : XoreosFileTypeId.values())
                byId.put(e.id(), e);
        }
        public static XoreosFileTypeId byId(long id) { return byId.get(id); }
    }

    public Key(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Key(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Key(KaitaiStream _io, KaitaiStruct _parent, Key _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.fileType = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
        if (!(this.fileType.equals("KEY "))) {
            throw new KaitaiStream.ValidationNotEqualError("KEY ", this.fileType, this._io, "/seq/0");
        }
        this.fileVersion = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
        if (!( ((this.fileVersion.equals("V1  ")) || (this.fileVersion.equals("V1.1"))) )) {
            throw new KaitaiStream.ValidationNotAnyOfError(this.fileVersion, this._io, "/seq/1");
        }
        this.bifCount = this._io.readU4le();
        this.keyCount = this._io.readU4le();
        this.fileTableOffset = this._io.readU4le();
        this.keyTableOffset = this._io.readU4le();
        this.buildYear = this._io.readU4le();
        this.buildDay = this._io.readU4le();
        this.reserved = this._io.readBytes(32);
    }

    public void _fetchInstances() {
        fileTable();
        if (this.fileTable != null) {
            this.fileTable._fetchInstances();
        }
        keyTable();
        if (this.keyTable != null) {
            this.keyTable._fetchInstances();
        }
    }
    public static class FileEntry extends KaitaiStruct {
        public static FileEntry fromFile(String fileName) throws IOException {
            return new FileEntry(new ByteBufferKaitaiStream(fileName));
        }

        public FileEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileEntry(KaitaiStream _io, Key.FileTable _parent) {
            this(_io, _parent, null);
        }

        public FileEntry(KaitaiStream _io, Key.FileTable _parent, Key _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fileSize = this._io.readU4le();
            this.filenameOffset = this._io.readU4le();
            this.filenameSize = this._io.readU2le();
            this.drives = this._io.readU2le();
        }

        public void _fetchInstances() {
            filename();
            if (this.filename != null) {
            }
        }
        private String filename;

        /**
         * BIF filename (read from filename table at specified offset).
         */
        public String filename() {
            if (this.filename != null)
                return this.filename;
            long _pos = this._io.pos();
            this._io.seek((_root().fileTableOffset() + _root().bifCount() * 12) + filenameOffset());
            this.filename = new String(this._io.readBytes(filenameSize()), StandardCharsets.US_ASCII);
            this._io.seek(_pos);
            return this.filename;
        }
        private long fileSize;
        private long filenameOffset;
        private int filenameSize;
        private int drives;
        private Key _root;
        private Key.FileTable _parent;

        /**
         * Size of the BIF file on disk in bytes.
         */
        public long fileSize() { return fileSize; }

        /**
         * Byte offset into the filename table where this BIF's filename is stored.
         */
        public long filenameOffset() { return filenameOffset; }

        /**
         * Length of the filename in bytes (including null terminator).
         */
        public int filenameSize() { return filenameSize; }

        /**
         * Drive flags indicating which media contains the BIF file.
         * Bit flags: 0x0001=HD0, 0x0002=CD1, 0x0004=CD2, 0x0008=CD3, 0x0010=CD4.
         * Modern distributions typically use 0x0001 (HD) for all files.
         */
        public int drives() { return drives; }
        public Key _root() { return _root; }
        public Key.FileTable _parent() { return _parent; }
    }
    public static class FileTable extends KaitaiStruct {
        public static FileTable fromFile(String fileName) throws IOException {
            return new FileTable(new ByteBufferKaitaiStream(fileName));
        }

        public FileTable(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileTable(KaitaiStream _io, Key _parent) {
            this(_io, _parent, null);
        }

        public FileTable(KaitaiStream _io, Key _parent, Key _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<FileEntry>();
            for (int i = 0; i < _root().bifCount(); i++) {
                this.entries.add(new FileEntry(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<FileEntry> entries;
        private Key _root;
        private Key _parent;

        /**
         * Array of BIF file entries.
         */
        public List<FileEntry> entries() { return entries; }
        public Key _root() { return _root; }
        public Key _parent() { return _parent; }
    }
    public static class FilenameTable extends KaitaiStruct {
        public static FilenameTable fromFile(String fileName) throws IOException {
            return new FilenameTable(new ByteBufferKaitaiStream(fileName));
        }

        public FilenameTable(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FilenameTable(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public FilenameTable(KaitaiStream _io, KaitaiStruct _parent, Key _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.filenames = new String(this._io.readBytesFull(), StandardCharsets.US_ASCII);
        }

        public void _fetchInstances() {
        }
        private String filenames;
        private Key _root;
        private KaitaiStruct _parent;

        /**
         * Null-terminated BIF filenames concatenated together.
         * Each filename is read using the filename_offset and filename_size
         * from the corresponding file_entry.
         */
        public String filenames() { return filenames; }
        public Key _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class KeyEntry extends KaitaiStruct {
        public static KeyEntry fromFile(String fileName) throws IOException {
            return new KeyEntry(new ByteBufferKaitaiStream(fileName));
        }

        public KeyEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public KeyEntry(KaitaiStream _io, Key.KeyTable _parent) {
            this(_io, _parent, null);
        }

        public KeyEntry(KaitaiStream _io, Key.KeyTable _parent, Key _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.resref = new String(this._io.readBytes(16), StandardCharsets.US_ASCII);
            this.resourceType = Key.XoreosFileTypeId.byId(this._io.readU2le());
            this.resourceId = this._io.readU4le();
        }

        public void _fetchInstances() {
        }
        private String resref;
        private XoreosFileTypeId resourceType;
        private long resourceId;
        private Key _root;
        private Key.KeyTable _parent;

        /**
         * Resource filename (ResRef) without extension.
         * Null-padded, maximum 16 characters.
         * The game uses this name to access the resource.
         */
        public String resref() { return resref; }

        /**
         * Resource type identifier (see ResourceType enum).
         */
        public XoreosFileTypeId resourceType() { return resourceType; }

        /**
         * Encoded resource location.
         * Bits 31-20: BIF index (top 12 bits) - index into file table
         * Bits 19-0: Resource index (bottom 20 bits) - index within the BIF file
         * 
         * Formula: resource_id = (bif_index << 20) | resource_index
         * 
         * Decoding:
         * - bif_index = (resource_id >> 20) & 0xFFF
         * - resource_index = resource_id & 0xFFFFF
         */
        public long resourceId() { return resourceId; }
        public Key _root() { return _root; }
        public Key.KeyTable _parent() { return _parent; }
    }
    public static class KeyTable extends KaitaiStruct {
        public static KeyTable fromFile(String fileName) throws IOException {
            return new KeyTable(new ByteBufferKaitaiStream(fileName));
        }

        public KeyTable(KaitaiStream _io) {
            this(_io, null, null);
        }

        public KeyTable(KaitaiStream _io, Key _parent) {
            this(_io, _parent, null);
        }

        public KeyTable(KaitaiStream _io, Key _parent, Key _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<KeyEntry>();
            for (int i = 0; i < _root().keyCount(); i++) {
                this.entries.add(new KeyEntry(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<KeyEntry> entries;
        private Key _root;
        private Key _parent;

        /**
         * Array of resource entries.
         */
        public List<KeyEntry> entries() { return entries; }
        public Key _root() { return _root; }
        public Key _parent() { return _parent; }
    }
    private FileTable fileTable;

    /**
     * File table containing BIF file entries.
     */
    public FileTable fileTable() {
        if (this.fileTable != null)
            return this.fileTable;
        if (bifCount() > 0) {
            long _pos = this._io.pos();
            this._io.seek(fileTableOffset());
            this.fileTable = new FileTable(this._io, this, _root);
            this._io.seek(_pos);
        }
        return this.fileTable;
    }
    private KeyTable keyTable;

    /**
     * KEY table containing resource entries.
     */
    public KeyTable keyTable() {
        if (this.keyTable != null)
            return this.keyTable;
        if (keyCount() > 0) {
            long _pos = this._io.pos();
            this._io.seek(keyTableOffset());
            this.keyTable = new KeyTable(this._io, this, _root);
            this._io.seek(_pos);
        }
        return this.keyTable;
    }
    private String fileType;
    private String fileVersion;
    private long bifCount;
    private long keyCount;
    private long fileTableOffset;
    private long keyTableOffset;
    private long buildYear;
    private long buildDay;
    private byte[] reserved;
    private Key _root;
    private KaitaiStruct _parent;

    /**
     * File type signature. Must be "KEY " (space-padded).
     */
    public String fileType() { return fileType; }

    /**
     * File format version. Typically "V1  " or "V1.1".
     */
    public String fileVersion() { return fileVersion; }

    /**
     * Number of BIF files referenced by this KEY file.
     */
    public long bifCount() { return bifCount; }

    /**
     * Number of resource entries in the KEY table.
     */
    public long keyCount() { return keyCount; }

    /**
     * Byte offset to the file table from the beginning of the file.
     */
    public long fileTableOffset() { return fileTableOffset; }

    /**
     * Byte offset to the KEY table from the beginning of the file.
     */
    public long keyTableOffset() { return keyTableOffset; }

    /**
     * Build year (years since 1900).
     */
    public long buildYear() { return buildYear; }

    /**
     * Build day (days since January 1).
     */
    public long buildDay() { return buildDay; }

    /**
     * Reserved padding (usually zeros).
     */
    public byte[] reserved() { return reserved; }
    public Key _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
