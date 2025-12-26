// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// KEY files serve as the master index for all BIF files in the game.
    /// They map resource names (ResRefs) and types to specific locations within BIF archives.
    /// 
    /// The KEY file contains:
    /// - BIF file entries (filename, size, location)
    /// - KEY entries mapping ResRef + ResourceType to Resource ID
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/KEY-File-Format.md
    /// - https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/key.html
    /// - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/keyreader.cpp
    /// </summary>
    public partial class Key : KaitaiStruct
    {
        public static Key FromFile(string fileName)
        {
            return new Key(new KaitaiStream(fileName));
        }


        public enum XoreosFileTypeId
        {
            None = -1,
            Res = 0,
            Bmp = 1,
            Mve = 2,
            Tga = 3,
            Wav = 4,
            Plt = 6,
            Ini = 7,
            Bmu = 8,
            Mpg = 9,
            Txt = 10,
            Wma = 11,
            Wmv = 12,
            Xmv = 13,
            Plh = 2000,
            Tex = 2001,
            Mdl = 2002,
            Thg = 2003,
            Fnt = 2005,
            Lua = 2007,
            Slt = 2008,
            Nss = 2009,
            Ncs = 2010,
            Mod = 2011,
            Are = 2012,
            Set = 2013,
            Ifo = 2014,
            Bic = 2015,
            Wok = 2016,
            TwoDa = 2017,
            Tlk = 2018,
            Txi = 2022,
            Git = 2023,
            Bti = 2024,
            Uti = 2025,
            Btc = 2026,
            Utc = 2027,
            Dlg = 2029,
            Itp = 2030,
            Btt = 2031,
            Utt = 2032,
            Dds = 2033,
            Bts = 2034,
            Uts = 2035,
            Ltr = 2036,
            Gff = 2037,
            Fac = 2038,
            Bte = 2039,
            Ute = 2040,
            Btd = 2041,
            Utd = 2042,
            Btp = 2043,
            Utp = 2044,
            Dft = 2045,
            Gic = 2046,
            Gui = 2047,
            Css = 2048,
            Ccs = 2049,
            Btm = 2050,
            Utm = 2051,
            Dwk = 2052,
            Pwk = 2053,
            Btg = 2054,
            Utg = 2055,
            Jrl = 2056,
            Sav = 2057,
            Utw = 2058,
            FourPc = 2059,
            Ssf = 2060,
            Hak = 2061,
            Nwm = 2062,
            Bik = 2063,
            Ndb = 2064,
            Ptm = 2065,
            Ptt = 2066,
            Ncm = 2067,
            Mfx = 2068,
            Mat = 2069,
            Mdb = 2070,
            Say = 2071,
            Ttf = 2072,
            Ttc = 2073,
            Cut = 2074,
            Ka = 2075,
            Jpg = 2076,
            Ico = 2077,
            Ogg = 2078,
            Spt = 2079,
            Spw = 2080,
            Wfx = 2081,
            Ugm = 2082,
            Qdb = 2083,
            Qst = 2084,
            Npc = 2085,
            Spn = 2086,
            Utx = 2087,
            Mmd = 2088,
            Smm = 2089,
            Uta = 2090,
            Mde = 2091,
            Mdv = 2092,
            Mda = 2093,
            Mba = 2094,
            Oct = 2095,
            Bfx = 2096,
            Pdb = 2097,
            TheWitcherSave = 2098,
            Pvs = 2099,
            Cfx = 2100,
            Luc = 2101,
            Prb = 2103,
            Cam = 2104,
            Vds = 2105,
            Bin = 2106,
            Wob = 2107,
            Api = 2108,
            Properties = 2109,
            Png = 2110,
            Lyt = 3000,
            Vis = 3001,
            Rim = 3002,
            Pth = 3003,
            Lip = 3004,
            Bwm = 3005,
            Txb = 3006,
            Tpc = 3007,
            Mdx = 3008,
            Rsv = 3009,
            Sig = 3010,
            Mab = 3011,
            Qst2 = 3012,
            Sto = 3013,
            Hex = 3015,
            Mdx2 = 3016,
            Txb2 = 3017,
            Fsm = 3022,
            Art = 3023,
            Amp = 3024,
            Cwa = 3025,
            Bip = 3028,
            Mdb2 = 4000,
            Mda2 = 4001,
            Spt2 = 4002,
            Gr2 = 4003,
            Fxa = 4004,
            Fxe = 4005,
            Jpg2 = 4007,
            Pwc = 4008,
            OneDa = 9996,
            Erf = 9997,
            Bif = 9998,
            Key = 9999,
            Exe = 19000,
            Dbf = 19001,
            Cdx = 19002,
            Fpt = 19003,
            Zip = 20000,
            Fxm = 20001,
            Fxs = 20002,
            Xml = 20003,
            Wlk = 20004,
            Utr = 20005,
            Sef = 20006,
            Pfx = 20007,
            Tfx = 20008,
            Ifx = 20009,
            Lfx = 20010,
            Bbx = 20011,
            Pfb = 20012,
            Upe = 20013,
            Usc = 20014,
            Ult = 20015,
            Fx = 20016,
            Max = 20017,
            Doc = 20018,
            Scc = 20019,
            Wmp = 20020,
            Osc = 20021,
            Trn = 20022,
            Uen = 20023,
            Ros = 20024,
            Rst = 20025,
            Ptx = 20026,
            Ltx = 20027,
            Trx = 20028,
            Nds = 21000,
            Herf = 21001,
            Dict = 21002,
            Small = 21003,
            Cbgt = 21004,
            Cdpth = 21005,
            Emit = 21006,
            Itm = 21007,
            Nanr = 21008,
            Nbfp = 21009,
            Nbfs = 21010,
            Ncer = 21011,
            Ncgr = 21012,
            Nclr = 21013,
            Nftr = 21014,
            Nsbca = 21015,
            Nsbmd = 21016,
            Nsbta = 21017,
            Nsbtp = 21018,
            Nsbtx = 21019,
            Pal = 21020,
            Raw = 21021,
            Sadl = 21022,
            Sdat = 21023,
            Smp = 21024,
            Spl = 21025,
            Vx = 21026,
            Anb = 22000,
            Ani = 22001,
            Cns = 22002,
            Cur = 22003,
            Evt = 22004,
            Fdl = 22005,
            Fxo = 22006,
            Gad = 22007,
            Gda = 22008,
            Gfx = 22009,
            Ldf = 22010,
            Lst = 22011,
            Mal = 22012,
            Mao = 22013,
            Mmh = 22014,
            Mop = 22015,
            Mor = 22016,
            Msh = 22017,
            Mtx = 22018,
            Ncc = 22019,
            Phy = 22020,
            Plo = 22021,
            Stg = 22022,
            Tbi = 22023,
            Tnt = 22024,
            Arl = 22025,
            Fev = 22026,
            Fsb = 22027,
            Opf = 22028,
            Crf = 22029,
            Rimp = 22030,
            Met = 22031,
            Meta = 22032,
            Fxr = 22033,
            Cif = 22034,
            Cub = 22035,
            Dlb = 22036,
            Nsc = 22037,
            Mov = 23000,
            Curs = 23001,
            Pict = 23002,
            Rsrc = 23003,
            Plist = 23004,
            Cre = 24000,
            Pso = 24001,
            Vso = 24002,
            Abc = 24003,
            Sbm = 24004,
            Pvd = 24005,
            Pla = 24006,
            Trg = 24007,
            Pk = 24008,
            Als = 25000,
            Apl = 25001,
            Assembly = 25002,
            Bak = 25003,
            Bnk = 25004,
            Cl = 25005,
            Cnv = 25006,
            Con = 25007,
            Dat = 25008,
            Dx11 = 25009,
            Ids = 25010,
            Log = 25011,
            Map = 25012,
            Mml = 25013,
            Mp3 = 25014,
            Pck = 25015,
            Rml = 25016,
            S = 25017,
            Sta = 25018,
            Svr = 25019,
            Vlm = 25020,
            Wbd = 25021,
            Xbx = 25022,
            Xls = 25023,
            Bzf = 26000,
            Adv = 27000,
            Json = 28000,
            TlkExpert = 28001,
            TlkMobile = 28002,
            TlkTouch = 28003,
            Otf = 28004,
            Par = 28005,
            Xwb = 29000,
            Xsb = 29001,
            Xds = 30000,
            Wnd = 30001,
            Xeositex = 40000,
        }
        public Key(KaitaiStream p__io, KaitaiStruct p__parent = null, Key p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_fileTable = false;
            f_keyTable = false;
            _read();
        }
        private void _read()
        {
            _fileType = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
            if (!(_fileType == "KEY "))
            {
                throw new ValidationNotEqualError("KEY ", _fileType, m_io, "/seq/0");
            }
            _fileVersion = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
            if (!( ((_fileVersion == "V1  ") || (_fileVersion == "V1.1")) ))
            {
                throw new ValidationNotAnyOfError(_fileVersion, m_io, "/seq/1");
            }
            _bifCount = m_io.ReadU4le();
            _keyCount = m_io.ReadU4le();
            _fileTableOffset = m_io.ReadU4le();
            _keyTableOffset = m_io.ReadU4le();
            _buildYear = m_io.ReadU4le();
            _buildDay = m_io.ReadU4le();
            _reserved = m_io.ReadBytes(32);
        }
        public partial class FileEntry : KaitaiStruct
        {
            public static FileEntry FromFile(string fileName)
            {
                return new FileEntry(new KaitaiStream(fileName));
            }

            public FileEntry(KaitaiStream p__io, Key.FileTable p__parent = null, Key p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_filename = false;
                _read();
            }
            private void _read()
            {
                _fileSize = m_io.ReadU4le();
                _filenameOffset = m_io.ReadU4le();
                _filenameSize = m_io.ReadU2le();
                _drives = m_io.ReadU2le();
            }
            private bool f_filename;
            private string _filename;

            /// <summary>
            /// BIF filename (read from filename table at specified offset).
            /// </summary>
            public string Filename
            {
                get
                {
                    if (f_filename)
                        return _filename;
                    f_filename = true;
                    long _pos = m_io.Pos;
                    m_io.Seek((M_Root.FileTableOffset + M_Root.BifCount * 12) + FilenameOffset);
                    _filename = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(FilenameSize));
                    m_io.Seek(_pos);
                    return _filename;
                }
            }
            private uint _fileSize;
            private uint _filenameOffset;
            private ushort _filenameSize;
            private ushort _drives;
            private Key m_root;
            private Key.FileTable m_parent;

            /// <summary>
            /// Size of the BIF file on disk in bytes.
            /// </summary>
            public uint FileSize { get { return _fileSize; } }

            /// <summary>
            /// Byte offset into the filename table where this BIF's filename is stored.
            /// </summary>
            public uint FilenameOffset { get { return _filenameOffset; } }

            /// <summary>
            /// Length of the filename in bytes (including null terminator).
            /// </summary>
            public ushort FilenameSize { get { return _filenameSize; } }

            /// <summary>
            /// Drive flags indicating which media contains the BIF file.
            /// Bit flags: 0x0001=HD0, 0x0002=CD1, 0x0004=CD2, 0x0008=CD3, 0x0010=CD4.
            /// Modern distributions typically use 0x0001 (HD) for all files.
            /// </summary>
            public ushort Drives { get { return _drives; } }
            public Key M_Root { get { return m_root; } }
            public Key.FileTable M_Parent { get { return m_parent; } }
        }
        public partial class FileTable : KaitaiStruct
        {
            public static FileTable FromFile(string fileName)
            {
                return new FileTable(new KaitaiStream(fileName));
            }

            public FileTable(KaitaiStream p__io, Key p__parent = null, Key p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<FileEntry>();
                for (var i = 0; i < M_Root.BifCount; i++)
                {
                    _entries.Add(new FileEntry(m_io, this, m_root));
                }
            }
            private List<FileEntry> _entries;
            private Key m_root;
            private Key m_parent;

            /// <summary>
            /// Array of BIF file entries.
            /// </summary>
            public List<FileEntry> Entries { get { return _entries; } }
            public Key M_Root { get { return m_root; } }
            public Key M_Parent { get { return m_parent; } }
        }
        public partial class FilenameTable : KaitaiStruct
        {
            public static FilenameTable FromFile(string fileName)
            {
                return new FilenameTable(new KaitaiStream(fileName));
            }

            public FilenameTable(KaitaiStream p__io, KaitaiStruct p__parent = null, Key p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _filenames = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesFull());
            }
            private string _filenames;
            private Key m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Null-terminated BIF filenames concatenated together.
            /// Each filename is read using the filename_offset and filename_size
            /// from the corresponding file_entry.
            /// </summary>
            public string Filenames { get { return _filenames; } }
            public Key M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class KeyEntry : KaitaiStruct
        {
            public static KeyEntry FromFile(string fileName)
            {
                return new KeyEntry(new KaitaiStream(fileName));
            }

            public KeyEntry(KaitaiStream p__io, Key.KeyTable p__parent = null, Key p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _resref = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(16));
                _resourceType = ((Key.XoreosFileTypeId) m_io.ReadU2le());
                _resourceId = m_io.ReadU4le();
            }
            private string _resref;
            private XoreosFileTypeId _resourceType;
            private uint _resourceId;
            private Key m_root;
            private Key.KeyTable m_parent;

            /// <summary>
            /// Resource filename (ResRef) without extension.
            /// Null-padded, maximum 16 characters.
            /// The game uses this name to access the resource.
            /// </summary>
            public string Resref { get { return _resref; } }

            /// <summary>
            /// Resource type identifier (see ResourceType enum).
            /// </summary>
            public XoreosFileTypeId ResourceType { get { return _resourceType; } }

            /// <summary>
            /// Encoded resource location.
            /// Bits 31-20: BIF index (top 12 bits) - index into file table
            /// Bits 19-0: Resource index (bottom 20 bits) - index within the BIF file
            /// 
            /// Formula: resource_id = (bif_index &lt;&lt; 20) | resource_index
            /// 
            /// Decoding:
            /// - bif_index = (resource_id &gt;&gt; 20) &amp; 0xFFF
            /// - resource_index = resource_id &amp; 0xFFFFF
            /// </summary>
            public uint ResourceId { get { return _resourceId; } }
            public Key M_Root { get { return m_root; } }
            public Key.KeyTable M_Parent { get { return m_parent; } }
        }
        public partial class KeyTable : KaitaiStruct
        {
            public static KeyTable FromFile(string fileName)
            {
                return new KeyTable(new KaitaiStream(fileName));
            }

            public KeyTable(KaitaiStream p__io, Key p__parent = null, Key p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<KeyEntry>();
                for (var i = 0; i < M_Root.KeyCount; i++)
                {
                    _entries.Add(new KeyEntry(m_io, this, m_root));
                }
            }
            private List<KeyEntry> _entries;
            private Key m_root;
            private Key m_parent;

            /// <summary>
            /// Array of resource entries.
            /// </summary>
            public List<KeyEntry> Entries { get { return _entries; } }
            public Key M_Root { get { return m_root; } }
            public Key M_Parent { get { return m_parent; } }
        }
        private bool f_fileTable;
        private FileTable _fileTable;

        /// <summary>
        /// File table containing BIF file entries.
        /// </summary>
        public FileTable FileTable
        {
            get
            {
                if (f_fileTable)
                    return _fileTable;
                f_fileTable = true;
                if (BifCount > 0) {
                    long _pos = m_io.Pos;
                    m_io.Seek(FileTableOffset);
                    _fileTable = new FileTable(m_io, this, m_root);
                    m_io.Seek(_pos);
                }
                return _fileTable;
            }
        }
        private bool f_keyTable;
        private KeyTable _keyTable;

        /// <summary>
        /// KEY table containing resource entries.
        /// </summary>
        public KeyTable KeyTable
        {
            get
            {
                if (f_keyTable)
                    return _keyTable;
                f_keyTable = true;
                if (KeyCount > 0) {
                    long _pos = m_io.Pos;
                    m_io.Seek(KeyTableOffset);
                    _keyTable = new KeyTable(m_io, this, m_root);
                    m_io.Seek(_pos);
                }
                return _keyTable;
            }
        }
        private string _fileType;
        private string _fileVersion;
        private uint _bifCount;
        private uint _keyCount;
        private uint _fileTableOffset;
        private uint _keyTableOffset;
        private uint _buildYear;
        private uint _buildDay;
        private byte[] _reserved;
        private Key m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// File type signature. Must be &quot;KEY &quot; (space-padded).
        /// </summary>
        public string FileType { get { return _fileType; } }

        /// <summary>
        /// File format version. Typically &quot;V1  &quot; or &quot;V1.1&quot;.
        /// </summary>
        public string FileVersion { get { return _fileVersion; } }

        /// <summary>
        /// Number of BIF files referenced by this KEY file.
        /// </summary>
        public uint BifCount { get { return _bifCount; } }

        /// <summary>
        /// Number of resource entries in the KEY table.
        /// </summary>
        public uint KeyCount { get { return _keyCount; } }

        /// <summary>
        /// Byte offset to the file table from the beginning of the file.
        /// </summary>
        public uint FileTableOffset { get { return _fileTableOffset; } }

        /// <summary>
        /// Byte offset to the KEY table from the beginning of the file.
        /// </summary>
        public uint KeyTableOffset { get { return _keyTableOffset; } }

        /// <summary>
        /// Build year (years since 1900).
        /// </summary>
        public uint BuildYear { get { return _buildYear; } }

        /// <summary>
        /// Build day (days since January 1).
        /// </summary>
        public uint BuildDay { get { return _buildDay; } }

        /// <summary>
        /// Reserved padding (usually zeros).
        /// </summary>
        public byte[] Reserved { get { return _reserved; } }
        public Key M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
