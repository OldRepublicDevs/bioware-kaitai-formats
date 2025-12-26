// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class NcsMinimal : KaitaiStruct
    {
        public static NcsMinimal FromFile(string fileName)
        {
            return new NcsMinimal(new KaitaiStream(fileName));
        }

        public NcsMinimal(KaitaiStream p__io, KaitaiStruct p__parent = null, NcsMinimal p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _fileType = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
            _fileVersion = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
            _sizeMarker = m_io.ReadU1();
            _totalFileSize = m_io.ReadU4be();
            _instructions = new List<Instruction>();
            {
                var i = 0;
                Instruction M_;
                do {
                    M_ = new Instruction(m_io, this, m_root);
                    _instructions.Add(M_);
                    i++;
                } while (!(M_Io.Pos >= M_Root.TotalFileSize));
            }
        }
        public partial class Instruction : KaitaiStruct
        {
            public static Instruction FromFile(string fileName)
            {
                return new Instruction(new KaitaiStream(fileName));
            }

            public Instruction(KaitaiStream p__io, NcsMinimal p__parent = null, NcsMinimal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _bytecode = m_io.ReadU1();
                _qualifier = m_io.ReadU1();
            }
            private byte _bytecode;
            private byte _qualifier;
            private NcsMinimal m_root;
            private NcsMinimal m_parent;
            public byte Bytecode { get { return _bytecode; } }
            public byte Qualifier { get { return _qualifier; } }
            public NcsMinimal M_Root { get { return m_root; } }
            public NcsMinimal M_Parent { get { return m_parent; } }
        }
        private string _fileType;
        private string _fileVersion;
        private byte _sizeMarker;
        private uint _totalFileSize;
        private List<Instruction> _instructions;
        private NcsMinimal m_root;
        private KaitaiStruct m_parent;
        public string FileType { get { return _fileType; } }
        public string FileVersion { get { return _fileVersion; } }
        public byte SizeMarker { get { return _sizeMarker; } }
        public uint TotalFileSize { get { return _totalFileSize; } }
        public List<Instruction> Instructions { get { return _instructions; } }
        public NcsMinimal M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
