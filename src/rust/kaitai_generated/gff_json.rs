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
 * GFF JSON format is a human-readable JSON representation of GFF (Generic File Format) binary files.
 * Provides easier editing and interoperability with modern tools than binary GFF format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 */

#[derive(Default, Debug, Clone)]
pub struct GffJson {
    pub _root: SharedType<GffJson>,
    pub _parent: SharedType<GffJson>,
    pub _self: SharedType<Self>,
    json_content: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GffJson {
    type Root = GffJson;
    type Parent = GffJson;

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
        *self_rc.json_content.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl GffJson {
}

/**
 * JSON document content as UTF-8 text
 */
impl GffJson {
    pub fn json_content(&self) -> Ref<'_, String> {
        self.json_content.borrow()
    }
}
impl GffJson {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
