// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// GIT (Game Instance Template) files store dynamic area instance data including
    /// placed creatures, placeables, doors, triggers, waypoints, sounds, stores, and encounters.
    /// 
    /// This format inherits the complete GFF structure from gff.ksy.
    /// 
    /// GIT Root Struct Fields:
    /// - CreatureList (List): Placed creatures with positions, orientations
    /// - DoorList (List): Placed doors with states, scripts
    /// - PlaceableList (List): Placed placeables (chests, etc.)
    /// - TriggerList (List): Trigger zones
    /// - WaypointList (List): Navigation waypoints
    /// - SoundList (List): Ambient sounds
    /// - StoreList (List): Merchant shops
    /// - EncounterList (List): Spawn encounters
    /// - CameraList (List): Camera points
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GIT.md
    /// </summary>
    public partial class Git : KaitaiStruct
    {
        public static Git FromFile(string fileName)
        {
            return new Git(new KaitaiStream(fileName));
        }

        public Git(KaitaiStream p__io, KaitaiStruct p__parent = null, Git p__root = null) : base(p__io)
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
        public bool FileTypeValid
        {
            get
            {
                if (f_fileTypeValid)
                    return _fileTypeValid;
                f_fileTypeValid = true;
                _fileTypeValid = (bool) (GffData.Header.FileType == "GIT ");
                return _fileTypeValid;
            }
        }
        private bool f_versionValid;
        private bool _versionValid;
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
        private Git m_root;
        private KaitaiStruct m_parent;
        public Gff.Gff GffData { get { return _gffData; } }
        public Git M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
