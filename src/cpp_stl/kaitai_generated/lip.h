#ifndef LIP_H_
#define LIP_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class lip_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

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

class lip_t : public kaitai::kstruct {

public:
    class keyframe_entry_t;

    enum lip_shapes_t {
        LIP_SHAPES_NEUTRAL = 0,
        LIP_SHAPES_EE = 1,
        LIP_SHAPES_EH = 2,
        LIP_SHAPES_AH = 3,
        LIP_SHAPES_OH = 4,
        LIP_SHAPES_OOH = 5,
        LIP_SHAPES_Y = 6,
        LIP_SHAPES_STS = 7,
        LIP_SHAPES_FV = 8,
        LIP_SHAPES_NG = 9,
        LIP_SHAPES_TH = 10,
        LIP_SHAPES_MPB = 11,
        LIP_SHAPES_TD = 12,
        LIP_SHAPES_SH = 13,
        LIP_SHAPES_L = 14,
        LIP_SHAPES_KG = 15
    };
    static bool _is_defined_lip_shapes_t(lip_shapes_t v);

private:
    static const std::set<lip_shapes_t> _values_lip_shapes_t;
    static std::set<lip_shapes_t> _build_values_lip_shapes_t();

public:

    lip_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, lip_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~lip_t();

    /**
     * A single keyframe entry mapping a timestamp to a viseme (mouth shape).
     * Keyframes are used by the engine to interpolate between mouth shapes during
     * audio playback to create lip sync animation.
     */

    class keyframe_entry_t : public kaitai::kstruct {

    public:

        keyframe_entry_t(kaitai::kstream* p__io, lip_t* p__parent = 0, lip_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~keyframe_entry_t();

    private:
        float m_timestamp;
        lip_shapes_t m_shape;
        lip_t* m__root;
        lip_t* m__parent;

    public:

        /**
         * Seconds from animation start. Must be >= 0 and <= length.
         * Keyframes should be sorted ascending by timestamp.
         */
        float timestamp() const { return m_timestamp; }

        /**
         * Viseme index (0-15) indicating which mouth shape to use at this timestamp.
         * Uses the 16-shape Preston Blair phoneme set. See lip_shapes enum for details.
         */
        lip_shapes_t shape() const { return m_shape; }
        lip_t* _root() const { return m__root; }
        lip_t* _parent() const { return m__parent; }
    };

private:
    std::string m_file_type;
    std::string m_file_version;
    float m_length;
    uint32_t m_num_keyframes;
    std::vector<keyframe_entry_t*>* m_keyframes;
    lip_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * File type signature. Must be "LIP " (space-padded) for LIP files.
     */
    std::string file_type() const { return m_file_type; }

    /**
     * File format version. Must be "V1.0" for LIP files.
     */
    std::string file_version() const { return m_file_version; }

    /**
     * Duration in seconds. Must equal the paired WAV file playback time for
     * glitch-free animation. This is the total length of the lip sync animation.
     */
    float length() const { return m_length; }

    /**
     * Number of keyframes immediately following. Each keyframe contains a timestamp
     * and a viseme shape index. Keyframes should be sorted ascending by timestamp.
     */
    uint32_t num_keyframes() const { return m_num_keyframes; }

    /**
     * Array of keyframe entries. Each entry maps a timestamp to a mouth shape.
     * Entries must be stored in chronological order (ascending by timestamp).
     */
    std::vector<keyframe_entry_t*>* keyframes() const { return m_keyframes; }
    lip_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // LIP_H_
