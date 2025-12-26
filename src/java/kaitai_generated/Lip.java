// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;


/**
 * LIP (LIP Synchronization) files drive mouth animation for voiced dialogue in BioWare games.
 * Each file contains a compact series of keyframes that map timestamps to discrete viseme
 * (mouth shape) indices so that the engine can interpolate character lip movement while
 * playing the companion WAV audio line.
 * 
 * LIP files are always binary and contain only animation data. They are paired with WAV
 * voice-over resources of identical duration; the LIP length field must match the WAV
 * playback time for glitch-free animation.
 * 
 * Keyframes are sorted chronologically and store a timestamp (float seconds) plus a
 * 1-byte viseme index (0-15). The format uses the 16-shape Preston Blair phoneme set.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/LIP-File-Format.md
 * - https://github.com/seedhartha/reone/blob/master/src/libs/graphics/format/lipreader.cpp:27-42
 * - https://github.com/xoreos/xoreos/blob/master/src/graphics/aurora/lipfile.cpp
 * - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/LIPObject.ts:93-146
 */
public class Lip extends KaitaiStruct {
    public static Lip fromFile(String fileName) throws IOException {
        return new Lip(new ByteBufferKaitaiStream(fileName));
    }

    public enum LipShapes {
        NEUTRAL(0),
        EE(1),
        EH(2),
        AH(3),
        OH(4),
        OOH(5),
        Y(6),
        STS(7),
        FV(8),
        NG(9),
        TH(10),
        MPB(11),
        TD(12),
        SH(13),
        L(14),
        KG(15);

        private final long id;
        LipShapes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, LipShapes> byId = new HashMap<Long, LipShapes>(16);
        static {
            for (LipShapes e : LipShapes.values())
                byId.put(e.id(), e);
        }
        public static LipShapes byId(long id) { return byId.get(id); }
    }

    public Lip(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Lip(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Lip(KaitaiStream _io, KaitaiStruct _parent, Lip _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.fileType = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
        this.fileVersion = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
        this.length = this._io.readF4le();
        this.numKeyframes = this._io.readU4le();
        this.keyframes = new ArrayList<KeyframeEntry>();
        for (int i = 0; i < numKeyframes(); i++) {
            this.keyframes.add(new KeyframeEntry(this._io, this, _root));
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.keyframes.size(); i++) {
            this.keyframes.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    /**
     * A single keyframe entry mapping a timestamp to a viseme (mouth shape).
     * Keyframes are used by the engine to interpolate between mouth shapes during
     * audio playback to create lip sync animation.
     */
    public static class KeyframeEntry extends KaitaiStruct {
        public static KeyframeEntry fromFile(String fileName) throws IOException {
            return new KeyframeEntry(new ByteBufferKaitaiStream(fileName));
        }

        public KeyframeEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public KeyframeEntry(KaitaiStream _io, Lip _parent) {
            this(_io, _parent, null);
        }

        public KeyframeEntry(KaitaiStream _io, Lip _parent, Lip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.timestamp = this._io.readF4le();
            this.shape = Lip.LipShapes.byId(this._io.readU1());
        }

        public void _fetchInstances() {
        }
        private float timestamp;
        private LipShapes shape;
        private Lip _root;
        private Lip _parent;

        /**
         * Seconds from animation start. Must be >= 0 and <= length.
         * Keyframes should be sorted ascending by timestamp.
         */
        public float timestamp() { return timestamp; }

        /**
         * Viseme index (0-15) indicating which mouth shape to use at this timestamp.
         * Uses the 16-shape Preston Blair phoneme set. See lip_shapes enum for details.
         */
        public LipShapes shape() { return shape; }
        public Lip _root() { return _root; }
        public Lip _parent() { return _parent; }
    }
    private String fileType;
    private String fileVersion;
    private float length;
    private long numKeyframes;
    private List<KeyframeEntry> keyframes;
    private Lip _root;
    private KaitaiStruct _parent;

    /**
     * File type signature. Must be "LIP " (space-padded) for LIP files.
     */
    public String fileType() { return fileType; }

    /**
     * File format version. Must be "V1.0" for LIP files.
     */
    public String fileVersion() { return fileVersion; }

    /**
     * Duration in seconds. Must equal the paired WAV file playback time for
     * glitch-free animation. This is the total length of the lip sync animation.
     */
    public float length() { return length; }

    /**
     * Number of keyframes immediately following. Each keyframe contains a timestamp
     * and a viseme shape index. Keyframes should be sorted ascending by timestamp.
     */
    public long numKeyframes() { return numKeyframes; }

    /**
     * Array of keyframe entries. Each entry maps a timestamp to a mouth shape.
     * Entries must be stored in chronological order (ascending by timestamp).
     */
    public List<KeyframeEntry> keyframes() { return keyframes; }
    public Lip _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
