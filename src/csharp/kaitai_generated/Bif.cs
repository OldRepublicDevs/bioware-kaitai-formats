// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// BIF (BioWare Index File) files are archive containers that store game resources.
    /// They work in tandem with KEY files which provide the filename-to-resource mappings.
    /// 
    /// BIF files contain only resource IDs, types, and data - the actual filenames (ResRefs)
    /// are stored in the KEY file and matched via the resource ID.
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/BIF-File-Format.md
    /// - https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/bif.html
    /// - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/bifreader.cpp
    /// </summary>
    public partial class Bif : KaitaiStruct
    {
        public static Bif FromFile(string fileName)
        {
            return new Bif(new KaitaiStream(fileName));
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
        public Bif(KaitaiStream p__io, KaitaiStruct p__parent = null, Bif p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_varResourceTable = false;
            _read();
        }
        private void _read()
        {
            _fileType = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
            if (!(_fileType == "BIFF"))
            {
                throw new ValidationNotEqualError("BIFF", _fileType, m_io, "/seq/0");
            }
            _version = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
            if (!( ((_version == "V1  ") || (_version == "V1.1")) ))
            {
                throw new ValidationNotAnyOfError(_version, m_io, "/seq/1");
            }
            _varResCount = m_io.ReadU4le();
            _fixedResCount = m_io.ReadU4le();
            if (!(_fixedResCount == 0))
            {
                throw new ValidationNotEqualError(0, _fixedResCount, m_io, "/seq/3");
            }
            _varTableOffset = m_io.ReadU4le();
        }
        public partial class VarResourceEntry : KaitaiStruct
        {
            public static VarResourceEntry FromFile(string fileName)
            {
                return new VarResourceEntry(new KaitaiStream(fileName));
            }

            public VarResourceEntry(KaitaiStream p__io, Bif.VarResourceTable p__parent = null, Bif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_data = false;
                _read();
            }
            private void _read()
            {
                _resourceId = m_io.ReadU4le();
                _offset = m_io.ReadU4le();
                _fileSize = m_io.ReadU4le();
                _resourceType = ((Bif.XoreosFileTypeId) m_io.ReadU4le());
            }
            private bool f_data;
            private byte[] _data;

            /// <summary>
            /// Raw binary data for the resource (read at specified offset).
            /// </summary>
            public byte[] Data
            {
                get
                {
                    if (f_data)
                        return _data;
                    f_data = true;
                    long _pos = m_io.Pos;
                    m_io.Seek(Offset);
                    _data = m_io.ReadBytes(FileSize);
                    m_io.Seek(_pos);
                    return _data;
                }
            }
            private uint _resourceId;
            private uint _offset;
            private uint _fileSize;
            private XoreosFileTypeId _resourceType;
            private Bif m_root;
            private Bif.VarResourceTable m_parent;

            /// <summary>
            /// Resource ID (matches KEY file entry).
            /// Encodes BIF index (bits 31-20) and resource index (bits 19-0).
            /// Formula: resource_id = (bif_index &lt;&lt; 20) | resource_index
            /// </summary>
            public uint ResourceId { get { return _resourceId; } }

            /// <summary>
            /// Byte offset to resource data in file (absolute file offset).
            /// </summary>
            public uint Offset { get { return _offset; } }

            /// <summary>
            /// Uncompressed size of resource data in bytes.
            /// </summary>
            public uint FileSize { get { return _fileSize; } }

            /// <summary>
            /// Resource type identifier (see ResourceType enum).
            /// </summary>
            public XoreosFileTypeId ResourceType { get { return _resourceType; } }
            public Bif M_Root { get { return m_root; } }
            public Bif.VarResourceTable M_Parent { get { return m_parent; } }
        }
        public partial class VarResourceTable : KaitaiStruct
        {
            public static VarResourceTable FromFile(string fileName)
            {
                return new VarResourceTable(new KaitaiStream(fileName));
            }

            public VarResourceTable(KaitaiStream p__io, Bif p__parent = null, Bif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<VarResourceEntry>();
                for (var i = 0; i < M_Root.VarResCount; i++)
                {
                    _entries.Add(new VarResourceEntry(m_io, this, m_root));
                }
            }
            private List<VarResourceEntry> _entries;
            private Bif m_root;
            private Bif m_parent;

            /// <summary>
            /// Array of variable resource entries.
            /// </summary>
            public List<VarResourceEntry> Entries { get { return _entries; } }
            public Bif M_Root { get { return m_root; } }
            public Bif M_Parent { get { return m_parent; } }
        }
        private bool f_varResourceTable;
        private VarResourceTable _varResourceTable;

        /// <summary>
        /// Variable resource table containing entries for each resource.
        /// </summary>
        public VarResourceTable VarResourceTable
        {
            get
            {
                if (f_varResourceTable)
                    return _varResourceTable;
                f_varResourceTable = true;
                if (VarResCount > 0) {
                    long _pos = m_io.Pos;
                    m_io.Seek(VarTableOffset);
                    _varResourceTable = new VarResourceTable(m_io, this, m_root);
                    m_io.Seek(_pos);
                }
                return _varResourceTable;
            }
        }
        private string _fileType;
        private string _version;
        private uint _varResCount;
        private uint _fixedResCount;
        private uint _varTableOffset;
        private Bif m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// File type signature. Must be &quot;BIFF&quot; for BIF files.
        /// </summary>
        public string FileType { get { return _fileType; } }

        /// <summary>
        /// File format version. Typically &quot;V1  &quot; or &quot;V1.1&quot;.
        /// </summary>
        public string Version { get { return _version; } }

        /// <summary>
        /// Number of variable-size resources in this file.
        /// </summary>
        public uint VarResCount { get { return _varResCount; } }

        /// <summary>
        /// Number of fixed-size resources (always 0 in KotOR, legacy from NWN).
        /// </summary>
        public uint FixedResCount { get { return _fixedResCount; } }

        /// <summary>
        /// Byte offset to the variable resource table from the beginning of the file.
        /// </summary>
        public uint VarTableOffset { get { return _varTableOffset; } }
        public Bif M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
