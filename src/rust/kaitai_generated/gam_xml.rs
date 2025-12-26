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
 * Human-readable XML representation of GAM (Game State) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../gam/gam.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-GAM.md, GFF-File-Format.md)
 */

#[derive(Default, Debug, Clone)]
pub struct GamXml {
    pub _root: SharedType<GamXml>,
    pub _parent: SharedType<GamXml>,
    pub _self: SharedType<Self>,
    xml_content: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GamXml {
    type Root = GamXml;
    type Parent = GamXml;

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
        *self_rc.xml_content.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl GamXml {
}

/**
 * XML document content as UTF-8 text
 */
impl GamXml {
    pub fn xml_content(&self) -> Ref<'_, String> {
        self.xml_content.borrow()
    }
}
impl GamXml {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
