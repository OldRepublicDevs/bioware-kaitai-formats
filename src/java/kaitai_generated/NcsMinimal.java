// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class NcsMinimal extends KaitaiStruct {
    public static NcsMinimal fromFile(String fileName) throws IOException {
        return new NcsMinimal(new ByteBufferKaitaiStream(fileName));
    }

    public NcsMinimal(KaitaiStream _io) {
        this(_io, null, null);
    }

    public NcsMinimal(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public NcsMinimal(KaitaiStream _io, KaitaiStruct _parent, NcsMinimal _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.fileType = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
        this.fileVersion = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
        this.sizeMarker = this._io.readU1();
        this.totalFileSize = this._io.readU4be();
        this.instructions = new ArrayList<Instruction>();
        {
            Instruction _it;
            int i = 0;
            do {
                _it = new Instruction(this._io, this, _root);
                this.instructions.add(_it);
                i++;
            } while (!(_io().pos() >= _root().totalFileSize()));
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.instructions.size(); i++) {
            this.instructions.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class Instruction extends KaitaiStruct {
        public static Instruction fromFile(String fileName) throws IOException {
            return new Instruction(new ByteBufferKaitaiStream(fileName));
        }

        public Instruction(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Instruction(KaitaiStream _io, NcsMinimal _parent) {
            this(_io, _parent, null);
        }

        public Instruction(KaitaiStream _io, NcsMinimal _parent, NcsMinimal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.bytecode = this._io.readU1();
            this.qualifier = this._io.readU1();
        }

        public void _fetchInstances() {
        }
        private int bytecode;
        private int qualifier;
        private NcsMinimal _root;
        private NcsMinimal _parent;
        public int bytecode() { return bytecode; }
        public int qualifier() { return qualifier; }
        public NcsMinimal _root() { return _root; }
        public NcsMinimal _parent() { return _parent; }
    }
    private String fileType;
    private String fileVersion;
    private int sizeMarker;
    private long totalFileSize;
    private List<Instruction> instructions;
    private NcsMinimal _root;
    private KaitaiStruct _parent;
    public String fileType() { return fileType; }
    public String fileVersion() { return fileVersion; }
    public int sizeMarker() { return sizeMarker; }
    public long totalFileSize() { return totalFileSize; }
    public List<Instruction> instructions() { return instructions; }
    public NcsMinimal _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
