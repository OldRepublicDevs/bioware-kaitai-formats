// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#![allow(unused_imports)]
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(irrefutable_let_patterns)]
#![allow(unused_comparisons)]

extern crate kaitai;
use kaitai::*;
use std::convert::{TryFrom, TryInto};
use std::cell::{Ref, Cell, RefCell};
use std::rc::{Rc, Weak};

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

#[derive(Default, Debug, Clone)]
pub struct Mdx {
    pub _root: SharedType<Mdx>,
    pub _parent: SharedType<Mdx>,
    pub _self: SharedType<Self>,
    vertex_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mdx {
    type Root = Mdx;
    type Parent = Mdx;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.vertex_data.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.vertex_data.borrow_mut().push(_io.read_u1()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Mdx {
}

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
impl Mdx {
    pub fn vertex_data(&self) -> Ref<'_, Vec<u8>> {
        self.vertex_data.borrow()
    }
}
impl Mdx {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
