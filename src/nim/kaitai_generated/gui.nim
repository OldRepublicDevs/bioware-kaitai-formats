import kaitai_struct_nim_runtime
import options
import gff

type
  Gui* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Gui], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gui

proc fileTypeValid*(this: Gui): bool
proc versionValid*(this: Gui): bool


##[
GUI (Graphical User Interface) files define UI layouts, controls, and properties.

This format inherits the complete GFF structure from gff.ksy.

GUI Root Struct Fields:
- CONTROLS (List): UI control elements (buttons, labels, listboxes, etc.)
- Each control contains:
  - CONTROLTYPE (Int32): Control type (button=4, label=5, listbox=9, etc.)
  - TAG (String): Control identifier
  - X, Y, WIDTH, HEIGHT (Int32): Position and size
  - TEXT (Struct): Text properties with STRREF, color, alignment
  - BORDER (Struct): Border properties
  - EXTENT (Struct): Dimensions
  - Various control-specific fields

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GUI.md

]##
proc read*(_: typedesc[Gui], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gui =
  template this: untyped = result
  this = new(Gui)
  let root = if root == nil: cast[Gui](this) else: cast[Gui](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Gui): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "GUI ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Gui): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Gui], filename: string): Gui =
  Gui.read(newKaitaiFileStream(filename), nil, nil)

