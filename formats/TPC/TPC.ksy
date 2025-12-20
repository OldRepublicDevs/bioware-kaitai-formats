meta:
  id: tpc
  title: BioWare TPC (Texture Pack Container) File Format
  license: MIT
  endian: le
  file-extension:
    - tpc
  xref:
    pykotor: vendor/PyKotor/Libraries/PyKotor/src/pykotor/resource/formats/tpc/
    reone: vendor/reone/src/libs/graphics/format/tpcreader.cpp
    xoreos: vendor/xoreos/src/graphics/images/tpc.cpp
    kotor_js: vendor/KotOR.js/src/resource/TPCObject.ts
    kotor_unity: vendor/KotOR-Unity/Assets/Scripts/FileObjects/TextureResource.cs
    northernlights: vendor/NorthernLights/src/Graphics/Textures/TPC.cs
    tga2tpc: vendor/tga2tpc
    xoreos_tools: vendor/xoreos-tools/src/images/tpc.cpp
    wiki: vendor/PyKotor/wiki/TPC-File-Format.md
doc: |
  TPC (Texture Pack Container) is KotOR's native texture format. It supports paletteless RGB/RGBA,
  greyscale, and block-compressed DXT1/DXT3/DXT5 data, optional mipmaps, cube maps, and flipbook
  animations controlled by companion TXI files.

  File Structure:
  - Offset 0x00 (4 bytes): data_size (0 for uncompressed RGB; compressed textures store total bytes)
  - Offset 0x04 (4 bytes): alpha_test/threshold (float)
  - Offset 0x08 (2 bytes): Width (uint16)
  - Offset 0x0A (2 bytes): Height (uint16)
  - Offset 0x0C (1 byte): Pixel encoding flag
  - Offset 0x0D (1 byte): Mipmap count
  - Offset 0x0E (114 bytes): Reserved/padding
  - Offset 0x80: Texture data (per layer, per mipmap)
  - Optional: ASCII TXI footer

  This layout is identical across PyKotor, Reone, Xoreos, KotOR.js, and the original Bioware tools;
  KotOR-Unity and NorthernLights consume the same header.

  Pixel Formats:
  TPC supports the following encodings:
  - 0x01 (Greyscale): 8-bit luminance, stored as linear bytes
  - 0x02 (RGB): 24-bit RGB, linear bytes, may be swizzled on Xbox
  - 0x04 (RGBA): 32-bit RGBA, linear bytes
  - 0x0C (BGRA): 32-bit BGRA swizzled, Xbox-specific swizzle; PyKotor deswizzles on load
  - DXT1: Block-compressed (4×4 blocks, 8 bytes), detected via data_size and encoding flags
  - DXT3/DXT5: Block-compressed (4×4 blocks, 16 bytes), chosen based on pixel_type and compression flag

  Mipmaps, Layers, and Animation:
  - Each texture can have multiple layers (used for cube maps or animated flipbooks)
  - Every layer stores mipmap_count levels. For uncompressed textures, each level's size equals
    width × height × bytes_per_pixel; for DXT formats it equals the block size calculation
  - Animated textures rely on TXI fields (proceduretype cycle, numx, numy, fps). PyKotor splits
    the sprite sheet into layers and recalculates mip counts per frame

  Cube Maps:
  - Detected when the stored height is exactly six times the width for compressed textures (DXT1/DXT5)
  - PyKotor normalizes cube faces after reading (deswizzle + rotation) so that face ordering matches
    the high-level texture API
  - Reone and KotOR.js use the same inference logic

  TXI Metadata:
  - If bytes remain after the texture payload, they are treated as ASCII TXI content
  - TXI commands drive animations, environment mapping, font metrics, downsampling directives, etc.
  - PyKotor automatically parses the TXI footer and exposes TPC.txi plus convenience flags
    (is_animated, is_cube_map)

  References:
  - vendor/PyKotor/wiki/TPC-File-Format.md - Complete TPC format documentation
  - vendor/reone/src/libs/graphics/format/tpcreader.cpp - Complete C++ TPC decoder with DXT decompression
  - vendor/xoreos/src/graphics/images/tpc.cpp - Generic Aurora TPC implementation (shared format)
  - vendor/KotOR.js/src/resource/TPCObject.ts - TypeScript TPC loader with WebGL texture upload
  - vendor/KotOR-Unity/Assets/Scripts/FileObjects/TextureResource.cs - C# Unity TPC loader with cube map support
  - vendor/NorthernLights/src/Graphics/Textures/TPC.cs - .NET TPC reader with animation support
  - vendor/tga2tpc - Standalone TGA to TPC conversion tool
  - vendor/xoreos-tools/src/images/tpc.cpp - Command-line TPC extraction and conversion
  - Libraries/PyKotor/src/pykotor/resource/formats/tpc/io_tpc.py:112-167 - PyKotor binary reader/writer
  - Libraries/PyKotor/src/pykotor/resource/formats/tpc/tpc_data.py:54-178 - TPC data model & conversion utilities

seq:
  - id: header
    type: tpc_header
    doc: TPC file header (128 bytes total)

  - id: texture_data
    type: texture_data_section
    doc: Texture pixel data (compressed or uncompressed) for all layers and mipmaps

  - id: txi_footer
    type: txi_footer_section
    if: _io.pos < _io.size
    doc: Optional ASCII TXI metadata appended after texture data

types:
  tpc_header:
    seq:
      - id: data_size
        type: u4
        doc: |
          Total compressed payload size. If non-zero, texture is compressed (DXT).
          If zero, texture is uncompressed and size is derived from format/width/height.

      - id: alpha_test
        type: f4
        doc: |
          Float threshold used by punch-through rendering.
          Commonly 0.0 or 0.5.

      - id: width
        type: u2
        doc: |
          Texture width in pixels (uint16).
          Must be power-of-two for compressed formats.

      - id: height
        type: u2
        doc: |
          Texture height in pixels (uint16).
          For cube maps, this is 6x the face width.
          Must be power-of-two for compressed formats.

      - id: pixel_encoding
        type: u1
        doc: |
          Pixel encoding flag:
          - 0x01 = Greyscale (8-bit luminance)
          - 0x02 = RGB (24-bit) or DXT1 (if compressed)
          - 0x04 = RGBA (32-bit) or DXT5 (if compressed)
          - 0x0C = BGRA (32-bit, Xbox-specific swizzle)

      - id: mipmap_count
        type: u1
        doc: |
          Number of mip levels per layer (minimum 1).
          Each mip level is half the size of the previous level.

      - id: reserved
        size: 114
        type: u1
        repeat: expr
        repeat-expr: 114
        doc: |
          Reserved/padding bytes (0x72 = 114 bytes).
          KotOR stores platform hints here but all implementations skip them.

    instances:
      is_compressed:
        value: data_size != 0
        doc: True if texture data is compressed (DXT format)

      is_uncompressed:
        value: data_size == 0
        doc: True if texture data is uncompressed (raw pixels)

  texture_data_section:
    seq:
      - id: layers
        type: texture_layer
        repeat: expr
        repeat-expr: |
          (_root.header.is_compressed && _root.header.height != 0 && _root.header.width != 0 && (_root.header.height / _root.header.width) == 6) ?
            6 : 1
        doc: Array of texture layers (1 for regular, 6 for cube maps)

  texture_layer:
    seq:
      - id: mipmaps
        type: texture_mipmap
        repeat: expr
        repeat-expr: _root.header.mipmap_count
        doc: Array of mipmap levels for this layer

  texture_mipmap:
    seq:
      - id: pixel_data
        type: pixel_data_block
        doc: Compressed or uncompressed pixel data for this mipmap level

  pixel_data_block:
    seq:
      - id: data
        type: u1
        repeat: until
        repeat-until: _io.pos >= _io.size
        doc: |
          Pixel data bytes (size calculated based on format and mipmap level).
          For DXT: block-compressed data (8 bytes per 4x4 block for DXT1, 16 for DXT3/DXT5).
          For uncompressed: raw pixel data (1 byte per pixel for greyscale, 3 for RGB, 4 for RGBA/BGRA).
          Note: Actual size should be calculated in application code based on format, width, height, and mip level.
          The data section continues until end of file or until TXI footer starts (if present).

  txi_footer_section:
    seq:
      - id: txi_data
        type: str
        encoding: ASCII
        size-eos: true
        doc: |
          ASCII TXI metadata appended after texture data.
          Contains texture rendering properties, animation parameters, etc.
          Parsed as line-based command/value pairs.
