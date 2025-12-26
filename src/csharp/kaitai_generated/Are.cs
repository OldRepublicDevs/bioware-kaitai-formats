// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// ARE (Area) files are GFF-based format files that store static area information including
    /// lighting, fog, grass, weather, script hooks, and map data. ARE files use the GFF (Generic File Format)
    /// binary structure with file type signature &quot;ARE &quot;.
    /// 
    /// This format inherits the complete GFF structure from gff.ksy and adds ARE-specific
    /// validation and documentation.
    /// 
    /// ARE Root Struct Fields (Common):
    /// - &quot;Tag&quot; (String): Unique area identifier
    /// - &quot;Name&quot; (LocalizedString): Area display name
    /// - &quot;SunAmbientColor&quot;, &quot;SunDiffuseColor&quot; (UInt32): Lighting colors (BGR format)
    /// - &quot;SunFogOn&quot;, &quot;SunFogNear&quot;, &quot;SunFogFar&quot;, &quot;SunFogColor&quot;: Fog settings
    /// - &quot;Grass_*&quot;: Grass rendering properties
    /// - &quot;OnEnter&quot;, &quot;OnExit&quot;, &quot;OnHeartbeat&quot;, &quot;OnUserDefined&quot;: Script hooks (ResRef)
    /// - &quot;Map&quot; (Struct): Minimap coordinate mapping
    /// - &quot;Rooms&quot; (List): Audio zones and weather regions
    /// 
    /// KotOR 2 adds weather fields:
    /// - &quot;ChanceRain&quot;, &quot;ChanceSnow&quot;, &quot;ChanceLightning&quot; (Int32)
    /// - &quot;Dirty*&quot; fields for dust particle effects
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-ARE.md
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    /// - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/are.py
    /// - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/are.cpp
    /// </summary>
    public partial class Are : KaitaiStruct
    {
        public static Are FromFile(string fileName)
        {
            return new Are(new KaitaiStream(fileName));
        }

        public Are(KaitaiStream p__io, KaitaiStruct p__parent = null, Are p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_fileTypeValid = false;
            f_versionValid = false;
            _read();
        }
        private void _read()
        {
            _gffData = new Gff.Gff(m_io);
        }
        private bool f_fileTypeValid;
        private bool _fileTypeValid;

        /// <summary>
        /// Validates that this is an ARE file (file type must be &quot;ARE &quot;)
        /// </summary>
        public bool FileTypeValid
        {
            get
            {
                if (f_fileTypeValid)
                    return _fileTypeValid;
                f_fileTypeValid = true;
                _fileTypeValid = (bool) (GffData.Header.FileType == "ARE ");
                return _fileTypeValid;
            }
        }
        private bool f_versionValid;
        private bool _versionValid;

        /// <summary>
        /// Validates GFF version is supported
        /// </summary>
        public bool VersionValid
        {
            get
            {
                if (f_versionValid)
                    return _versionValid;
                f_versionValid = true;
                _versionValid = (bool) ( ((GffData.Header.FileVersion == "V3.2") || (GffData.Header.FileVersion == "V3.3") || (GffData.Header.FileVersion == "V4.0") || (GffData.Header.FileVersion == "V4.1")) );
                return _versionValid;
            }
        }
        private Gff.Gff _gffData;
        private Are m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Complete GFF structure. ARE files use standard GFF format with &quot;ARE &quot; file type.
        /// Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
        /// </summary>
        public Gff.Gff GffData { get { return _gffData; } }
        public Are M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
