#ifndef SSF_H_
#define SSF_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class ssf_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

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

class ssf_t : public kaitai::kstruct {

public:
    class padding_t;
    class sound_array_t;
    class sound_entry_t;

    ssf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, ssf_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~ssf_t();

    class padding_t : public kaitai::kstruct {

    public:

        padding_t(kaitai::kstream* p__io, ssf_t* p__parent = 0, ssf_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~padding_t();

    private:
        std::vector<uint32_t>* m_padding_bytes;
        ssf_t* m__root;
        ssf_t* m__parent;

    public:

        /**
         * Reserved padding bytes. Always 3 uint32 values of 0xFFFFFFFF.
         * Total size: 12 bytes (3 * 4 bytes).
         * These bytes are unused but must be present for format compatibility.
         * Each padding byte should be 0xFFFFFFFF (4294967295).
         */
        std::vector<uint32_t>* padding_bytes() const { return m_padding_bytes; }
        ssf_t* _root() const { return m__root; }
        ssf_t* _parent() const { return m__parent; }
    };

    class sound_array_t : public kaitai::kstruct {

    public:

        sound_array_t(kaitai::kstream* p__io, ssf_t* p__parent = 0, ssf_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~sound_array_t();

    private:
        std::vector<sound_entry_t*>* m_entries;
        ssf_t* m__root;
        ssf_t* m__parent;

    public:

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
        std::vector<sound_entry_t*>* entries() const { return m_entries; }
        ssf_t* _root() const { return m__root; }
        ssf_t* _parent() const { return m__parent; }
    };

    class sound_entry_t : public kaitai::kstruct {

    public:

        sound_entry_t(kaitai::kstream* p__io, ssf_t::sound_array_t* p__parent = 0, ssf_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~sound_entry_t();

    private:
        bool f_is_no_sound;
        bool m_is_no_sound;

    public:

        /**
         * True if this entry represents "no sound" (0xFFFFFFFF).
         * False if this entry contains a valid StrRef value.
         */
        bool is_no_sound();

    private:
        uint32_t m_strref_raw;
        ssf_t* m__root;
        ssf_t::sound_array_t* m__parent;

    public:

        /**
         * Raw uint32 value representing the StrRef.
         * Value 0xFFFFFFFF (4294967295) represents -1 (no sound assigned).
         * All other values are valid StrRefs (typically 0-999999).
         * The conversion from 0xFFFFFFFF to -1 is handled by SSFBinaryReader.ReadInt32MaxNeg1().
         */
        uint32_t strref_raw() const { return m_strref_raw; }
        ssf_t* _root() const { return m__root; }
        ssf_t::sound_array_t* _parent() const { return m__parent; }
    };

private:
    bool f_sounds;
    sound_array_t* m_sounds;

public:

    /**
     * Array of 28 sound string references (StrRefs)
     */
    sound_array_t* sounds();

private:
    std::string m_file_type;
    std::string m_file_version;
    uint32_t m_sounds_offset;
    padding_t* m_padding;
    ssf_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * File type signature. Must be "SSF " (space-padded).
     * Bytes: 0x53 0x53 0x46 0x20
     */
    std::string file_type() const { return m_file_type; }

    /**
     * File format version. Always "V1.1" for KotOR SSF files.
     * Bytes: 0x56 0x31 0x2E 0x31
     */
    std::string file_version() const { return m_file_version; }

    /**
     * Byte offset to the sounds array from the beginning of the file.
     * Always 12 (0x0C) in valid SSF files, as the sounds array immediately follows the header.
     * This field exists for format consistency, though it's always the same value.
     */
    uint32_t sounds_offset() const { return m_sounds_offset; }

    /**
     * Reserved padding bytes (12 bytes of 0xFFFFFFFF)
     */
    padding_t* padding() const { return m_padding; }
    ssf_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // SSF_H_
