// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// SSF (Sound Set File) files store sound string references (StrRefs) for character voice sets.
    /// Each SSF file contains exactly 28 sound slots, mapping to different game events and actions.
    /// 
    /// Binary Format:
    /// - Header (12 bytes): File type signature, version, and offset to sounds array
    /// - Sounds Array (112 bytes): 28 uint32 values representing StrRefs (0xFFFFFFFF = -1 = no sound)
    /// - Padding (12 bytes): 3 uint32 values of 0xFFFFFFFF (reserved/unused)
    /// 
    /// Total file size: 136 bytes (12 + 112 + 12)
    /// 
    /// Sound Slots (in order):
    /// 0-5: Battle Cry 1-6
    /// 6-8: Select 1-3
    /// 9-11: Attack Grunt 1-3
    /// 12-13: Pain Grunt 1-2
    /// 14: Low Health
    /// 15: Dead
    /// 16: Critical Hit
    /// 17: Target Immune
    /// 18: Lay Mine
    /// 19: Disarm Mine
    /// 20: Begin Stealth
    /// 21: Begin Search
    /// 22: Begin Unlock
    /// 23: Unlock Failed
    /// 24: Unlock Success
    /// 25: Separated From Party
    /// 26: Rejoined Party
    /// 27: Poisoned
    /// 
    /// References:
    /// - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf_binary_reader.py
    /// - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf_binary_writer.py
    /// </summary>
    public partial class Ssf : KaitaiStruct
    {
        public static Ssf FromFile(string fileName)
        {
            return new Ssf(new KaitaiStream(fileName));
        }

        public Ssf(KaitaiStream p__io, KaitaiStruct p__parent = null, Ssf p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_sounds = false;
            _read();
        }
        private void _read()
        {
            _fileType = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
            if (!(_fileType == "SSF "))
            {
                throw new ValidationNotEqualError("SSF ", _fileType, m_io, "/seq/0");
            }
            _fileVersion = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
            if (!(_fileVersion == "V1.1"))
            {
                throw new ValidationNotEqualError("V1.1", _fileVersion, m_io, "/seq/1");
            }
            _soundsOffset = m_io.ReadU4le();
            if (!(_soundsOffset == 12))
            {
                throw new ValidationNotEqualError(12, _soundsOffset, m_io, "/seq/2");
            }
            _padding = new Padding(m_io, this, m_root);
        }
        public partial class Padding : KaitaiStruct
        {
            public static Padding FromFile(string fileName)
            {
                return new Padding(new KaitaiStream(fileName));
            }

            public Padding(KaitaiStream p__io, Ssf p__parent = null, Ssf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _paddingBytes = new List<uint>();
                for (var i = 0; i < 3; i++)
                {
                    _paddingBytes.Add(m_io.ReadU4le());
                }
            }
            private List<uint> _paddingBytes;
            private Ssf m_root;
            private Ssf m_parent;

            /// <summary>
            /// Reserved padding bytes. Always 3 uint32 values of 0xFFFFFFFF.
            /// Total size: 12 bytes (3 * 4 bytes).
            /// These bytes are unused but must be present for format compatibility.
            /// Each padding byte should be 0xFFFFFFFF (4294967295).
            /// </summary>
            public List<uint> PaddingBytes { get { return _paddingBytes; } }
            public Ssf M_Root { get { return m_root; } }
            public Ssf M_Parent { get { return m_parent; } }
        }
        public partial class SoundArray : KaitaiStruct
        {
            public static SoundArray FromFile(string fileName)
            {
                return new SoundArray(new KaitaiStream(fileName));
            }

            public SoundArray(KaitaiStream p__io, Ssf p__parent = null, Ssf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<SoundEntry>();
                for (var i = 0; i < 28; i++)
                {
                    _entries.Add(new SoundEntry(m_io, this, m_root));
                }
            }
            private List<SoundEntry> _entries;
            private Ssf m_root;
            private Ssf m_parent;

            /// <summary>
            /// Array of exactly 28 sound entries, one for each SSFSound enum value.
            /// Each entry is a uint32 representing a StrRef (string reference).
            /// Value 0xFFFFFFFF (4294967295) represents -1 (no sound assigned).
            /// 
            /// Entry indices map to SSFSound enum:
            /// - 0-5: Battle Cry 1-6
            /// - 6-8: Select 1-3
            /// - 9-11: Attack Grunt 1-3
            /// - 12-13: Pain Grunt 1-2
            /// - 14: Low Health
            /// - 15: Dead
            /// - 16: Critical Hit
            /// - 17: Target Immune
            /// - 18: Lay Mine
            /// - 19: Disarm Mine
            /// - 20: Begin Stealth
            /// - 21: Begin Search
            /// - 22: Begin Unlock
            /// - 23: Unlock Failed
            /// - 24: Unlock Success
            /// - 25: Separated From Party
            /// - 26: Rejoined Party
            /// - 27: Poisoned
            /// </summary>
            public List<SoundEntry> Entries { get { return _entries; } }
            public Ssf M_Root { get { return m_root; } }
            public Ssf M_Parent { get { return m_parent; } }
        }
        public partial class SoundEntry : KaitaiStruct
        {
            public static SoundEntry FromFile(string fileName)
            {
                return new SoundEntry(new KaitaiStream(fileName));
            }

            public SoundEntry(KaitaiStream p__io, Ssf.SoundArray p__parent = null, Ssf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isNoSound = false;
                _read();
            }
            private void _read()
            {
                _strrefRaw = m_io.ReadU4le();
            }
            private bool f_isNoSound;
            private bool _isNoSound;

            /// <summary>
            /// True if this entry represents &quot;no sound&quot; (0xFFFFFFFF).
            /// False if this entry contains a valid StrRef value.
            /// </summary>
            public bool IsNoSound
            {
                get
                {
                    if (f_isNoSound)
                        return _isNoSound;
                    f_isNoSound = true;
                    _isNoSound = (bool) (StrrefRaw == 4294967295);
                    return _isNoSound;
                }
            }
            private uint _strrefRaw;
            private Ssf m_root;
            private Ssf.SoundArray m_parent;

            /// <summary>
            /// Raw uint32 value representing the StrRef.
            /// Value 0xFFFFFFFF (4294967295) represents -1 (no sound assigned).
            /// All other values are valid StrRefs (typically 0-999999).
            /// The conversion from 0xFFFFFFFF to -1 is handled by SSFBinaryReader.ReadInt32MaxNeg1().
            /// </summary>
            public uint StrrefRaw { get { return _strrefRaw; } }
            public Ssf M_Root { get { return m_root; } }
            public Ssf.SoundArray M_Parent { get { return m_parent; } }
        }
        private bool f_sounds;
        private SoundArray _sounds;

        /// <summary>
        /// Array of 28 sound string references (StrRefs)
        /// </summary>
        public SoundArray Sounds
        {
            get
            {
                if (f_sounds)
                    return _sounds;
                f_sounds = true;
                long _pos = m_io.Pos;
                m_io.Seek(SoundsOffset);
                _sounds = new SoundArray(m_io, this, m_root);
                m_io.Seek(_pos);
                return _sounds;
            }
        }
        private string _fileType;
        private string _fileVersion;
        private uint _soundsOffset;
        private Padding _padding;
        private Ssf m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// File type signature. Must be &quot;SSF &quot; (space-padded).
        /// Bytes: 0x53 0x53 0x46 0x20
        /// </summary>
        public string FileType { get { return _fileType; } }

        /// <summary>
        /// File format version. Always &quot;V1.1&quot; for KotOR SSF files.
        /// Bytes: 0x56 0x31 0x2E 0x31
        /// </summary>
        public string FileVersion { get { return _fileVersion; } }

        /// <summary>
        /// Byte offset to the sounds array from the beginning of the file.
        /// Always 12 (0x0C) in valid SSF files, as the sounds array immediately follows the header.
        /// This field exists for format consistency, though it's always the same value.
        /// </summary>
        public uint SoundsOffset { get { return _soundsOffset; } }

        /// <summary>
        /// Reserved padding bytes (12 bytes of 0xFFFFFFFF)
        /// </summary>
        public Padding Padding { get { return _padding; } }
        public Ssf M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
