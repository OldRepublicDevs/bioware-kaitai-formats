import kaitai_struct_nim_runtime
import options

type
  Dds* = ref object of KaitaiStruct
    `magic`*: string
    `header`*: Dds_DdsHeader
    `biowareHeader`*: Dds_BiowareDdsHeader
    `pixelData`*: seq[uint8]
    `parent`*: KaitaiStruct
  Dds_BiowareDdsHeader* = ref object of KaitaiStruct
    `width`*: uint32
    `height`*: uint32
    `bytesPerPixel`*: uint32
    `dataSize`*: uint32
    `unusedFloat`*: float32
    `parent`*: Dds
  Dds_Ddpixelformat* = ref object of KaitaiStruct
    `size`*: uint32
    `flags`*: uint32
    `fourcc`*: string
    `rgbBitCount`*: uint32
    `rBitMask`*: uint32
    `gBitMask`*: uint32
    `bBitMask`*: uint32
    `aBitMask`*: uint32
    `parent`*: Dds_DdsHeader
  Dds_DdsHeader* = ref object of KaitaiStruct
    `size`*: uint32
    `flags`*: uint32
    `height`*: uint32
    `width`*: uint32
    `pitchOrLinearSize`*: uint32
    `depth`*: uint32
    `mipmapCount`*: uint32
    `reserved1`*: seq[uint32]
    `pixelFormat`*: Dds_Ddpixelformat
    `caps`*: uint32
    `caps2`*: uint32
    `caps3`*: uint32
    `caps4`*: uint32
    `reserved2`*: uint32
    `parent`*: Dds

proc read*(_: typedesc[Dds], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dds
proc read*(_: typedesc[Dds_BiowareDdsHeader], io: KaitaiStream, root: KaitaiStruct, parent: Dds): Dds_BiowareDdsHeader
proc read*(_: typedesc[Dds_Ddpixelformat], io: KaitaiStream, root: KaitaiStruct, parent: Dds_DdsHeader): Dds_Ddpixelformat
proc read*(_: typedesc[Dds_DdsHeader], io: KaitaiStream, root: KaitaiStruct, parent: Dds): Dds_DdsHeader



##[
DDS (DirectDraw Surface) files appear in two variants in KotOR:

1. Standard DirectX DDS: Header magic "DDS " (0x44445320), 124-byte header
2. BioWare DDS variant: No magic; width/height/bpp/dataSize leading integers

DDS files support DXT1/DXT3/DXT5 block compression, uncompressed RGB/RGBA,
and various other pixel formats. They can include mipmaps and cube maps.

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/DDS-File-Format.md - Complete DDS format documentation
- Standard DirectX DDS format specification

]##
proc read*(_: typedesc[Dds], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dds =
  template this: untyped = result
  this = new(Dds)
  let root = if root == nil: cast[Dds](this) else: cast[Dds](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  File magic. Either "DDS " (0x44445320) for standard DDS,
or check for BioWare variant (no magic, starts with width/height).

  ]##
  let magicExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.magic = magicExpr

  ##[
  Standard DDS header (124 bytes) - only present if magic is "DDS "
  ]##
  if this.magic == "DDS ":
    let headerExpr = Dds_DdsHeader.read(this.io, this.root, this)
    this.header = headerExpr

  ##[
  BioWare DDS variant header - only present if magic is not "DDS "
  ]##
  if this.magic != "DDS ":
    let biowareHeaderExpr = Dds_BiowareDdsHeader.read(this.io, this.root, this)
    this.biowareHeader = biowareHeaderExpr

  ##[
  Pixel data (compressed or uncompressed).
For standard DDS: Format determined by DDPIXELFORMAT
For BioWare DDS: DXT1 or DXT5 compressed data

  ]##
  block:
    var i: int
    while not this.io.isEof:
      let it = this.io.readU1()
      this.pixelData.add(it)
      inc i

proc fromFile*(_: typedesc[Dds], filename: string): Dds =
  Dds.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dds_BiowareDdsHeader], io: KaitaiStream, root: KaitaiStruct, parent: Dds): Dds_BiowareDdsHeader =
  template this: untyped = result
  this = new(Dds_BiowareDdsHeader)
  let root = if root == nil: cast[Dds](this) else: cast[Dds](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Image width in pixels (must be power of two, < 0x8000)
  ]##
  let widthExpr = this.io.readU4le()
  this.width = widthExpr

  ##[
  Image height in pixels (must be power of two, < 0x8000)
  ]##
  let heightExpr = this.io.readU4le()
  this.height = heightExpr

  ##[
  Bytes per pixel:
- 3 = DXT1 compression
- 4 = DXT5 compression

  ]##
  let bytesPerPixelExpr = this.io.readU4le()
  this.bytesPerPixel = bytesPerPixelExpr

  ##[
  Total compressed data size.
Must match (width*height)/2 for DXT1 or width*height for DXT5

  ]##
  let dataSizeExpr = this.io.readU4le()
  this.dataSize = dataSizeExpr

  ##[
  Unused float field (typically 0.0)
  ]##
  let unusedFloatExpr = this.io.readF4le()
  this.unusedFloat = unusedFloatExpr

proc fromFile*(_: typedesc[Dds_BiowareDdsHeader], filename: string): Dds_BiowareDdsHeader =
  Dds_BiowareDdsHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dds_Ddpixelformat], io: KaitaiStream, root: KaitaiStruct, parent: Dds_DdsHeader): Dds_Ddpixelformat =
  template this: untyped = result
  this = new(Dds_Ddpixelformat)
  let root = if root == nil: cast[Dds](this) else: cast[Dds](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Structure size (must be 32)
  ]##
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr

  ##[
  Pixel format flags:
- 0x00000001 = DDPF_ALPHAPIXELS
- 0x00000002 = DDPF_ALPHA
- 0x00000004 = DDPF_FOURCC
- 0x00000040 = DDPF_RGB
- 0x00000200 = DDPF_YUV
- 0x00080000 = DDPF_LUMINANCE

  ]##
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr

  ##[
  Four-character code for compressed formats:
- "DXT1" = DXT1 compression
- "DXT3" = DXT3 compression
- "DXT5" = DXT5 compression
- "    " = Uncompressed format

  ]##
  let fourccExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.fourcc = fourccExpr

  ##[
  Bits per pixel for uncompressed formats (16, 24, or 32)
  ]##
  let rgbBitCountExpr = this.io.readU4le()
  this.rgbBitCount = rgbBitCountExpr

  ##[
  Red channel bit mask (for uncompressed formats)
  ]##
  let rBitMaskExpr = this.io.readU4le()
  this.rBitMask = rBitMaskExpr

  ##[
  Green channel bit mask (for uncompressed formats)
  ]##
  let gBitMaskExpr = this.io.readU4le()
  this.gBitMask = gBitMaskExpr

  ##[
  Blue channel bit mask (for uncompressed formats)
  ]##
  let bBitMaskExpr = this.io.readU4le()
  this.bBitMask = bBitMaskExpr

  ##[
  Alpha channel bit mask (for uncompressed formats)
  ]##
  let aBitMaskExpr = this.io.readU4le()
  this.aBitMask = aBitMaskExpr

proc fromFile*(_: typedesc[Dds_Ddpixelformat], filename: string): Dds_Ddpixelformat =
  Dds_Ddpixelformat.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dds_DdsHeader], io: KaitaiStream, root: KaitaiStruct, parent: Dds): Dds_DdsHeader =
  template this: untyped = result
  this = new(Dds_DdsHeader)
  let root = if root == nil: cast[Dds](this) else: cast[Dds](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Header size (must be 124)
  ]##
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr

  ##[
  DDS flags bitfield:
- 0x00001007 = DDSD_CAPS | DDSD_HEIGHT | DDSD_WIDTH | DDSD_PIXELFORMAT
- 0x00020000 = DDSD_MIPMAPCOUNT (if mipmaps present)

  ]##
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr

  ##[
  Image height in pixels
  ]##
  let heightExpr = this.io.readU4le()
  this.height = heightExpr

  ##[
  Image width in pixels
  ]##
  let widthExpr = this.io.readU4le()
  this.width = widthExpr

  ##[
  Pitch (uncompressed) or linear size (compressed).
For compressed formats: total size of all mip levels

  ]##
  let pitchOrLinearSizeExpr = this.io.readU4le()
  this.pitchOrLinearSize = pitchOrLinearSizeExpr

  ##[
  Depth for volume textures (usually 0 for 2D textures)
  ]##
  let depthExpr = this.io.readU4le()
  this.depth = depthExpr

  ##[
  Number of mipmap levels (0 or 1 = no mipmaps)
  ]##
  let mipmapCountExpr = this.io.readU4le()
  this.mipmapCount = mipmapCountExpr

  ##[
  Reserved fields (unused)
  ]##
  for i in 0 ..< int(11):
    let it = this.io.readU4le()
    this.reserved1.add(it)

  ##[
  Pixel format structure
  ]##
  let pixelFormatExpr = Dds_Ddpixelformat.read(this.io, this.root, this)
  this.pixelFormat = pixelFormatExpr

  ##[
  Capability flags:
- 0x00001000 = DDSCAPS_TEXTURE
- 0x00000008 = DDSCAPS_MIPMAP
- 0x00000200 = DDSCAPS2_CUBEMAP

  ]##
  let capsExpr = this.io.readU4le()
  this.caps = capsExpr

  ##[
  Additional capability flags:
- 0x00000200 = DDSCAPS2_CUBEMAP
- 0x00000FC00 = Cube map face flags

  ]##
  let caps2Expr = this.io.readU4le()
  this.caps2 = caps2Expr

  ##[
  Reserved capability flags
  ]##
  let caps3Expr = this.io.readU4le()
  this.caps3 = caps3Expr

  ##[
  Reserved capability flags
  ]##
  let caps4Expr = this.io.readU4le()
  this.caps4 = caps4Expr

  ##[
  Reserved field
  ]##
  let reserved2Expr = this.io.readU4le()
  this.reserved2 = reserved2Expr

proc fromFile*(_: typedesc[Dds_DdsHeader], filename: string): Dds_DdsHeader =
  Dds_DdsHeader.read(newKaitaiFileStream(filename), nil, nil)

