// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// RIM (Resource Information Manager) files are self-contained archives used for module templates.
    /// RIM files are similar to ERF files but are read-only from the game's perspective. The game
    /// loads RIM files as templates for modules and exports them to ERF format for runtime mutation.
    /// RIM files store all resources inline with metadata, making them self-contained archives.
    /// 
    /// Format Variants:
    /// - Standard RIM: Basic module template files
    /// - Extension RIM: Files ending in 'x' (e.g., module001x.rim) that extend other RIMs
    /// 
    /// Binary Format:
    /// - Header (20 bytes): File type, version, resource count, offset to resource table
    /// - Extended Header (100 bytes): Reserved padding (total header = 120 bytes)
    /// - Resource Entry Table (32 bytes per entry): ResRef, type, ID, offset, size
    /// - Resource Data (variable size): Raw binary data for each resource
    /// 
    /// References:
    /// - vendor/PyKotor/wiki/RIM-File-Format.md
    /// - vendor/reone/src/libs/resource/format/rimreader.cpp:24-100
    /// - vendor/xoreos/src/aurora/rimfile.cpp:40-160
    /// - vendor/Kotor.NET/Kotor.NET/Formats/KotorRIM/RIMBinaryStructure.cs:11-121
    /// - vendor/KotOR_IO/KotOR_IO/File Formats/RIM.cs:20-260
    /// </summary>
    public partial class Rim : KaitaiStruct
    {
        public static Rim FromFile(string fileName)
        {
            return new Rim(new KaitaiStream(fileName));
        }

        public Rim(KaitaiStream p__io, KaitaiStruct p__parent = null, Rim p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new RimHeader(m_io, this, m_root);
            _extendedHeader = new RimExtendedHeader(m_io, this, m_root);
            if (Header.ResourceCount > 0) {
                _resourceEntryTable = new ResourceEntryTable(m_io, this, m_root);
            }
        }
        public partial class ResourceEntry : KaitaiStruct
        {
            public static ResourceEntry FromFile(string fileName)
            {
                return new ResourceEntry(new KaitaiStream(fileName));
            }

            public ResourceEntry(KaitaiStream p__io, Rim.ResourceEntryTable p__parent = null, Rim p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_data = false;
                _read();
            }
            private void _read()
            {
                _resref = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(16));
                _resourceType = m_io.ReadU4le();
                _resourceId = m_io.ReadU4le();
                _offsetToData = m_io.ReadU4le();
                _resourceSize = m_io.ReadU4le();
            }
            private bool f_data;
            private string _data;

            /// <summary>
            /// Raw binary data for this resource (read at specified offset)
            /// </summary>
            public string Data
            {
                get
                {
                    if (f_data)
                        return _data;
                    f_data = true;
                    long _pos = m_io.Pos;
                    m_io.Seek(OffsetToData);
                    _data = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(ResourceSize));
                    m_io.Seek(_pos);
                    return _data;
                }
            }
            private string _resref;
            private uint _resourceType;
            private uint _resourceId;
            private uint _offsetToData;
            private uint _resourceSize;
            private Rim m_root;
            private Rim.ResourceEntryTable m_parent;

            /// <summary>
            /// Resource filename (ResRef), null-padded to 16 bytes.
            /// Maximum 16 characters. If exactly 16 characters, no null terminator exists.
            /// Resource names can be mixed case, though most are lowercase in practice.
            /// The game engine typically lowercases ResRefs when loading.
            /// </summary>
            public string Resref { get { return _resref; } }

            /// <summary>
            /// Resource type identifier (see ResourceType enum).
            /// Examples: 0x000B (TPC/texture), 0x000A (MOD/module), 0x0000 (RES/unknown)
            /// </summary>
            public uint ResourceType { get { return _resourceType; } }

            /// <summary>
            /// Resource ID (index, usually sequential).
            /// Typically matches the index of this entry in the resource_entry_table.
            /// Used for internal reference, but not critical for parsing.
            /// </summary>
            public uint ResourceId { get { return _resourceId; } }

            /// <summary>
            /// Byte offset to resource data from the beginning of the file.
            /// Points to the actual binary data for this resource in resource_data_section.
            /// </summary>
            public uint OffsetToData { get { return _offsetToData; } }

            /// <summary>
            /// Size of resource data in bytes.
            /// Uncompressed size of the resource.
            /// </summary>
            public uint ResourceSize { get { return _resourceSize; } }
            public Rim M_Root { get { return m_root; } }
            public Rim.ResourceEntryTable M_Parent { get { return m_parent; } }
        }
        public partial class ResourceEntryTable : KaitaiStruct
        {
            public static ResourceEntryTable FromFile(string fileName)
            {
                return new ResourceEntryTable(new KaitaiStream(fileName));
            }

            public ResourceEntryTable(KaitaiStream p__io, Rim p__parent = null, Rim p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<ResourceEntry>();
                for (var i = 0; i < M_Root.Header.ResourceCount; i++)
                {
                    _entries.Add(new ResourceEntry(m_io, this, m_root));
                }
            }
            private List<ResourceEntry> _entries;
            private Rim m_root;
            private Rim m_parent;

            /// <summary>
            /// Array of resource entries, one per resource in the archive
            /// </summary>
            public List<ResourceEntry> Entries { get { return _entries; } }
            public Rim M_Root { get { return m_root; } }
            public Rim M_Parent { get { return m_parent; } }
        }
        public partial class RimExtendedHeader : KaitaiStruct
        {
            public static RimExtendedHeader FromFile(string fileName)
            {
                return new RimExtendedHeader(new KaitaiStream(fileName));
            }

            public RimExtendedHeader(KaitaiStream p__io, Rim p__parent = null, Rim p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _reservedPadding = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(100));
            }
            private string _reservedPadding;
            private Rim m_root;
            private Rim m_parent;

            /// <summary>
            /// Reserved padding bytes (typically all zeros).
            /// Total header size is 120 bytes:
            /// header (20) + extended_header (100) = 120 bytes
            /// 
            /// In extension RIMs (files ending in 'x'), byte 0x14 (offset 20 in extended header)
            /// may contain an IsExtension flag, but this is not consistently used.
            /// </summary>
            public string ReservedPadding { get { return _reservedPadding; } }
            public Rim M_Root { get { return m_root; } }
            public Rim M_Parent { get { return m_parent; } }
        }
        public partial class RimHeader : KaitaiStruct
        {
            public static RimHeader FromFile(string fileName)
            {
                return new RimHeader(new KaitaiStream(fileName));
            }

            public RimHeader(KaitaiStream p__io, Rim p__parent = null, Rim p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_hasResources = false;
                _read();
            }
            private void _read()
            {
                _fileType = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _fileVersion = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _reserved = m_io.ReadU4le();
                _resourceCount = m_io.ReadU4le();
                _offsetToResourceTable = m_io.ReadU4le();
            }
            private bool f_hasResources;
            private bool _hasResources;

            /// <summary>
            /// Whether the RIM file contains any resources
            /// </summary>
            public bool HasResources
            {
                get
                {
                    if (f_hasResources)
                        return _hasResources;
                    f_hasResources = true;
                    _hasResources = (bool) (ResourceCount > 0);
                    return _hasResources;
                }
            }
            private string _fileType;
            private string _fileVersion;
            private uint _reserved;
            private uint _resourceCount;
            private uint _offsetToResourceTable;
            private Rim m_root;
            private Rim m_parent;

            /// <summary>
            /// File type signature. Must be &quot;RIM &quot; (0x52 0x49 0x4D 0x20).
            /// This identifies the file as a RIM archive.
            /// </summary>
            public string FileType { get { return _fileType; } }

            /// <summary>
            /// File format version. Always &quot;V1.0&quot; for KotOR RIM files.
            /// Other versions may exist in Neverwinter Nights but are not supported in KotOR.
            /// </summary>
            public string FileVersion { get { return _fileVersion; } }

            /// <summary>
            /// Reserved field (typically 0x00000000).
            /// Unknown purpose, but always set to 0 in practice.
            /// </summary>
            public uint Reserved { get { return _reserved; } }

            /// <summary>
            /// Number of resources in the archive. This determines:
            /// - Number of entries in resource_entry_table
            /// - Number of resources in resource_data_section
            /// </summary>
            public uint ResourceCount { get { return _resourceCount; } }

            /// <summary>
            /// Byte offset to the resource entry table from the beginning of the file.
            /// Typically 120 (right after header + extended header) if resources are present.
            /// Points to the start of the resource_entry_table.
            /// </summary>
            public uint OffsetToResourceTable { get { return _offsetToResourceTable; } }
            public Rim M_Root { get { return m_root; } }
            public Rim M_Parent { get { return m_parent; } }
        }
        private RimHeader _header;
        private RimExtendedHeader _extendedHeader;
        private ResourceEntryTable _resourceEntryTable;
        private Rim m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// RIM file header (20 bytes)
        /// </summary>
        public RimHeader Header { get { return _header; } }

        /// <summary>
        /// Extended header padding (100 bytes, total header = 120 bytes)
        /// </summary>
        public RimExtendedHeader ExtendedHeader { get { return _extendedHeader; } }

        /// <summary>
        /// Array of resource entries mapping ResRefs to resource data
        /// </summary>
        public ResourceEntryTable ResourceEntryTable { get { return _resourceEntryTable; } }
        public Rim M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
