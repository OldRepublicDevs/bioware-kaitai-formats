import kaitai_struct_nim_runtime
import options

type
  Bzf* = ref object of KaitaiStruct
    `fileType`*: string
    `version`*: string
    `compressedData`*: seq[uint8]
    `parent`*: KaitaiStruct

proc read*(_: typedesc[Bzf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bzf



##[
BZF (BioWare Zipped File) files are LZMA-compressed BIF files used primarily in iOS
(and maybe Android) ports of KotOR. The BZF header contains "BZF " + "V1.0", followed
by LZMA-compressed BIF data. Decompression reveals a standard BIF structure.

Format Structure:
- Header (8 bytes): File type signature "BZF " and version "V1.0"
- Compressed Data: LZMA-compressed BIF file data

After decompression, the data follows the standard BIF format structure.

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/BIF-File-Format.md - BZF compression section
- BIF.ksy - Standard BIF format (decompressed BZF data matches this)

]##
proc read*(_: typedesc[Bzf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bzf =
  template this: untyped = result
  this = new(Bzf)
  let root = if root == nil: cast[Bzf](this) else: cast[Bzf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  File type signature. Must be "BZF " for compressed BIF files.
  ]##
  let fileTypeExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.fileType = fileTypeExpr

  ##[
  File format version. Always "V1.0" for BZF files.
  ]##
  let versionExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.version = versionExpr

  ##[
  LZMA-compressed BIF file data.
This data must be decompressed using LZMA algorithm to obtain the standard BIF structure.
After decompression, the data can be parsed using the BIF format definition.

  ]##
  block:
    var i: int
    while not this.io.isEof:
      let it = this.io.readU1()
      this.compressedData.add(it)
      inc i

proc fromFile*(_: typedesc[Bzf], filename: string): Bzf =
  Bzf.read(newKaitaiFileStream(filename), nil, nil)

