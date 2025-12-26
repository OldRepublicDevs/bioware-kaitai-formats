import kaitai_struct_nim_runtime
import options
import gff

type
  Fac* = ref object of KaitaiStruct
    `gffData`*: Gff
    `parent`*: KaitaiStruct
    `fileTypeValidInst`: bool
    `fileTypeValidInstFlag`: bool
    `versionValidInst`: bool
    `versionValidInstFlag`: bool

proc read*(_: typedesc[Fac], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Fac

proc fileTypeValid*(this: Fac): bool
proc versionValid*(this: Fac): bool


##[
FAC (Faction) files are GFF-based format files that store faction relationships,
reputation values, and faction metadata.

This format inherits the complete GFF structure from gff.ksy and adds FAC-specific
validation and documentation.

FAC Root Struct Fields:
- FactionName (String): Faction identifier
- FactionParentID (UInt16): Parent faction ID
- FactionGlobal (UInt16): Global faction flag
- RepList (List): Reputation values with other factions
  - FactionID (UInt32): Target faction ID
  - FactionRep (UInt32): Reputation value (0-100)

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-FAC.md
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
- https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/fac.py

]##
proc read*(_: typedesc[Fac], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Fac =
  template this: untyped = result
  this = new(Fac)
  let root = if root == nil: cast[Fac](this) else: cast[Fac](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Complete GFF structure with "FAC " file type
  ]##
  let gffDataExpr = Gff.read(this.io, nil, nil)
  this.gffData = gffDataExpr

proc fileTypeValid(this: Fac): bool = 

  ##[
  Validates FAC file type
  ]##
  if this.fileTypeValidInstFlag:
    return this.fileTypeValidInst
  let fileTypeValidInstExpr = bool(this.gffData.header.fileType == "FAC ")
  this.fileTypeValidInst = fileTypeValidInstExpr
  this.fileTypeValidInstFlag = true
  return this.fileTypeValidInst

proc versionValid(this: Fac): bool = 

  ##[
  Validates GFF version
  ]##
  if this.versionValidInstFlag:
    return this.versionValidInst
  let versionValidInstExpr = bool( ((this.gffData.header.fileVersion == "V3.2") or (this.gffData.header.fileVersion == "V3.3") or (this.gffData.header.fileVersion == "V4.0") or (this.gffData.header.fileVersion == "V4.1")) )
  this.versionValidInst = versionValidInstExpr
  this.versionValidInstFlag = true
  return this.versionValidInst

proc fromFile*(_: typedesc[Fac], filename: string): Fac =
  Fac.read(newKaitaiFileStream(filename), nil, nil)

