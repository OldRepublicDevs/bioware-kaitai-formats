import kaitai_struct_nim_runtime
import options

type
  Lip* = ref object of KaitaiStruct
    `fileType`*: string
    `fileVersion`*: string
    `length`*: float32
    `numKeyframes`*: uint32
    `keyframes`*: seq[Lip_KeyframeEntry]
    `parent`*: KaitaiStruct
  Lip_LipShapes* = enum
    neutral = 0
    ee = 1
    eh = 2
    ah = 3
    oh = 4
    ooh = 5
    y = 6
    sts = 7
    fv = 8
    ng = 9
    th = 10
    mpb = 11
    td = 12
    sh = 13
    l = 14
    kg = 15
  Lip_KeyframeEntry* = ref object of KaitaiStruct
    `timestamp`*: float32
    `shape`*: Lip_LipShapes
    `parent`*: Lip

proc read*(_: typedesc[Lip], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Lip
proc read*(_: typedesc[Lip_KeyframeEntry], io: KaitaiStream, root: KaitaiStruct, parent: Lip): Lip_KeyframeEntry



##[
LIP (LIP Synchronization) files drive mouth animation for voiced dialogue in BioWare games.
Each file contains a compact series of keyframes that map timestamps to discrete viseme
(mouth shape) indices so that the engine can interpolate character lip movement while
playing the companion WAV audio line.

LIP files are always binary and contain only animation data. They are paired with WAV
voice-over resources of identical duration; the LIP length field must match the WAV
playback time for glitch-free animation.

Keyframes are sorted chronologically and store a timestamp (float seconds) plus a
1-byte viseme index (0-15). The format uses the 16-shape Preston Blair phoneme set.

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/LIP-File-Format.md
- https://github.com/seedhartha/reone/blob/master/src/libs/graphics/format/lipreader.cpp:27-42
- https://github.com/xoreos/xoreos/blob/master/src/graphics/aurora/lipfile.cpp
- https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/LIPObject.ts:93-146

]##
proc read*(_: typedesc[Lip], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Lip =
  template this: untyped = result
  this = new(Lip)
  let root = if root == nil: cast[Lip](this) else: cast[Lip](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  File type signature. Must be "LIP " (space-padded) for LIP files.
  ]##
  let fileTypeExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.fileType = fileTypeExpr

  ##[
  File format version. Must be "V1.0" for LIP files.
  ]##
  let fileVersionExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.fileVersion = fileVersionExpr

  ##[
  Duration in seconds. Must equal the paired WAV file playback time for
glitch-free animation. This is the total length of the lip sync animation.

  ]##
  let lengthExpr = this.io.readF4le()
  this.length = lengthExpr

  ##[
  Number of keyframes immediately following. Each keyframe contains a timestamp
and a viseme shape index. Keyframes should be sorted ascending by timestamp.

  ]##
  let numKeyframesExpr = this.io.readU4le()
  this.numKeyframes = numKeyframesExpr

  ##[
  Array of keyframe entries. Each entry maps a timestamp to a mouth shape.
Entries must be stored in chronological order (ascending by timestamp).

  ]##
  for i in 0 ..< int(this.numKeyframes):
    let it = Lip_KeyframeEntry.read(this.io, this.root, this)
    this.keyframes.add(it)

proc fromFile*(_: typedesc[Lip], filename: string): Lip =
  Lip.read(newKaitaiFileStream(filename), nil, nil)


##[
A single keyframe entry mapping a timestamp to a viseme (mouth shape).
Keyframes are used by the engine to interpolate between mouth shapes during
audio playback to create lip sync animation.

]##
proc read*(_: typedesc[Lip_KeyframeEntry], io: KaitaiStream, root: KaitaiStruct, parent: Lip): Lip_KeyframeEntry =
  template this: untyped = result
  this = new(Lip_KeyframeEntry)
  let root = if root == nil: cast[Lip](this) else: cast[Lip](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Seconds from animation start. Must be >= 0 and <= length.
Keyframes should be sorted ascending by timestamp.

  ]##
  let timestampExpr = this.io.readF4le()
  this.timestamp = timestampExpr

  ##[
  Viseme index (0-15) indicating which mouth shape to use at this timestamp.
Uses the 16-shape Preston Blair phoneme set. See lip_shapes enum for details.

  ]##
  let shapeExpr = Lip_LipShapes(this.io.readU1())
  this.shape = shapeExpr

proc fromFile*(_: typedesc[Lip_KeyframeEntry], filename: string): Lip_KeyframeEntry =
  Lip_KeyframeEntry.read(newKaitaiFileStream(filename), nil, nil)

