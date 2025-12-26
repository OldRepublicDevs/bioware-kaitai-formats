// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * NSS (NWScript Source) files contain human-readable NWScript source code
 * that compiles to NCS bytecode. NWScript is the scripting language used
 * in KotOR, TSL, and Neverwinter Nights.
 * 
 * NSS files are plain text files (typically Windows-1252 or UTF-8 encoding)
 * containing NWScript source code. The nwscript.nss file defines all
 * engine-exposed functions and constants available to scripts.
 * 
 * Format:
 * - Plain text source code
 * - May include BOM (Byte Order Mark) for UTF-8 files
 * - Lines are typically terminated with CRLF (\r\n) or LF (\n)
 * - Comments: // for single-line, /* */ for multi-line
 * - Preprocessor directives: #include, #define, etc.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/NSS-File-Format.md
 * - https://github.com/xoreos/xoreos-tools/tree/master/src/nwscript/ (NWScript compiler)
 * - https://github.com/seedhartha/reone/blob/master/src/libs/script/ (Script execution engine)
 */
public class Nss extends KaitaiStruct {
    public static Nss fromFile(String fileName) throws IOException {
        return new Nss(new ByteBufferKaitaiStream(fileName));
    }

    public Nss(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Nss(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Nss(KaitaiStream _io, KaitaiStruct _parent, Nss _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        if (_io().pos() == 0) {
            this.bom = this._io.readU2le();
            if (!( ((this.bom == 65279) || (this.bom == 0)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.bom, this._io, "/seq/0");
            }
        }
        this.sourceCode = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
    }

    public void _fetchInstances() {
        if (_io().pos() == 0) {
        }
    }

    /**
     * NWScript source code structure.
     * This is primarily a text format, so the main content is the source_code string.
     * 
     * The source can be parsed into:
     * - Tokens (keywords, identifiers, operators, literals)
     * - Statements (declarations, assignments, control flow)
     * - Functions (definitions with parameters and body)
     * - Preprocessor directives (#include, #define)
     */
    public static class NssSource extends KaitaiStruct {
        public static NssSource fromFile(String fileName) throws IOException {
            return new NssSource(new ByteBufferKaitaiStream(fileName));
        }

        public NssSource(KaitaiStream _io) {
            this(_io, null, null);
        }

        public NssSource(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public NssSource(KaitaiStream _io, KaitaiStruct _parent, Nss _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.content = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String content;
        private Nss _root;
        private KaitaiStruct _parent;

        /**
         * Complete source code content.
         */
        public String content() { return content; }
        public Nss _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private Integer bom;
    private String sourceCode;
    private Nss _root;
    private KaitaiStruct _parent;

    /**
     * Optional UTF-8 BOM (Byte Order Mark) at the start of the file.
     * If present, will be 0xFEFF (UTF-8 BOM).
     * Most NSS files do not include a BOM.
     */
    public Integer bom() { return bom; }

    /**
     * Complete NWScript source code.
     * Contains function definitions, variable declarations, control flow
     * statements, and engine function calls.
     * 
     * Common elements:
     * - Function definitions: void function_name() { ... }
     * - Variable declarations: int variable_name;
     * - Control flow: if, while, for, switch
     * - Engine function calls: GetFirstObject(), GetObjectByTag(), etc.
     * - Constants: OBJECT_SELF, OBJECT_INVALID, etc.
     * 
     * The source code is compiled to NCS bytecode by the NWScript compiler.
     */
    public String sourceCode() { return sourceCode; }
    public Nss _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
