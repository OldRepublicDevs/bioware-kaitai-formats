import kaitai_struct_nim_runtime
import options
import gff

type
  Git* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Git], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Git

proc fileTypeValid*(this: Git): bool
proc versionValid*(this: Git): bool


##[
GIT (Game Instance Template) files store dynamic area instance data including
placed creatures, placeables, doors, triggers, waypoints, sounds, stores, and encounters.

This format inherits the complete GFF structure from gff.ksy.

GIT Root Struct Fields:
- CreatureList (List): Placed creatures with positions, orientations
- DoorList (List): Placed doors with states, scripts
- PlaceableList (List): Placed placeables (chests, etc.)
- TriggerList (List): Trigger zones
- WaypointList (List): Navigation waypoints
- SoundList (List): Ambient sounds
- StoreList (List): Merchant shops
- EncounterList (List): Spawn encounters
- CameraList (List): Camera points

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GIT.md

]##
proc read*(_: typedesc[Git], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Git =
  template this: untyped = result
  this = new(Git)
  let root = if root == nil: cast[Git](this) else: cast[Git](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Git): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "GIT ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Git): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Git], filename: string): Git =
  Git.read(newKaitaiFileStream(filename), nil, nil)

