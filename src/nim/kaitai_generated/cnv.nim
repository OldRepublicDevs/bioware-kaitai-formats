import kaitai_struct_nim_runtime
import options
import gff

type
  Cnv* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Cnv], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Cnv

proc fileTypeValid*(this: Cnv): bool
proc versionValid*(this: Cnv): bool


##[
CNV (Conversation) files are GFF-based format files that store conversation trees with entries, replies,
links, and conversation metadata. CNV files use the GFF (Generic File Format) binary structure
with file type signature "CNV ".

This format inherits the complete GFF structure from gff.ksy and adds CNV-specific
validation and documentation.

CNV files are used by Eclipse Engine games (Dragon Age Origins, Dragon Age 2, Mass Effect, Mass Effect 2).
They are similar to DLG files used by Odyssey and Aurora engines but adapted for Eclipse's conversation system.

CNV Root Struct Fields:
- NumWords (Int32): Word count for conversation
- Skippable (UInt8): Whether conversation can be skipped
- ConversationType (Int32): Conversation type identifier
- EntryList (List): NPC dialogue lines (CNVEntry structs)
- ReplyList (List): Player response options (CNVReply structs)
- StartingList (List): Entry points (CNVLink structs)
- StuntList (List): Special animations (CNVStunt structs)

Each Entry/Reply contains:
- Text (LocalizedString): Dialogue text
- Script (ResRef): Conditional/action scripts
- Camera settings, animations, links to other nodes

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-CNV.md
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md

]##
proc read*(_: typedesc[Cnv], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Cnv =
  template this: untyped = result
  this = new(Cnv)
  let root = if root == nil: cast[Cnv](this) else: cast[Cnv](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Complete GFF structure. CNV files use standard GFF format with "CNV " file type.
Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.

  ]##
  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Cnv): bool = 

  ##[
  Validates that this is a CNV file (file type must be "CNV ")
  ]##
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "CNV ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Cnv): bool = 

  ##[
  Validates GFF version is supported
  ]##
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Cnv], filename: string): Cnv =
  Cnv.read(newKaitaiFileStream(filename), nil, nil)

