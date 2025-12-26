import kaitai_struct_nim_runtime
import options
import gff

type
  Dlg* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Dlg], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dlg

proc fileTypeValid*(this: Dlg): bool
proc versionValid*(this: Dlg): bool


##[
DLG (Dialogue) files are GFF-based format files that store conversation trees with entries, replies,
links, and conversation metadata for Odyssey and Aurora engines.

This format inherits the complete GFF structure from gff.ksy and adds DLG-specific
validation and documentation.

DLG files contain:
- Root struct with conversation metadata (NumWords, Skippable, ConversationType, etc.)
- EntryList: Array of dialogue entries (NPC lines)
- ReplyList: Array of reply options (player responses)
- StartingList: Array of entry points into conversation tree
- StuntList: Array of cutscene/animation sequences

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-DLG.md
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/dlg/

]##
proc read*(_: typedesc[Dlg], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dlg =
  template this: untyped = result
  this = new(Dlg)
  let root = if root == nil: cast[Dlg](this) else: cast[Dlg](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Complete GFF structure with "DLG " file type
  ]##
  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Dlg): bool = 

  ##[
  Validates DLG file type
  ]##
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "DLG ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Dlg): bool = 

  ##[
  Validates GFF version
  ]##
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Dlg], filename: string): Dlg =
  Dlg.read(newKaitaiFileStream(filename), nil, nil)

