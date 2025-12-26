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
 * BZF (BioWare Zipped File) files are LZMA-compressed BIF files used primarily in iOS
 * (and maybe Android) ports of KotOR. The BZF header contains "BZF " + "V1.0", followed
 * by LZMA-compressed BIF data. Decompression reveals a standard BIF structure.
 * 
 * Format Structure:
 * - Header (8 bytes): File type signature "BZF " and version "V1.0"
 * - Compressed Data: LZMA-compressed BIF file data
 * 
 * After decompression, the data follows the standard BIF format structure.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/BIF-File-Format.md - BZF compression section
 * - BIF.ksy - Standard BIF format (decompressed BZF data matches this)
 */

#[derive(Default, Debug, Clone)]
pub struct Bzf {
    pub _root: SharedType<Bzf>,
    pub _parent: SharedType<Bzf>,
    pub _self: SharedType<Self>,
    file_type: RefCell<String>,
    version: RefCell<String>,
    compressed_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Bzf {
    type Root = Bzf;
    type Parent = Bzf;

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
        *self_rc.file_type.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        if !(*self_rc.file_type() == "BZF ".to_string()) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        if !(*self_rc.version() == "V1.0".to_string()) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/1".to_string() }));
        }
        *self_rc.compressed_data.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.compressed_data.borrow_mut().push(_io.read_u1()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Bzf {
}

/**
 * File type signature. Must be "BZF " for compressed BIF files.
 */
impl Bzf {
    pub fn file_type(&self) -> Ref<'_, String> {
        self.file_type.borrow()
    }
}

/**
 * File format version. Always "V1.0" for BZF files.
 */
impl Bzf {
    pub fn version(&self) -> Ref<'_, String> {
        self.version.borrow()
    }
}

/**
 * LZMA-compressed BIF file data.
 * This data must be decompressed using LZMA algorithm to obtain the standard BIF structure.
 * After decompression, the data can be parsed using the BIF format definition.
 */
impl Bzf {
    pub fn compressed_data(&self) -> Ref<'_, Vec<u8>> {
        self.compressed_data.borrow()
    }
}
impl Bzf {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
