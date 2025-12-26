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
 * TwoDA JSON format is a human-readable JSON representation of TwoDA files.
 * Provides easier editing and interoperability with modern tools than binary TwoDA format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
 */

#[derive(Default, Debug, Clone)]
pub struct TwodaJson {
    pub _root: SharedType<TwodaJson>,
    pub _parent: SharedType<TwodaJson>,
    pub _self: SharedType<Self>,
    json_content: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TwodaJson {
    type Root = TwodaJson;
    type Parent = TwodaJson;

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
impl TwodaJson {
}

/**
 * JSON document content as UTF-8 text
 */
impl TwodaJson {
    pub fn json_content(&self) -> Ref<'_, String> {
        self.json_content.borrow()
    }
}
impl TwodaJson {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
