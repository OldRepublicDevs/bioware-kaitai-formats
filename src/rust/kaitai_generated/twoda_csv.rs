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
 * TwoDA CSV format is a human-readable CSV (Comma-Separated Values) representation of TwoDA files.
 * Provides easier editing in spreadsheet applications than binary TwoDA format.
 * 
 * Each row represents a data row, with the first row containing column headers.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
 */

#[derive(Default, Debug, Clone)]
pub struct TwodaCsv {
    pub _root: SharedType<TwodaCsv>,
    pub _parent: SharedType<TwodaCsv>,
    pub _self: SharedType<Self>,
    csv_content: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TwodaCsv {
    type Root = TwodaCsv;
    type Parent = TwodaCsv;

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
        *self_rc.csv_content.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl TwodaCsv {
}

/**
 * CSV text content with rows separated by newlines and columns by commas
 */
impl TwodaCsv {
    pub fn csv_content(&self) -> Ref<'_, String> {
        self.csv_content.borrow()
    }
}
impl TwodaCsv {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
