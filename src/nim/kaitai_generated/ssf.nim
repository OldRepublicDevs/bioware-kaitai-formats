import kaitai_struct_nim_runtime
import options

type
  Ssf* = ref object of KaitaiStruct
    `fileType`*: string
    `fileVersion`*: string
    `soundsOffset`*: uint32
    `padding`*: Ssf_Padding
    `parent`*: KaitaiStruct
    `soundsInst`: Ssf_SoundArray
    `soundsInstFlag`: bool
  Ssf_Padding* = ref object of KaitaiStruct
    `paddingBytes`*: seq[uint32]
    `parent`*: Ssf
  Ssf_SoundArray* = ref object of KaitaiStruct
    `entries`*: seq[Ssf_SoundEntry]
    `parent`*: Ssf
  Ssf_SoundEntry* = ref object of KaitaiStruct
    `strrefRaw`*: uint32
    `parent`*: Ssf_SoundArray
    `isNoSoundInst`: bool
    `isNoSoundInstFlag`: bool

proc read*(_: typedesc[Ssf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ssf
proc read*(_: typedesc[Ssf_Padding], io: KaitaiStream, root: KaitaiStruct, parent: Ssf): Ssf_Padding
proc read*(_: typedesc[Ssf_SoundArray], io: KaitaiStream, root: KaitaiStruct, parent: Ssf): Ssf_SoundArray
proc read*(_: typedesc[Ssf_SoundEntry], io: KaitaiStream, root: KaitaiStruct, parent: Ssf_SoundArray): Ssf_SoundEntry

proc sounds*(this: Ssf): Ssf_SoundArray
proc isNoSound*(this: Ssf_SoundEntry): bool


##[
SSF (Sound Set File) files store sound string references (StrRefs) for character voice sets.
Each SSF file contains exactly 28 sound slots, mapping to different game events and actions.

Binary Format:
- Header (12 bytes): File type signature, version, and offset to sounds array
- Sounds Array (112 bytes): 28 uint32 values representing StrRefs (0xFFFFFFFF = -1 = no sound)
- Padding (12 bytes): 3 uint32 values of 0xFFFFFFFF (reserved/unused)

Total file size: 136 bytes (12 + 112 + 12)

Sound Slots (in order):
0-5: Battle Cry 1-6
6-8: Select 1-3
9-11: Attack Grunt 1-3
12-13: Pain Grunt 1-2
14: Low Health
15: Dead
16: Critical Hit
17: Target Immune
18: Lay Mine
19: Disarm Mine
20: Begin Stealth
21: Begin Search
22: Begin Unlock
23: Unlock Failed
24: Unlock Success
25: Separated From Party
26: Rejoined Party
27: Poisoned

References:
- https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf_binary_reader.py
- https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf_binary_writer.py

]##
proc read*(_: typedesc[Ssf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ssf =
  template this: untyped = result
  this = new(Ssf)
  let root = if root == nil: cast[Ssf](this) else: cast[Ssf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  File type signature. Must be "SSF " (space-padded).
Bytes: 0x53 0x53 0x46 0x20

  ]##
  let fileTypeExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.fileType = fileTypeExpr

  ##[
  File format version. Always "V1.1" for KotOR SSF files.
Bytes: 0x56 0x31 0x2E 0x31

  ]##
  let fileVersionExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.fileVersion = fileVersionExpr

  ##[
  Byte offset to the sounds array from the beginning of the file.
Always 12 (0x0C) in valid SSF files, as the sounds array immediately follows the header.
This field exists for format consistency, though it's always the same value.

  ]##
  let soundsOffsetExpr = this.io.readU4le()
  this.soundsOffset = soundsOffsetExpr

  ##[
  Reserved padding bytes (12 bytes of 0xFFFFFFFF)
  ]##
  let paddingExpr = Ssf_Padding.read(this.io, this.root, this)
  this.padding = paddingExpr

proc sounds(this: Ssf): Ssf_SoundArray = 

  ##[
  Array of 28 sound string references (StrRefs)
  ]##
  if this.soundsInstFlag:
    return this.soundsInst
  let pos = this.io.pos()
  this.io.seek(int(this.soundsOffset))
  let soundsInstExpr = Ssf_SoundArray.read(this.io, this.root, this)
  this.soundsInst = soundsInstExpr
  this.io.seek(pos)
  this.soundsInstFlag = true
  return this.soundsInst

proc fromFile*(_: typedesc[Ssf], filename: string): Ssf =
  Ssf.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ssf_Padding], io: KaitaiStream, root: KaitaiStruct, parent: Ssf): Ssf_Padding =
  template this: untyped = result
  this = new(Ssf_Padding)
  let root = if root == nil: cast[Ssf](this) else: cast[Ssf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Reserved padding bytes. Always 3 uint32 values of 0xFFFFFFFF.
Total size: 12 bytes (3 * 4 bytes).
These bytes are unused but must be present for format compatibility.
Each padding byte should be 0xFFFFFFFF (4294967295).

  ]##
  for i in 0 ..< int(3):
    let it = this.io.readU4le()
    this.paddingBytes.add(it)

proc fromFile*(_: typedesc[Ssf_Padding], filename: string): Ssf_Padding =
  Ssf_Padding.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ssf_SoundArray], io: KaitaiStream, root: KaitaiStruct, parent: Ssf): Ssf_SoundArray =
  template this: untyped = result
  this = new(Ssf_SoundArray)
  let root = if root == nil: cast[Ssf](this) else: cast[Ssf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Array of exactly 28 sound entries, one for each SSFSound enum value.
Each entry is a uint32 representing a StrRef (string reference).
Value 0xFFFFFFFF (4294967295) represents -1 (no sound assigned).

Entry indices map to SSFSound enum:
- 0-5: Battle Cry 1-6
- 6-8: Select 1-3
- 9-11: Attack Grunt 1-3
- 12-13: Pain Grunt 1-2
- 14: Low Health
- 15: Dead
- 16: Critical Hit
- 17: Target Immune
- 18: Lay Mine
- 19: Disarm Mine
- 20: Begin Stealth
- 21: Begin Search
- 22: Begin Unlock
- 23: Unlock Failed
- 24: Unlock Success
- 25: Separated From Party
- 26: Rejoined Party
- 27: Poisoned

  ]##
  for i in 0 ..< int(28):
    let it = Ssf_SoundEntry.read(this.io, this.root, this)
    this.entries.add(it)

proc fromFile*(_: typedesc[Ssf_SoundArray], filename: string): Ssf_SoundArray =
  Ssf_SoundArray.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ssf_SoundEntry], io: KaitaiStream, root: KaitaiStruct, parent: Ssf_SoundArray): Ssf_SoundEntry =
  template this: untyped = result
  this = new(Ssf_SoundEntry)
  let root = if root == nil: cast[Ssf](this) else: cast[Ssf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Raw uint32 value representing the StrRef.
Value 0xFFFFFFFF (4294967295) represents -1 (no sound assigned).
All other values are valid StrRefs (typically 0-999999).
The conversion from 0xFFFFFFFF to -1 is handled by SSFBinaryReader.ReadInt32MaxNeg1().

  ]##
  let strrefRawExpr = this.io.readU4le()
  this.strrefRaw = strrefRawExpr

proc isNoSound(this: Ssf_SoundEntry): bool = 

  ##[
  True if this entry represents "no sound" (0xFFFFFFFF).
False if this entry contains a valid StrRef value.

  ]##
  if this.isNoSoundInstFlag:
    return this.isNoSoundInst
  let isNoSoundInstExpr = bool(this.strrefRaw == 4294967295'i64)
  this.isNoSoundInst = isNoSoundInstExpr
  this.isNoSoundInstFlag = true
  return this.isNoSoundInst

proc fromFile*(_: typedesc[Ssf_SoundEntry], filename: string): Ssf_SoundEntry =
  Ssf_SoundEntry.read(newKaitaiFileStream(filename), nil, nil)

