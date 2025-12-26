import kaitai_struct_nim_runtime
import options
import gff

type
  Pt* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Pt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Pt

proc fileTypeValid*(this: Pt): bool
proc versionValid*(this: Pt): bool


##[
PT (Party Table) files are GFF-based format files that store party and game state information
for Odyssey Engine games (KotOR and KotOR 2). PT files use the GFF (Generic File Format) binary
structure with file type signature "PT  ".

This format inherits the complete GFF structure from gff.ksy and adds PT-specific
validation and documentation.

PT files are typically named "PARTYTABLE.res" and are stored in savegame.sav ERF archives.
They contain comprehensive party and game state information including:
- Party composition (current members, available NPCs, leader)
- Resources (gold/credits, XP pool, components, chemicals)
- Journal entries with states, dates, and times
- Pazaak cards and side decks for the mini-game
- UI state (last panel, messages, tutorial windows shown)
- AI state (follow mode, AI enabled, solo mode)
- K2-specific: Influence values per companion

PT Root Struct Fields (Common):
- "PT_PCNAME" (String): Player character name
- "PT_GOLD" (Int32): Credits/gold amount
- "PT_XP_POOL" (Int32): Experience points
- "PT_PLAYEDSECONDS" (UInt32): Total playtime in seconds
- "PT_NUM_MEMBERS" (Int32): Party member count
- "PT_CONTROLLED_NPC", "PT_SOLOMODE", "PT_AISTATE", "PT_FOLLOWSTATE" (Int32): AI/party state
- "PT_MEMBERS" (List): Party member ResRefs and leader flags
- "PT_AVAIL_NPCS" (List): Available NPCs for recruitment
- "PT_INFLUENCE" (List): Influence values (KotOR 2 only)
- "PT_PAZAAKCARDS", "PT_PAZSIDELIST" (List): Pazaak card collections
- Journal/message lists: "PT_FB_MSG_LIST", "PT_DLG_MSG_LIST", "PT_COM_MSG_LIST"

Based on swkotor2.exe: SavePartyTable @ 0x0057bd70

References:
- https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/extract/savedata.py
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PT.md
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md

]##
proc read*(_: typedesc[Pt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Pt =
  template this: untyped = result
  this = new(Pt)
  let root = if root == nil: cast[Pt](this) else: cast[Pt](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Complete GFF structure. PT files use standard GFF format with "PT  " file type.
Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.

  ]##
  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Pt): bool = 

  ##[
  Validates that this is a PT file (file type must be "PT  ")
  ]##
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "PT  ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Pt): bool = 

  ##[
  Validates GFF version is supported
  ]##
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Pt], filename: string): Pt =
  Pt.read(newKaitaiFileStream(filename), nil, nil)

