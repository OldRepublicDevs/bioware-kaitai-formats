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
 * RES XML format is a human-readable XML representation of RES (Save Data) binary files.
 * Uses GFF XML structure with root element <gff3> containing <struct> elements.
 * Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 */

#[derive(Default, Debug, Clone)]
pub struct ResXml {
    pub _root: SharedType<ResXml>,
    pub _parent: SharedType<ResXml>,
    pub _self: SharedType<Self>,
    xml_content: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ResXml {
    type Root = ResXml;
    type Parent = ResXml;

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
impl ResXml {
}

/**
 * XML document content as UTF-8 text
 */
impl ResXml {
    pub fn xml_content(&self) -> Ref<'_, String> {
        self.xml_content.borrow()
    }
}
impl ResXml {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
