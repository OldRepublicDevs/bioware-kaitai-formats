#ifndef MDX_H_
#define MDX_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class mdx_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * MDX (Model Extension) files contain vertex data for MDL models. MDX files work in tandem
 * with MDL files which define the model structure, hierarchy, and metadata. The MDX file
 * contains the actual vertex positions, normals, texture coordinates, colors, and other
 * per-vertex attributes.
 * 
 * Format Structure:
 * - Vertex data is organized by mesh and stored at offsets specified in the MDL file
 * - Each mesh can have different vertex formats depending on what attributes are present
 * - Vertex attributes include: positions, normals, texture coordinates (up to 4 sets),
 *   vertex colors, tangent space data, and bone weights/indices for skinned meshes
 * 
 * MDX data is referenced from MDL trimesh headers via offsets. The MDL file specifies:
 * - mdx_data_offset: Absolute offset to this mesh's vertex data in MDX file
 * - mdx_vertex_size: Size in bytes of each vertex
 * - mdx_data_flags: Bitmask indicating which vertex attributes are present
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/MDL-MDX-File-Format.md - Complete MDL/MDX format documentation
 * - MDL.ksy - Model structure that references MDX data
 */

class mdx_t : public kaitai::kstruct {

public:

    mdx_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mdx_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~mdx_t();

private:
    std::vector<uint8_t>* m_vertex_data;
    mdx_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Raw vertex data bytes.
     * Structure depends on the mesh definition in the corresponding MDL file.
     * 
     * Vertex data is organized by mesh, with each mesh's data stored at the offset
     * specified in the MDL file's trimesh header (mdx_data_offset field).
     * 
     * Vertex format is determined by mdx_data_flags in the MDL:
     * - 0x00000001: MDX_VERTICES (vertex positions - 3 floats = 12 bytes)
     * - 0x00000002: MDX_TEX0_VERTICES (primary texture coordinates - 2 floats = 8 bytes)
     * - 0x00000004: MDX_TEX1_VERTICES (secondary texture coordinates - 2 floats = 8 bytes)
     * - 0x00000008: MDX_TEX2_VERTICES (tertiary texture coordinates - 2 floats = 8 bytes)
     * - 0x00000010: MDX_TEX3_VERTICES (quaternary texture coordinates - 2 floats = 8 bytes)
     * - 0x00000020: MDX_VERTEX_NORMALS (vertex normals - 3 floats = 12 bytes)
     * - 0x00000040: MDX_VERTEX_COLORS (vertex colors - 4 bytes, typically RGBA)
     * - 0x00000080: MDX_TANGENT_SPACE (tangent space data - variable size)
     * 
     * For skinned meshes, additional data includes:
     * - Bone weights: 4 floats per vertex (16 bytes)
     * - Bone indices: 4 floats per vertex, cast to uint16 (8 bytes)
     * 
     * Vertex data must be parsed in conjunction with the MDL file to determine
     * the exact structure and offsets for each mesh.
     */
    std::vector<uint8_t>* vertex_data() const { return m_vertex_data; }
    mdx_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // MDX_H_
