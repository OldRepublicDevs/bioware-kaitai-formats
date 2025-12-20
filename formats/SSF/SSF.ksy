meta:
  id: ssf
  title: BioWare SSF (Sound Set File) Format
  license: MIT
  endian: le
  file-extension: ssf
  xref:
    pykotor: vendor/PyKotor/Libraries/PyKotor/src/pykotor/resource/formats/ssf/
    reone: vendor/reone/src/libs/resource/format/ssfreader.cpp
    xoreos: vendor/xoreos/src/aurora/ssffile.cpp
    kotor_js: vendor/KotOR.js/src/resource/SSFObject.ts
    kotor_unity: vendor/KotOR-Unity/Assets/Scripts/FileObjects/SSFObject.cs
    kotor_net: vendor/Kotor.NET/Kotor.NET/Formats/KotorSSF/
    wiki: vendor/PyKotor/wiki/SSF-File-Format.md
    bioware_aurora: vendor/PyKotor/wiki/Bioware-Aurora-SSF.md
doc: |
  SSF (Sound Set File) files define a set of sound effects that creatures can play during various
  game events (battle cries, pain grunts, selection sounds, etc.). The StrRefs point to entries in
  dialog.tlk which contain the actual WAV file references.

  Format Overview:
  - SSF files are binary format files with a fixed structure
  - Each SSF file contains exactly 28 sound slots
  - Each slot maps to a specific game event or action
  - Slots store StrRefs (string references) into dialog.tlk
  - Value -1 (0xFFFFFFFF) indicates no sound for that event type

  Binary Format Structure:
  - File Header (12 bytes): File type signature ("SSF "), version ("V1.1"), and offset to sounds array
  - Sound Table (112 bytes): Array of 28 uint32 StrRef values (4 bytes × 28 = 112 bytes)
  - Padding (12 bytes): 3 uint32 values of 0xFFFFFFFF (reserved/unused, for format compatibility)

  Total file size: 136 bytes (12 + 112 + 12)

  Note: KotOR SSF format differs from Neverwinter Nights SSF format. KotOR uses a simplified
  format with only StrRefs, while NWN includes ResRefs (sound filenames) and StringRefs.
  This KSY definition documents the KotOR-specific format.

  Sound Event Types (28 total, in array order):
  The sound slots are fixed indices that map to specific game events. The game engine uses
  these indices to look up the appropriate StrRef from the sounds array.

  References:
  - vendor/PyKotor/wiki/SSF-File-Format.md - Complete KotOR SSF format documentation
  - vendor/PyKotor/wiki/Bioware-Aurora-SSF.md - Official BioWare Aurora SSF specification (NWN format, for reference)
  - vendor/reone/src/libs/resource/format/ssfreader.cpp:31 - Complete C++ SSF reader implementation
  - vendor/xoreos/src/aurora/ssffile.cpp - Generic Aurora SSF implementation (shared format)
  - vendor/KotOR.js/src/resource/SSFObject.ts - TypeScript SSF parser
  - vendor/KotOR-Unity/Assets/Scripts/FileObjects/SSFObject.cs - C# Unity SSF loader
  - vendor/Kotor.NET/Kotor.NET/Formats/KotorSSF/ - .NET SSF reader/writer
  - Libraries/PyKotor/src/pykotor/resource/formats/ssf/io_ssf.py - PyKotor binary reader/writer
  - Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf_data.py:50-258 - SSF data model

seq:
  - id: file_type
    type: str
    encoding: ASCII
    size: 4
    doc: |
      File type signature. Must be "SSF " (space-padded).
      Bytes: 0x53 0x53 0x46 0x20
    valid: "SSF "

  - id: file_version
    type: str
    encoding: ASCII
    size: 4
    doc: |
      File format version. Always "V1.1" for KotOR SSF files.
      Bytes: 0x56 0x31 0x2E 0x31
    valid: "V1.1"

  - id: sounds_offset
    type: u4
    doc: |
      Byte offset to the sounds array from the beginning of the file.
      Always 12 (0x0C) in valid SSF files, as the sounds array immediately follows the header.
      This field exists for format consistency, though it's always the same value.
    valid: 12

  - id: sounds
    type: sound_array
    pos: sounds_offset
    doc: Array of 28 sound string references (StrRefs)

  - id: padding
    type: padding
    doc: Reserved padding bytes (12 bytes of 0xFFFFFFFF)

types:
  sound_array:
    seq:
      - id: entries
        type: sound_entry
        repeat: expr
        repeat-expr: 28
        doc: |
          Array of exactly 28 sound entries, one for each SSFSound enum value.
          Each entry is a uint32 representing a StrRef (string reference) into dialog.tlk.
          Value 0xFFFFFFFF (4294967295) represents -1 (no sound assigned).

          Entry indices map to SSFSound enum values (0-based):
          - 0: BATTLE_CRY_1 - First battle cry
          - 1: BATTLE_CRY_2 - Second battle cry
          - 2: BATTLE_CRY_3 - Third battle cry
          - 3: SELECT_1 - First selection sound (when character is selected)
          - 4: SELECT_2 - Second selection sound
          - 5: SELECT_3 - Third selection sound
          - 6: ATTACK_1 - First attack grunt sound
          - 7: ATTACK_2 - Second attack grunt sound
          - 8: ATTACK_3 - Third attack grunt sound
          - 9: PAIN_1 - First pain grunt sound
          - 10: PAIN_2 - Second pain grunt sound
          - 11: PAIN_3 - Third pain grunt sound
          - 12: LOW_HEALTH - Low health warning sound
          - 13: DEAD - Death sound effect
          - 14: CRITICAL_HIT - Critical hit sound
          - 15: IMMUNE - Target immune to attack sound
          - 16: LAYING_MINE - Laying mine sound
          - 17: DISARM_MINE - Disarming mine sound
          - 18: STUN - Stunned sound
          - 19: UNLOCK_DOOR - Unlocking door sound
          - 20: LOCK_DOOR - Locking door sound
          - 21: UNLOCK_CONTAINER - Unlocking container sound
          - 22: LOCK_CONTAINER - Locking container sound
          - 23: UNLOCKABLE - Unlockable object sound
          - 24: LOCKED - Locked object sound
          - 25: ELEVATOR_MOVING - Elevator moving sound
          - 26: WHIRL_WIND - Whirlwind sound
          - 27: POISONED - Poisoned sound

          Reference: Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf_data.py:50-258

  sound_entry:
    seq:
      - id: strref_raw
        type: u4
        doc: |
          Raw uint32 value representing the StrRef.
          Value 0xFFFFFFFF (4294967295) represents -1 (no sound assigned).
          All other values are valid StrRefs (typically 0-999999).
          The conversion from 0xFFFFFFFF to -1 is handled by SSFBinaryReader.ReadInt32MaxNeg1().

    instances:
      is_no_sound:
        value: strref_raw == 0xFFFFFFFF
        doc: |
          True if this entry represents "no sound" (0xFFFFFFFF).
          False if this entry contains a valid StrRef value.

  padding:
    seq:
      - id: padding_bytes
        type: u4
        repeat: expr
        repeat-expr: 3
        doc: |
          Reserved padding bytes. Always 3 uint32 values of 0xFFFFFFFF.
          Total size: 12 bytes (3 * 4 bytes).
          These bytes are unused but must be present for format compatibility.
          Each padding byte should be 0xFFFFFFFF (4294967295).

