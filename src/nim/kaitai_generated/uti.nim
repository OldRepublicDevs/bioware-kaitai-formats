import kaitai_struct_nim_runtime
import options
import gff

type
  Uti* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Uti], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Uti

proc fileTypeValid*(this: Uti): bool
proc versionValid*(this: Uti): bool


##[
UTI (Item Template) files define item properties, stats, and behavior.

This format inherits the complete GFF structure from gff.ksy.

UTI Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Item name
- Description (LocalizedString): Item description
- BaseItem (Int32): Base item type (baseitems.2da)
- Cost, StackSize, Charges: Item economics
- ModelVariation, TextureVar, BodyVariation: Item appearance
- PropertiesList (List): Item properties (damage, attack bonus, etc.)

]##
proc read*(_: typedesc[Uti], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Uti =
  template this: untyped = result
  this = new(Uti)
  let root = if root == nil: cast[Uti](this) else: cast[Uti](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Uti): bool = 
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "UTI ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Uti): bool = 
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Uti], filename: string): Uti =
  Uti.read(newKaitaiFileStream(filename), nil, nil)

