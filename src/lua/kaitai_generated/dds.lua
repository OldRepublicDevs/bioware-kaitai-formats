-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- DDS (DirectDraw Surface) files appear in two variants in KotOR:
-- 
-- 1. Standard DirectX DDS: Header magic "DDS " (0x44445320), 124-byte header
-- 2. BioWare DDS variant: No magic; width/height/bpp/dataSize leading integers
-- 
-- DDS files support DXT1/DXT3/DXT5 block compression, uncompressed RGB/RGBA,
-- and various other pixel formats. They can include mipmaps and cube maps.
-- 
-- References:
-- - https://github.com/OldRepublicDevs/PyKotor/wiki/DDS-File-Format.md - Complete DDS format documentation
-- - Standard DirectX DDS format specification
Dds = class.class(KaitaiStruct)

function Dds:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dds:_read()
  self.magic = str_decode.decode(self._io:read_bytes(4), "ASCII")
  if not( ((self.magic == "DDS ") or (self.magic == "    ")) ) then
    error("ValidationNotAnyOfError")
  end
  if self.magic == "DDS " then
    self.header = Dds.DdsHeader(self._io, self, self._root)
  end
  if self.magic ~= "DDS " then
    self.bioware_header = Dds.BiowareDdsHeader(self._io, self, self._root)
  end
  self.pixel_data = {}
  local i = 0
  while not self._io:is_eof() do
    self.pixel_data[i + 1] = self._io:read_u1()
    i = i + 1
  end
end

-- 
-- File magic. Either "DDS " (0x44445320) for standard DDS,
-- or check for BioWare variant (no magic, starts with width/height).
-- 
-- Standard DDS header (124 bytes) - only present if magic is "DDS ".
-- 
-- BioWare DDS variant header - only present if magic is not "DDS ".
-- 
-- Pixel data (compressed or uncompressed).
-- For standard DDS: Format determined by DDPIXELFORMAT
-- For BioWare DDS: DXT1 or DXT5 compressed data

Dds.BiowareDdsHeader = class.class(KaitaiStruct)

function Dds.BiowareDdsHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Dds.BiowareDdsHeader:_read()
  self.width = self._io:read_u4le()
  self.height = self._io:read_u4le()
  self.bytes_per_pixel = self._io:read_u4le()
  self.data_size = self._io:read_u4le()
  self.unused_float = self._io:read_f4le()
end

-- 
-- Image width in pixels (must be power of two, < 0x8000).
-- 
-- Image height in pixels (must be power of two, < 0x8000).
-- 
-- Bytes per pixel:
-- - 3 = DXT1 compression
-- - 4 = DXT5 compression
-- 
-- Total compressed data size.
-- Must match (width*height)/2 for DXT1 or width*height for DXT5
-- 
-- Unused float field (typically 0.0).

Dds.Ddpixelformat = class.class(KaitaiStruct)

function Dds.Ddpixelformat:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Dds.Ddpixelformat:_read()
  self.size = self._io:read_u4le()
  if not(self.size == 32) then
    error("not equal, expected " .. 32 .. ", but got " .. self.size)
  end
  self.flags = self._io:read_u4le()
  self.fourcc = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.rgb_bit_count = self._io:read_u4le()
  self.r_bit_mask = self._io:read_u4le()
  self.g_bit_mask = self._io:read_u4le()
  self.b_bit_mask = self._io:read_u4le()
  self.a_bit_mask = self._io:read_u4le()
end

-- 
-- Structure size (must be 32).
-- 
-- Pixel format flags:
-- - 0x00000001 = DDPF_ALPHAPIXELS
-- - 0x00000002 = DDPF_ALPHA
-- - 0x00000004 = DDPF_FOURCC
-- - 0x00000040 = DDPF_RGB
-- - 0x00000200 = DDPF_YUV
-- - 0x00080000 = DDPF_LUMINANCE
-- 
-- Four-character code for compressed formats:
-- - "DXT1" = DXT1 compression
-- - "DXT3" = DXT3 compression
-- - "DXT5" = DXT5 compression
-- - "    " = Uncompressed format
-- 
-- Bits per pixel for uncompressed formats (16, 24, or 32).
-- 
-- Red channel bit mask (for uncompressed formats).
-- 
-- Green channel bit mask (for uncompressed formats).
-- 
-- Blue channel bit mask (for uncompressed formats).
-- 
-- Alpha channel bit mask (for uncompressed formats).

Dds.DdsHeader = class.class(KaitaiStruct)

function Dds.DdsHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Dds.DdsHeader:_read()
  self.size = self._io:read_u4le()
  if not(self.size == 124) then
    error("not equal, expected " .. 124 .. ", but got " .. self.size)
  end
  self.flags = self._io:read_u4le()
  self.height = self._io:read_u4le()
  self.width = self._io:read_u4le()
  self.pitch_or_linear_size = self._io:read_u4le()
  self.depth = self._io:read_u4le()
  self.mipmap_count = self._io:read_u4le()
  self.reserved1 = {}
  for i = 0, 11 - 1 do
    self.reserved1[i + 1] = self._io:read_u4le()
  end
  self.pixel_format = Dds.Ddpixelformat(self._io, self, self._root)
  self.caps = self._io:read_u4le()
  self.caps2 = self._io:read_u4le()
  self.caps3 = self._io:read_u4le()
  self.caps4 = self._io:read_u4le()
  self.reserved2 = self._io:read_u4le()
end

-- 
-- Header size (must be 124).
-- 
-- DDS flags bitfield:
-- - 0x00001007 = DDSD_CAPS | DDSD_HEIGHT | DDSD_WIDTH | DDSD_PIXELFORMAT
-- - 0x00020000 = DDSD_MIPMAPCOUNT (if mipmaps present)
-- 
-- Image height in pixels.
-- 
-- Image width in pixels.
-- 
-- Pitch (uncompressed) or linear size (compressed).
-- For compressed formats: total size of all mip levels
-- 
-- Depth for volume textures (usually 0 for 2D textures).
-- 
-- Number of mipmap levels (0 or 1 = no mipmaps).
-- 
-- Reserved fields (unused).
-- 
-- Pixel format structure.
-- 
-- Capability flags:
-- - 0x00001000 = DDSCAPS_TEXTURE
-- - 0x00000008 = DDSCAPS_MIPMAP
-- - 0x00000200 = DDSCAPS2_CUBEMAP
-- 
-- Additional capability flags:
-- - 0x00000200 = DDSCAPS2_CUBEMAP
-- - 0x00000FC00 = Cube map face flags
-- 
-- Reserved capability flags.
-- 
-- Reserved capability flags.
-- 
-- Reserved field.

