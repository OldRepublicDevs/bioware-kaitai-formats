import kaitai_struct_nim_runtime
import options
import gff

type
  Pth* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Pth], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Pth

proc fileTypeValid*(this: Pth): bool
proc versionValid*(this: Pth): bool


##[
PTH (Path/Pathfinding) files store pathfinding waypoint graphs for AI navigation.

This format inherits the complete GFF structure from gff.ksy.

PTH Root Struct Fields:
- Path_Points (List): Waypoint positions (X, Y coordinates)
- Connections (List): Connections between waypoints

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PTH.md
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
- https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/pth.py

]##
proc read*(_: typedesc[Pth], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Pth =
  template this: untyped = result
  this = new(Pth)
  let root = if root == nil: cast[Pth](this) else: cast[Pth](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Pth): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "PTH ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Pth): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Pth], filename: string): Pth =
  Pth.read(newKaitaiFileStream(filename), nil, nil)

