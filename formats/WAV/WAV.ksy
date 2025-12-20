meta:
  id: wav
  title: BioWare WAV (Waveform Audio) Format
  license: MIT
  endian: le
  file-extension: wav
  xref:
    pykotor: vendor/PyKotor/Libraries/PyKotor/src/pykotor/resource/formats/wav/
    reone: vendor/reone/src/libs/audio/format/wavreader.cpp
    xoreos: vendor/xoreos/src/sound/decoders/wave.cpp
    sithcodec: vendor/SithCodec
    swkotor_audio: vendor/SWKotOR-Audio-Encoder
    wiki: vendor/PyKotor/wiki/WAV-File-Format.md
doc: |
  WAV (Waveform Audio Format) files used in KotOR. KotOR stores both standard WAV voice-over lines
  and Bioware-obfuscated sound-effect files. Voice-over assets are regular RIFF containers with PCM
  headers, while SFX assets prepend a 470-byte custom block before the RIFF data.

  File Types:
  - VO (Voice-over): Dialogue lines (*.wav referenced by TLK StrRefs). Plain RIFF/WAVE PCM files
    readable by any media player. Most dialogue is 16-bit mono PCM at 44100 Hz.
  - SFX (Sound effects): Combat, UI, ambience, *.wav files under StreamSounds/SFX. Contains a
    Bioware 470-byte obfuscation header followed by the same RIFF data. PyKotor exposes these via
    the WAVType enum (VO vs SFX) so tools know whether to insert/remove the proprietary header.

  Format Variants:
  - Standard RIFF/WAVE: Canonical RIFF chunk order with "RIFF" header, "WAVE" format tag, "fmt "
    chunk, and "data" chunk. May include optional "fact" chunk for compressed formats.
  - MP3-in-WAV: Special RIFF container with MP3 data (RIFF size = 50). Used for some compressed
    audio assets. Detected when RIFF size field equals 50.

  Standard RIFF/WAVE Structure:
  - Offset 0x00: "RIFF" chunk ID (4 bytes)
  - Offset 0x04: File size minus 8 (uint32)
  - Offset 0x08: "WAVE" format tag (4 bytes)
  - Offset 0x0C: "fmt " chunk ID (4 bytes)
  - Offset 0x10: Format chunk size (uint32, usually 0x10 for PCM)
  - Format chunk body: audio_format, channels, sample_rate, bytes_per_sec, block_align, bits_per_sample
  - Optional "fact" chunk: Sample count for compressed formats (KotOR voice-over WAVs add this)
  - "data" chunk: Chunk ID, size, and raw audio data

  Encoding Details:
  - PCM (audio_format = 0x0001): Most dialogue is 16-bit mono PCM, which streams directly through
    the engine mixer. Typically 44100 Hz for VO, 22050 Hz for SFX.
  - IMA ADPCM (audio_format = 0x0011): Some ambient SFX use compressed ADPCM frames. When present,
    the fmt chunk includes the extra coefficient block defined by the WAV spec.
  - KotOR requires block_align and bytes_per_sec to match the values implied by the codec.
    Mismatched headers can crash the in-engine decoder.

  KotOR SFX Header:
  - SFX assets start with 470 bytes of obfuscated metadata (magic numbers plus filler 0x55).
  - After this header, the file resumes at the "RIFF" signature described above.
  - When exporting SFX, PyKotor recreates the header verbatim so the game recognizes the asset.

  Note: This Kaitai Struct definition documents the core RIFF/WAVE structure. SFX and VO headers
  (470-byte and 20-byte prefixes respectively) are handled by application-level deobfuscation.

  References:
  - vendor/PyKotor/wiki/WAV-File-Format.md - Complete KotOR WAV format documentation
  - vendor/reone/src/libs/audio/format/wavreader.cpp:30-56 - Complete C++ WAV reader implementation
  - vendor/xoreos/src/sound/decoders/wave.cpp:34-84 - Generic Aurora WAV decoder
  - vendor/SithCodec - Encoding/decoding utility for KotOR audio
  - vendor/SWKotOR-Audio-Encoder - Audio encoding tool for KotOR
  - Libraries/PyKotor/src/pykotor/resource/formats/wav/io_wav.py:52-121 - PyKotor binary reader/writer
  - Libraries/PyKotor/src/pykotor/resource/formats/wav/wav_data.py - WAV data model

seq:
  - id: riff_header
    type: riff_header
    doc: RIFF container header

  - id: chunks
    type: chunk
    repeat: until
    repeat-until: _io.eof
    doc: |
      RIFF chunks in sequence (fmt, fact, data, etc.)
      Parsed until end of file
      Reference: vendor/xoreos/src/sound/decoders/wave.cpp:46-55

types:
  riff_header:
    seq:
      - id: riff_id
        type: str
        encoding: ASCII
        size: 4
        doc: RIFF chunk ID: "RIFF"
        valid: "RIFF"

      - id: riff_size
        type: u4
        doc: |
          File size minus 8 bytes (RIFF_ID + RIFF_SIZE itself)
          For MP3-in-WAV format, this is 50
          Reference: vendor/PyKotor/wiki/WAV-File-Format.md

      - id: wave_id
        type: str
        encoding: ASCII
        size: 4
        doc: Format tag: "WAVE"
        valid: "WAVE"

    instances:
      is_mp3_in_wav:
        value: riff_size == 50
        doc: |
          MP3-in-WAV format detected when RIFF size = 50
          Reference: vendor/PyKotor/src/pykotor/resource/formats/wav/wav_obfuscation.py:60-64

  chunk:
    seq:
      - id: id
        type: str
        encoding: ASCII
        size: 4
        doc: |
          Chunk ID (4-character ASCII string)
          Common values: "fmt ", "data", "fact", "LIST", etc.
          Reference: vendor/xoreos/src/sound/decoders/wave.cpp:58-72

      - id: size
        type: u4
        doc: |
          Chunk size in bytes (chunk data only, excluding ID and size fields)
          Chunks are word-aligned (even byte boundaries)
          Reference: vendor/xoreos/src/sound/decoders/wave.cpp:66

      - id: body
        type: chunk_body
        doc: Chunk body (content depends on chunk ID)

  chunk_body:
    switch-on: _parent.id
    cases:
      '"fmt "': format_chunk_body
      '"data"': data_chunk_body
      '"fact"': fact_chunk_body
      _: unknown_chunk_body
    doc: Chunk body type depends on chunk ID

  format_chunk_body:
    seq:
      - id: audio_format
        type: u2
        doc: |
          Audio format code:
          - 0x0001 = PCM (Linear PCM, uncompressed)
          - 0x0002 = Microsoft ADPCM
          - 0x0006 = A-Law companded
          - 0x0007 = μ-Law companded
          - 0x0011 = IMA ADPCM (DVI ADPCM)
          - 0x0055 = MPEG Layer 3 (MP3)
          Reference: vendor/PyKotor/wiki/WAV-File-Format.md

      - id: channels
        type: u2
        doc: |
          Number of audio channels:
          - 1 = mono
          - 2 = stereo
          Reference: vendor/PyKotor/wiki/WAV-File-Format.md

      - id: sample_rate
        type: u4
        doc: |
          Sample rate in Hz
          Typical values:
          - 22050 Hz for SFX
          - 44100 Hz for VO
          Reference: vendor/PyKotor/wiki/WAV-File-Format.md

      - id: bytes_per_sec
        type: u4
        doc: |
          Byte rate (average bytes per second)
          Formula: sample_rate × block_align
          Reference: vendor/PyKotor/wiki/WAV-File-Format.md

      - id: block_align
        type: u2
        doc: |
          Block alignment (bytes per sample frame)
          Formula for PCM: channels × (bits_per_sample / 8)
          Reference: vendor/PyKotor/wiki/WAV-File-Format.md

      - id: bits_per_sample
        type: u2
        doc: |
          Bits per sample
          Common values: 8, 16
          For PCM: typically 16-bit
          Reference: vendor/PyKotor/wiki/WAV-File-Format.md

      - id: extra_format_bytes
        type: str
        size: _parent.size - 16
        if: _parent.size > 16
        doc: |
          Extra format bytes (present when fmt chunk size > 16)
          For IMA ADPCM and other compressed formats, contains:
          - Extra format size (u2)
          - Format-specific data (e.g., ADPCM coefficients)
          Reference: vendor/xoreos/src/sound/decoders/wave.cpp:66

    instances:
      is_pcm:
        value: audio_format == 1
        doc: True if audio format is PCM (uncompressed)

      is_ima_adpcm:
        value: audio_format == 0x11
        doc: True if audio format is IMA ADPCM (compressed)

      is_mp3:
        value: audio_format == 0x55
        doc: True if audio format is MP3

  data_chunk_body:
    seq:
      - id: data
        type: str
        size: _parent.size
        doc: |
          Raw audio data (PCM samples or compressed audio)
          Reference: vendor/xoreos/src/sound/decoders/wave.cpp:79-80

  fact_chunk_body:
    seq:
      - id: sample_count
        type: u4
        doc: |
          Sample count (number of samples in compressed audio)
          Used for compressed formats like ADPCM
          Reference: vendor/PyKotor/src/pykotor/resource/formats/wav/io_wav.py:189-192

  unknown_chunk_body:
    seq:
      - id: data
        type: str
        size: _parent.size
        doc: |
          Unknown chunk body (skip for compatibility)
          Reference: vendor/xoreos/src/sound/decoders/wave.cpp:53-54

      - id: padding
        type: u1
        if: _parent.size % 2 == 1
        doc: |
          Padding byte to align to word boundary (only if chunk size is odd)
          RIFF chunks must be aligned to 2-byte boundaries
          Reference: vendor/PyKotor/src/pykotor/resource/formats/wav/io_wav.py:153-156
