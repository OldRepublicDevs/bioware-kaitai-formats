// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Wav || (root.Wav = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Wav_, KaitaiStream) {
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

var Wav = (function() {
  function Wav(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Wav.prototype._read = function() {
    this.riffHeader = new RiffHeader(this._io, this, this._root);
    this.chunks = [];
    var i = 0;
    do {
      var _ = new Chunk(this._io, this, this._root);
      this.chunks.push(_);
      i++;
    } while (!(this._io.isEof()));
  }

  var Chunk = Wav.Chunk = (function() {
    function Chunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Chunk.prototype._read = function() {
      this.id = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.size = this._io.readU4le();
      switch (this.id) {
      case "data":
        this.body = new DataChunkBody(this._io, this, this._root);
        break;
      case "fact":
        this.body = new FactChunkBody(this._io, this, this._root);
        break;
      case "fmt ":
        this.body = new FormatChunkBody(this._io, this, this._root);
        break;
      default:
        this.body = new UnknownChunkBody(this._io, this, this._root);
        break;
      }
    }

    /**
     * Chunk ID (4-character ASCII string)
     * Common values: "fmt ", "data", "fact", "LIST", etc.
     * Reference: https://github.com/xoreos/xoreos/blob/master/src/sound/decoders/wave.cpp:58-72
     */

    /**
     * Chunk size in bytes (chunk data only, excluding ID and size fields)
     * Chunks are word-aligned (even byte boundaries)
     * Reference: https://github.com/xoreos/xoreos/blob/master/src/sound/decoders/wave.cpp:66
     */

    /**
     * Chunk body (content depends on chunk ID)
     */

    return Chunk;
  })();

  var DataChunkBody = Wav.DataChunkBody = (function() {
    function DataChunkBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DataChunkBody.prototype._read = function() {
      this.data = this._io.readBytes(this._parent.size);
    }

    /**
     * Raw audio data (PCM samples or compressed audio)
     * Reference: https://github.com/xoreos/xoreos/blob/master/src/sound/decoders/wave.cpp:79-80
     */

    return DataChunkBody;
  })();

  var FactChunkBody = Wav.FactChunkBody = (function() {
    function FactChunkBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FactChunkBody.prototype._read = function() {
      this.sampleCount = this._io.readU4le();
    }

    /**
     * Sample count (number of samples in compressed audio)
     * Used for compressed formats like ADPCM
     * Reference: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/wav/io_wav.py:189-192
     */

    return FactChunkBody;
  })();

  var FormatChunkBody = Wav.FormatChunkBody = (function() {
    function FormatChunkBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FormatChunkBody.prototype._read = function() {
      this.audioFormat = this._io.readU2le();
      this.channels = this._io.readU2le();
      this.sampleRate = this._io.readU4le();
      this.bytesPerSec = this._io.readU4le();
      this.blockAlign = this._io.readU2le();
      this.bitsPerSample = this._io.readU2le();
      if (this._parent.size > 16) {
        this.extraFormatBytes = this._io.readBytes(this._parent.size - 16);
      }
    }

    /**
     * True if audio format is IMA ADPCM (compressed)
     */
    Object.defineProperty(FormatChunkBody.prototype, 'isImaAdpcm', {
      get: function() {
        if (this._m_isImaAdpcm !== undefined)
          return this._m_isImaAdpcm;
        this._m_isImaAdpcm = this.audioFormat == 17;
        return this._m_isImaAdpcm;
      }
    });

    /**
     * True if audio format is MP3
     */
    Object.defineProperty(FormatChunkBody.prototype, 'isMp3', {
      get: function() {
        if (this._m_isMp3 !== undefined)
          return this._m_isMp3;
        this._m_isMp3 = this.audioFormat == 85;
        return this._m_isMp3;
      }
    });

    /**
     * True if audio format is PCM (uncompressed)
     */
    Object.defineProperty(FormatChunkBody.prototype, 'isPcm', {
      get: function() {
        if (this._m_isPcm !== undefined)
          return this._m_isPcm;
        this._m_isPcm = this.audioFormat == 1;
        return this._m_isPcm;
      }
    });

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

    /**
     * Number of audio channels:
     * - 1 = mono
     * - 2 = stereo
     * Reference: https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
     */

    /**
     * Sample rate in Hz
     * Typical values:
     * - 22050 Hz for SFX
     * - 44100 Hz for VO
     * Reference: https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
     */

    /**
     * Byte rate (average bytes per second)
     * Formula: sample_rate × block_align
     * Reference: https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
     */

    /**
     * Block alignment (bytes per sample frame)
     * Formula for PCM: channels × (bits_per_sample / 8)
     * Reference: https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
     */

    /**
     * Bits per sample
     * Common values: 8, 16
     * For PCM: typically 16-bit
     * Reference: https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
     */

    /**
     * Extra format bytes (present when fmt chunk size > 16)
     * For IMA ADPCM and other compressed formats, contains:
     * - Extra format size (u2)
     * - Format-specific data (e.g., ADPCM coefficients)
     * Reference: https://github.com/xoreos/xoreos/blob/master/src/sound/decoders/wave.cpp:66
     */

    return FormatChunkBody;
  })();

  var RiffHeader = Wav.RiffHeader = (function() {
    function RiffHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    RiffHeader.prototype._read = function() {
      this.riffId = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      if (!(this.riffId == "RIFF")) {
        throw new KaitaiStream.ValidationNotEqualError("RIFF", this.riffId, this._io, "/types/riff_header/seq/0");
      }
      this.riffSize = this._io.readU4le();
      this.waveId = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      if (!(this.waveId == "WAVE")) {
        throw new KaitaiStream.ValidationNotEqualError("WAVE", this.waveId, this._io, "/types/riff_header/seq/2");
      }
    }

    /**
     * MP3-in-WAV format detected when RIFF size = 50
     * Reference: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/wav/wav_obfuscation.py:60-64
     */
    Object.defineProperty(RiffHeader.prototype, 'isMp3InWav', {
      get: function() {
        if (this._m_isMp3InWav !== undefined)
          return this._m_isMp3InWav;
        this._m_isMp3InWav = this.riffSize == 50;
        return this._m_isMp3InWav;
      }
    });

    /**
     * RIFF chunk ID: "RIFF"
     */

    /**
     * File size minus 8 bytes (RIFF_ID + RIFF_SIZE itself)
     * For MP3-in-WAV format, this is 50
     * Reference: https://github.com/OldRepublicDevs/PyKotor/wiki/WAV-File-Format.md
     */

    /**
     * Format tag: "WAVE"
     */

    return RiffHeader;
  })();

  var UnknownChunkBody = Wav.UnknownChunkBody = (function() {
    function UnknownChunkBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    UnknownChunkBody.prototype._read = function() {
      this.data = this._io.readBytes(this._parent.size);
      if (KaitaiStream.mod(this._parent.size, 2) == 1) {
        this.padding = this._io.readU1();
      }
    }

    /**
     * Unknown chunk body (skip for compatibility)
     * Reference: https://github.com/xoreos/xoreos/blob/master/src/sound/decoders/wave.cpp:53-54
     */

    /**
     * Padding byte to align to word boundary (only if chunk size is odd)
     * RIFF chunks must be aligned to 2-byte boundaries
     * Reference: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/wav/io_wav.py:153-156
     */

    return UnknownChunkBody;
  })();

  /**
   * RIFF container header
   */

  /**
   * RIFF chunks in sequence (fmt, fact, data, etc.)
   * Parsed until end of file
   * Reference: https://github.com/xoreos/xoreos/blob/master/src/sound/decoders/wave.cpp:46-55
   */

  return Wav;
})();
Wav_.Wav = Wav;
});
