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
 * SSF XML format is a human-readable XML representation of SSF (Soundset) binary files.
 * Provides easier editing than binary SSF format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/io_ssf_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/ssf.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/SSF-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/aurora/ssffile.cpp
 */

#[derive(Default, Debug, Clone)]
pub struct SsfXml {
    pub _root: SharedType<SsfXml>,
    pub _parent: SharedType<SsfXml>,
    pub _self: SharedType<Self>,
    xml_content: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SsfXml {
    type Root = SsfXml;
    type Parent = SsfXml;

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
impl SsfXml {
}

/**
 * XML document content as UTF-8 text
 */
impl SsfXml {
    pub fn xml_content(&self) -> Ref<'_, String> {
        self.xml_content.borrow()
    }
}
impl SsfXml {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
