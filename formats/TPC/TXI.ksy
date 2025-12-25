meta:
  id: txi
  title: BioWare TXI (Texture Info) Format
  license: MIT
  endian: le
  file-extension: txi
  encoding: ASCII
  xref:
    pykotor: vendor/PyKotor/wiki/TXI-File-Format.md
    wiki: vendor/PyKotor/wiki/TXI-File-Format.md
doc: |
  TXI (Texture Info) files are compact ASCII descriptors that attach metadata to TPC textures.
  They control mipmap usage, filtering, flipbook animation, environment mapping, font atlases,
  and platform-specific downsampling. Every TXI file is parsed at runtime to configure how
  a TPC image is rendered.
  
  Format:
  - Plain-text KEY/value pairs
  - Commands are case-insensitive but conventionally lowercase
  - Values can be integers, floats, booleans (0/1), ResRefs, or multi-line coordinate tables
  - A single TXI can be appended to the end of a .tpc file or shipped as a sibling .txi file
  
  Many TXI files in the game installation are empty (0 bytes), serving as placeholders that
  indicate the texture should use default rendering settings.
  
  References:
  - vendor/PyKotor/wiki/TXI-File-Format.md - Complete TXI command reference
  - vendor/reone/src/libs/graphics/format/txireader.cpp - C++ TXI parser implementation

seq:
  - id: content
    type: str
    size-eos: true
    encoding: ASCII
    doc: |
      Complete TXI file content as ASCII text.
      Contains command/value pairs, one per line.
      
      Common commands:
      - mipmap: 0/1 - Toggles engine mipmap usage
      - filter: 0/1 - Enables bilinear filtering
      - clamp: 0/1 - Forces address mode clamp
      - blending: additive/punchthrough - Selects blending mode
      - proceduretype: cycle - Enables flipbook animation
      - numx, numy: int - Horizontal/vertical frame counts
      - fps: float - Frames per second for playback
      - cube: 0/1 - Marks texture as cube map
      - And many more (see wiki documentation)
      
      Empty TXI files (0 bytes) are valid and indicate default settings.
