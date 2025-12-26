#ifndef WAV_H_
#define WAV_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class wav_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * WAV (Waveform Audio Format) files used in KotOR. KotOR stores both standard WAV voice-over lines
 * and Bioware-obfuscated sound-effect files. Voice-over assets are regular RIFF containers with PCM
 * headers, while SFX assets prepend a 470-byte custom block before the RIFF data.
 * 
 * Format Types:
 * - VO (Voice-over): Plain RIFF/WAVE PCM files readable by any media player
 * - SFX (Sound effects): Contains a Bioware 470-byte obfuscation header followed by RIFF data
 * - MP3-in-WAV: Special RIFF container with MP3 data (RIFF size = 50)
 * 
 * Note: This Kaitai Struct definition documents the core RIFF/WAVE structure. SFX and VO headers
 * (470-byte and 20-byte prefixes respectively) are handled by application-level deobfuscation.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
 * - https://github.com/seedhartha/reone/blob/master/src/libs/audio/format/wavreader.cpp:30-56
 * - https://github.com/xoreos/xoreos/blob/master/src/sound/decoders/wave.cpp:34-84
 */

class wav_t : public kaitai::kstruct {

public:
    class chunk_t;
    class data_chunk_body_t;
    class fact_chunk_body_t;
    class format_chunk_body_t;
    class riff_header_t;
    class unknown_chunk_body_t;

    wav_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, wav_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~wav_t();

    class chunk_t : public kaitai::kstruct {

    public:

        chunk_t(kaitai::kstream* p__io, wav_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunk_t();

    private:
        std::string m_id;
        uint32_t m_size;
        kaitai::kstruct* m_body;
        wav_t* m__root;
        wav_t* m__parent;

    public:

        /**
         * Chunk ID (4-character ASCII string)
         * Common values: "fmt ", "data", "fact", "LIST", etc.
         * Reference: https://github.com/xoreos/xoreos/blob/master/src/sound/decoders/wave.cpp:58-72
         */
        std::string id() const { return m_id; }

        /**
         * Chunk size in bytes (chunk data only, excluding ID and size fields)
         * Chunks are word-aligned (even byte boundaries)
         * Reference: https://github.com/xoreos/xoreos/blob/master/src/sound/decoders/wave.cpp:66
         */
        uint32_t size() const { return m_size; }

        /**
         * Chunk body (content depends on chunk ID)
         */
        kaitai::kstruct* body() const { return m_body; }
        wav_t* _root() const { return m__root; }
        wav_t* _parent() const { return m__parent; }
    };

    class data_chunk_body_t : public kaitai::kstruct {

    public:

        data_chunk_body_t(kaitai::kstream* p__io, wav_t::chunk_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_chunk_body_t();

    private:
        std::string m_data;
        wav_t* m__root;
        wav_t::chunk_t* m__parent;

    public:

        /**
         * Raw audio data (PCM samples or compressed audio)
         * Reference: https://github.com/xoreos/xoreos/blob/master/src/sound/decoders/wave.cpp:79-80
         */
        std::string data() const { return m_data; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_t* _parent() const { return m__parent; }
    };

    class fact_chunk_body_t : public kaitai::kstruct {

    public:

        fact_chunk_body_t(kaitai::kstream* p__io, wav_t::chunk_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~fact_chunk_body_t();

    private:
        uint32_t m_sample_count;
        wav_t* m__root;
        wav_t::chunk_t* m__parent;

    public:

        /**
         * Sample count (number of samples in compressed audio)
         * Used for compressed formats like ADPCM
         * Reference: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/wav/io_wav.py:189-192
         */
        uint32_t sample_count() const { return m_sample_count; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_t* _parent() const { return m__parent; }
    };

    class format_chunk_body_t : public kaitai::kstruct {

    public:

        format_chunk_body_t(kaitai::kstream* p__io, wav_t::chunk_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~format_chunk_body_t();

    private:
        bool f_is_ima_adpcm;
        bool m_is_ima_adpcm;

    public:

        /**
         * True if audio format is IMA ADPCM (compressed)
         */
        bool is_ima_adpcm();

    private:
        bool f_is_mp3;
        bool m_is_mp3;

    public:

        /**
         * True if audio format is MP3
         */
        bool is_mp3();

    private:
        bool f_is_pcm;
        bool m_is_pcm;

    public:

        /**
         * True if audio format is PCM (uncompressed)
         */
        bool is_pcm();

    private:
        uint16_t m_audio_format;
        uint16_t m_channels;
        uint32_t m_sample_rate;
        uint32_t m_bytes_per_sec;
        uint16_t m_block_align;
        uint16_t m_bits_per_sample;
        std::string m_extra_format_bytes;
        bool n_extra_format_bytes;

    public:
        bool _is_null_extra_format_bytes() { extra_format_bytes(); return n_extra_format_bytes; };

    private:
        wav_t* m__root;
        wav_t::chunk_t* m__parent;

    public:

        /**
         * Audio format code:
         * - 0x0001 = PCM (Linear PCM, uncompressed)
         * - 0x0002 = Microsoft ADPCM
         * - 0x0006 = A-Law companded
         * - 0x0007 = μ-Law companded
         * - 0x0011 = IMA ADPCM (DVI ADPCM)
         * - 0x0055 = MPEG Layer 3 (MP3)
         * Reference: https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
         */
        uint16_t audio_format() const { return m_audio_format; }

        /**
         * Number of audio channels:
         * - 1 = mono
         * - 2 = stereo
         * Reference: https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
         */
        uint16_t channels() const { return m_channels; }

        /**
         * Sample rate in Hz
         * Typical values:
         * - 22050 Hz for SFX
         * - 44100 Hz for VO
         * Reference: https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
         */
        uint32_t sample_rate() const { return m_sample_rate; }

        /**
         * Byte rate (average bytes per second)
         * Formula: sample_rate × block_align
         * Reference: https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
         */
        uint32_t bytes_per_sec() const { return m_bytes_per_sec; }

        /**
         * Block alignment (bytes per sample frame)
         * Formula for PCM: channels × (bits_per_sample / 8)
         * Reference: https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
         */
        uint16_t block_align() const { return m_block_align; }

        /**
         * Bits per sample
         * Common values: 8, 16
         * For PCM: typically 16-bit
         * Reference: https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
         */
        uint16_t bits_per_sample() const { return m_bits_per_sample; }

        /**
         * Extra format bytes (present when fmt chunk size > 16)
         * For IMA ADPCM and other compressed formats, contains:
         * - Extra format size (u2)
         * - Format-specific data (e.g., ADPCM coefficients)
         * Reference: https://github.com/xoreos/xoreos/blob/master/src/sound/decoders/wave.cpp:66
         */
        std::string extra_format_bytes() const { return m_extra_format_bytes; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_t* _parent() const { return m__parent; }
    };

    class riff_header_t : public kaitai::kstruct {

    public:

        riff_header_t(kaitai::kstream* p__io, wav_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~riff_header_t();

    private:
        bool f_is_mp3_in_wav;
        bool m_is_mp3_in_wav;

    public:

        /**
         * MP3-in-WAV format detected when RIFF size = 50
         * Reference: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/wav/wav_obfuscation.py:60-64
         */
        bool is_mp3_in_wav();

    private:
        std::string m_riff_id;
        uint32_t m_riff_size;
        std::string m_wave_id;
        wav_t* m__root;
        wav_t* m__parent;

    public:

        /**
         * RIFF chunk ID: "RIFF"
         */
        std::string riff_id() const { return m_riff_id; }

        /**
         * File size minus 8 bytes (RIFF_ID + RIFF_SIZE itself)
         * For MP3-in-WAV format, this is 50
         * Reference: https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
         */
        uint32_t riff_size() const { return m_riff_size; }

        /**
         * Format tag: "WAVE"
         */
        std::string wave_id() const { return m_wave_id; }
        wav_t* _root() const { return m__root; }
        wav_t* _parent() const { return m__parent; }
    };

    class unknown_chunk_body_t : public kaitai::kstruct {

    public:

        unknown_chunk_body_t(kaitai::kstream* p__io, wav_t::chunk_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~unknown_chunk_body_t();

    private:
        std::string m_data;
        uint8_t m_padding;
        bool n_padding;

    public:
        bool _is_null_padding() { padding(); return n_padding; };

    private:
        wav_t* m__root;
        wav_t::chunk_t* m__parent;

    public:

        /**
         * Unknown chunk body (skip for compatibility)
         * Reference: https://github.com/xoreos/xoreos/blob/master/src/sound/decoders/wave.cpp:53-54
         */
        std::string data() const { return m_data; }

        /**
         * Padding byte to align to word boundary (only if chunk size is odd)
         * RIFF chunks must be aligned to 2-byte boundaries
         * Reference: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/wav/io_wav.py:153-156
         */
        uint8_t padding() const { return m_padding; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_t* _parent() const { return m__parent; }
    };

private:
    riff_header_t* m_riff_header;
    std::vector<chunk_t*>* m_chunks;
    wav_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * RIFF container header
     */
    riff_header_t* riff_header() const { return m_riff_header; }

    /**
     * RIFF chunks in sequence (fmt, fact, data, etc.)
     * Parsed until end of file
     * Reference: https://github.com/xoreos/xoreos/blob/master/src/sound/decoders/wave.cpp:46-55
     */
    std::vector<chunk_t*>* chunks() const { return m_chunks; }
    wav_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // WAV_H_
