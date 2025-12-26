import kaitai_struct_nim_runtime
import options

type
  Ltr* = ref object of KaitaiStruct
    `fileType`*: string
    `fileVersion`*: string
    `letterCount`*: uint8
    `singleLetterBlock`*: Ltr_LetterBlock
    `doubleLetterBlocks`*: Ltr_DoubleLetterBlocksArray
    `tripleLetterBlocks`*: Ltr_TripleLetterBlocksArray
    `parent`*: KaitaiStruct
  Ltr_DoubleLetterBlocksArray* = ref object of KaitaiStruct
    `blocks`*: seq[Ltr_LetterBlock]
    `parent`*: Ltr
  Ltr_LetterBlock* = ref object of KaitaiStruct
    `startProbabilities`*: seq[float32]
    `middleProbabilities`*: seq[float32]
    `endProbabilities`*: seq[float32]
    `parent`*: KaitaiStruct
  Ltr_TripleLetterBlocksArray* = ref object of KaitaiStruct
    `rows`*: seq[Ltr_TripleLetterRow]
    `parent`*: Ltr
  Ltr_TripleLetterRow* = ref object of KaitaiStruct
    `blocks`*: seq[Ltr_LetterBlock]
    `parent`*: Ltr_TripleLetterBlocksArray

proc read*(_: typedesc[Ltr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ltr
proc read*(_: typedesc[Ltr_DoubleLetterBlocksArray], io: KaitaiStream, root: KaitaiStruct, parent: Ltr): Ltr_DoubleLetterBlocksArray
proc read*(_: typedesc[Ltr_LetterBlock], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ltr_LetterBlock
proc read*(_: typedesc[Ltr_TripleLetterBlocksArray], io: KaitaiStream, root: KaitaiStruct, parent: Ltr): Ltr_TripleLetterBlocksArray
proc read*(_: typedesc[Ltr_TripleLetterRow], io: KaitaiStream, root: KaitaiStruct, parent: Ltr_TripleLetterBlocksArray): Ltr_TripleLetterRow



##[
LTR (Letter) resources store third-order Markov chain probability tables that the game uses
to procedurally generate NPC names. The data encodes likelihoods for characters appearing at
the start, middle, and end of names given zero, one, or two-character context.

KotOR always uses the 28-character alphabet (a-z plus ' and -). Neverwinter Nights (NWN) used
26 characters; the header explicitly stores the count. This is a KotOR-specific difference from NWN.

LTR files are binary and consist of a short header followed by three probability tables
(singles, doubles, triples) stored as contiguous float arrays.

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/LTR-File-Format.md
- https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/ltrreader.cpp:27-74
- https://github.com/xoreos/xoreos/blob/master/src/aurora/ltrfile.cpp:135-168
- https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/LTRObject.ts:61-117

]##
proc read*(_: typedesc[Ltr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ltr =
  template this: untyped = result
  this = new(Ltr)
  let root = if root == nil: cast[Ltr](this) else: cast[Ltr](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  File type signature. Must be "LTR " (space-padded) for LTR files.
  ]##
  let fileTypeExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.fileType = fileTypeExpr

  ##[
  File format version. Must be "V1.0" for LTR files.
  ]##
  let fileVersionExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.fileVersion = fileVersionExpr

  ##[
  Number of characters in the alphabet. Must be 26 (NWN) or 28 (KotOR).
KotOR uses 28 characters: "abcdefghijklmnopqrstuvwxyz'-"
NWN uses 26 characters: "abcdefghijklmnopqrstuvwxyz"

  ]##
  let letterCountExpr = this.io.readU1()
  this.letterCount = letterCountExpr

  ##[
  Single-letter probability block (no context).
Used for generating the first character of names.
Contains start/middle/end probability arrays, each with letter_count floats.
Total size: letter_count × 3 × 4 bytes = 336 bytes for KotOR (28 chars).

  ]##
  let singleLetterBlockExpr = Ltr_LetterBlock.read(this.io, this.root, this)
  this.singleLetterBlock = singleLetterBlockExpr

  ##[
  Double-letter probability blocks (1-character context).
Array of letter_count blocks, each indexed by the previous character.
Used for generating the second character based on the first character.
Each block contains start/middle/end probability arrays.
Total size: letter_count × 3 × letter_count × 4 bytes = 9,408 bytes for KotOR.

  ]##
  let doubleLetterBlocksExpr = Ltr_DoubleLetterBlocksArray.read(this.io, this.root, this)
  this.doubleLetterBlocks = doubleLetterBlocksExpr

  ##[
  Triple-letter probability blocks (2-character context).
Two-dimensional array of letter_count × letter_count blocks.
Each block is indexed by the previous two characters.
Used for generating third and subsequent characters.
Each block contains start/middle/end probability arrays.
Total size: letter_count × letter_count × 3 × letter_count × 4 bytes = 73,472 bytes for KotOR.

  ]##
  let tripleLetterBlocksExpr = Ltr_TripleLetterBlocksArray.read(this.io, this.root, this)
  this.tripleLetterBlocks = tripleLetterBlocksExpr

proc fromFile*(_: typedesc[Ltr], filename: string): Ltr =
  Ltr.read(newKaitaiFileStream(filename), nil, nil)


##[
Array of double-letter blocks. One block per character in the alphabet.
Each block is indexed by the previous character (context length 1).

]##
proc read*(_: typedesc[Ltr_DoubleLetterBlocksArray], io: KaitaiStream, root: KaitaiStruct, parent: Ltr): Ltr_DoubleLetterBlocksArray =
  template this: untyped = result
  this = new(Ltr_DoubleLetterBlocksArray)
  let root = if root == nil: cast[Ltr](this) else: cast[Ltr](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Array of letter_count blocks, each containing start/middle/end probability arrays.
Block index corresponds to the previous character in the alphabet.

  ]##
  for i in 0 ..< int(Ltr(this.root).letterCount):
    let it = Ltr_LetterBlock.read(this.io, this.root, this)
    this.blocks.add(it)

proc fromFile*(_: typedesc[Ltr_DoubleLetterBlocksArray], filename: string): Ltr_DoubleLetterBlocksArray =
  Ltr_DoubleLetterBlocksArray.read(newKaitaiFileStream(filename), nil, nil)


##[
A probability block containing three arrays of probabilities (start, middle, end).
Each array has letter_count floats representing cumulative probabilities for each character
in the alphabet appearing at that position (start, middle, or end of name).

Blocks store cumulative probabilities (monotonically increasing floats) that are compared
against random roll values during name generation.

]##
proc read*(_: typedesc[Ltr_LetterBlock], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ltr_LetterBlock =
  template this: untyped = result
  this = new(Ltr_LetterBlock)
  let root = if root == nil: cast[Ltr](this) else: cast[Ltr](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Array of start probabilities. One float per character in alphabet.
Probability of each letter starting a name (no context for singles,
after previous character for doubles, after previous two for triples).

  ]##
  for i in 0 ..< int(Ltr(this.root).letterCount):
    let it = this.io.readF4le()
    this.startProbabilities.add(it)

  ##[
  Array of middle probabilities. One float per character in alphabet.
Probability of each letter appearing in the middle of a name.

  ]##
  for i in 0 ..< int(Ltr(this.root).letterCount):
    let it = this.io.readF4le()
    this.middleProbabilities.add(it)

  ##[
  Array of end probabilities. One float per character in alphabet.
Probability of each letter ending a name.

  ]##
  for i in 0 ..< int(Ltr(this.root).letterCount):
    let it = this.io.readF4le()
    this.endProbabilities.add(it)

proc fromFile*(_: typedesc[Ltr_LetterBlock], filename: string): Ltr_LetterBlock =
  Ltr_LetterBlock.read(newKaitaiFileStream(filename), nil, nil)


##[
Two-dimensional array of triple-letter blocks. letter_count × letter_count blocks total.
Each block is indexed by the previous two characters (context length 2).

]##
proc read*(_: typedesc[Ltr_TripleLetterBlocksArray], io: KaitaiStream, root: KaitaiStruct, parent: Ltr): Ltr_TripleLetterBlocksArray =
  template this: untyped = result
  this = new(Ltr_TripleLetterBlocksArray)
  let root = if root == nil: cast[Ltr](this) else: cast[Ltr](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Array of letter_count rows, each containing letter_count blocks.
First index corresponds to the second-to-last character.
Second index corresponds to the last character.

  ]##
  for i in 0 ..< int(Ltr(this.root).letterCount):
    let it = Ltr_TripleLetterRow.read(this.io, this.root, this)
    this.rows.add(it)

proc fromFile*(_: typedesc[Ltr_TripleLetterBlocksArray], filename: string): Ltr_TripleLetterBlocksArray =
  Ltr_TripleLetterBlocksArray.read(newKaitaiFileStream(filename), nil, nil)


##[
A row in the triple-letter blocks array. Contains letter_count blocks,
each indexed by the last character in the two-character context.

]##
proc read*(_: typedesc[Ltr_TripleLetterRow], io: KaitaiStream, root: KaitaiStruct, parent: Ltr_TripleLetterBlocksArray): Ltr_TripleLetterRow =
  template this: untyped = result
  this = new(Ltr_TripleLetterRow)
  let root = if root == nil: cast[Ltr](this) else: cast[Ltr](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Array of letter_count blocks, each containing start/middle/end probability arrays.
Block index corresponds to the last character in the two-character context.

  ]##
  for i in 0 ..< int(Ltr(this.root).letterCount):
    let it = Ltr_LetterBlock.read(this.io, this.root, this)
    this.blocks.add(it)

proc fromFile*(_: typedesc[Ltr_TripleLetterRow], filename: string): Ltr_TripleLetterRow =
  Ltr_TripleLetterRow.read(newKaitaiFileStream(filename), nil, nil)

