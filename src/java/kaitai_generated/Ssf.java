// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;


/**
 * SSF (Sound Set File) files store sound string references (StrRefs) for character voice sets.
 * Each SSF file contains exactly 28 sound slots, mapping to different game events and actions.
 * 
 * Binary Format:
 * - Header (12 bytes): File type signature, version, and offset to sounds array
 * - Sounds Array (112 bytes): 28 uint32 values representing StrRefs (0xFFFFFFFF = -1 = no sound)
 * - Padding (12 bytes): 3 uint32 values of 0xFFFFFFFF (reserved/unused)
 * 
 * Total file size: 136 bytes (12 + 112 + 12)
 * 
 * Sound Slots (in order):
 * 0-5: Battle Cry 1-6
 * 6-8: Select 1-3
 * 9-11: Attack Grunt 1-3
 * 12-13: Pain Grunt 1-2
 * 14: Low Health
 * 15: Dead
 * 16: Critical Hit
 * 17: Target Immune
 * 18: Lay Mine
 * 19: Disarm Mine
 * 20: Begin Stealth
 * 21: Begin Search
 * 22: Begin Unlock
 * 23: Unlock Failed
 * 24: Unlock Success
 * 25: Separated From Party
 * 26: Rejoined Party
 * 27: Poisoned
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf_binary_reader.py
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf_binary_writer.py
 */
public class Ssf extends KaitaiStruct {
    public static Ssf fromFile(String fileName) throws IOException {
        return new Ssf(new ByteBufferKaitaiStream(fileName));
    }

    public Ssf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ssf(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Ssf(KaitaiStream _io, KaitaiStruct _parent, Ssf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.fileType = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
        if (!(this.fileType.equals("SSF "))) {
            throw new KaitaiStream.ValidationNotEqualError("SSF ", this.fileType, this._io, "/seq/0");
        }
        this.fileVersion = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
        if (!(this.fileVersion.equals("V1.1"))) {
            throw new KaitaiStream.ValidationNotEqualError("V1.1", this.fileVersion, this._io, "/seq/1");
        }
        this.soundsOffset = this._io.readU4le();
        if (!(this.soundsOffset == 12)) {
            throw new KaitaiStream.ValidationNotEqualError(12, this.soundsOffset, this._io, "/seq/2");
        }
        this.padding = new Padding(this._io, this, _root);
    }

    public void _fetchInstances() {
        this.padding._fetchInstances();
        sounds();
        if (this.sounds != null) {
            this.sounds._fetchInstances();
        }
    }
    public static class Padding extends KaitaiStruct {
        public static Padding fromFile(String fileName) throws IOException {
            return new Padding(new ByteBufferKaitaiStream(fileName));
        }

        public Padding(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Padding(KaitaiStream _io, Ssf _parent) {
            this(_io, _parent, null);
        }

        public Padding(KaitaiStream _io, Ssf _parent, Ssf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.paddingBytes = new ArrayList<Long>();
            for (int i = 0; i < 3; i++) {
                this.paddingBytes.add(this._io.readU4le());
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.paddingBytes.size(); i++) {
            }
        }
        private List<Long> paddingBytes;
        private Ssf _root;
        private Ssf _parent;

        /**
         * Reserved padding bytes. Always 3 uint32 values of 0xFFFFFFFF.
         * Total size: 12 bytes (3 * 4 bytes).
         * These bytes are unused but must be present for format compatibility.
         * Each padding byte should be 0xFFFFFFFF (4294967295).
         */
        public List<Long> paddingBytes() { return paddingBytes; }
        public Ssf _root() { return _root; }
        public Ssf _parent() { return _parent; }
    }
    public static class SoundArray extends KaitaiStruct {
        public static SoundArray fromFile(String fileName) throws IOException {
            return new SoundArray(new ByteBufferKaitaiStream(fileName));
        }

        public SoundArray(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SoundArray(KaitaiStream _io, Ssf _parent) {
            this(_io, _parent, null);
        }

        public SoundArray(KaitaiStream _io, Ssf _parent, Ssf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<SoundEntry>();
            for (int i = 0; i < 28; i++) {
                this.entries.add(new SoundEntry(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<SoundEntry> entries;
        private Ssf _root;
        private Ssf _parent;

        /**
         * Array of exactly 28 sound entries, one for each SSFSound enum value.
         * Each entry is a uint32 representing a StrRef (string reference).
         * Value 0xFFFFFFFF (4294967295) represents -1 (no sound assigned).
         * 
         * Entry indices map to SSFSound enum:
         * - 0-5: Battle Cry 1-6
         * - 6-8: Select 1-3
         * - 9-11: Attack Grunt 1-3
         * - 12-13: Pain Grunt 1-2
         * - 14: Low Health
         * - 15: Dead
         * - 16: Critical Hit
         * - 17: Target Immune
         * - 18: Lay Mine
         * - 19: Disarm Mine
         * - 20: Begin Stealth
         * - 21: Begin Search
         * - 22: Begin Unlock
         * - 23: Unlock Failed
         * - 24: Unlock Success
         * - 25: Separated From Party
         * - 26: Rejoined Party
         * - 27: Poisoned
         */
        public List<SoundEntry> entries() { return entries; }
        public Ssf _root() { return _root; }
        public Ssf _parent() { return _parent; }
    }
    public static class SoundEntry extends KaitaiStruct {
        public static SoundEntry fromFile(String fileName) throws IOException {
            return new SoundEntry(new ByteBufferKaitaiStream(fileName));
        }

        public SoundEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SoundEntry(KaitaiStream _io, Ssf.SoundArray _parent) {
            this(_io, _parent, null);
        }

        public SoundEntry(KaitaiStream _io, Ssf.SoundArray _parent, Ssf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.strrefRaw = this._io.readU4le();
        }

        public void _fetchInstances() {
        }
        private Boolean isNoSound;

        /**
         * True if this entry represents "no sound" (0xFFFFFFFF).
         * False if this entry contains a valid StrRef value.
         */
        public Boolean isNoSound() {
            if (this.isNoSound != null)
                return this.isNoSound;
            this.isNoSound = strrefRaw() == 4294967295L;
            return this.isNoSound;
        }
        private long strrefRaw;
        private Ssf _root;
        private Ssf.SoundArray _parent;

        /**
         * Raw uint32 value representing the StrRef.
         * Value 0xFFFFFFFF (4294967295) represents -1 (no sound assigned).
         * All other values are valid StrRefs (typically 0-999999).
         * The conversion from 0xFFFFFFFF to -1 is handled by SSFBinaryReader.ReadInt32MaxNeg1().
         */
        public long strrefRaw() { return strrefRaw; }
        public Ssf _root() { return _root; }
        public Ssf.SoundArray _parent() { return _parent; }
    }
    private SoundArray sounds;

    /**
     * Array of 28 sound string references (StrRefs)
     */
    public SoundArray sounds() {
        if (this.sounds != null)
            return this.sounds;
        long _pos = this._io.pos();
        this._io.seek(soundsOffset());
        this.sounds = new SoundArray(this._io, this, _root);
        this._io.seek(_pos);
        return this.sounds;
    }
    private String fileType;
    private String fileVersion;
    private long soundsOffset;
    private Padding padding;
    private Ssf _root;
    private KaitaiStruct _parent;

    /**
     * File type signature. Must be "SSF " (space-padded).
     * Bytes: 0x53 0x53 0x46 0x20
     */
    public String fileType() { return fileType; }

    /**
     * File format version. Always "V1.1" for KotOR SSF files.
     * Bytes: 0x56 0x31 0x2E 0x31
     */
    public String fileVersion() { return fileVersion; }

    /**
     * Byte offset to the sounds array from the beginning of the file.
     * Always 12 (0x0C) in valid SSF files, as the sounds array immediately follows the header.
     * This field exists for format consistency, though it's always the same value.
     */
    public long soundsOffset() { return soundsOffset; }

    /**
     * Reserved padding bytes (12 bytes of 0xFFFFFFFF)
     */
    public Padding padding() { return padding; }
    public Ssf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
