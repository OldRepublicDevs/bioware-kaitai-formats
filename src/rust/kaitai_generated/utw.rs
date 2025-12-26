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
use super::gff::Gff;

/**
 * UTW (Waypoint Template) files define navigation waypoints and spawn points.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTW Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Waypoint name
 * - Appearance (UInt32): Visual appearance (if visible)
 * - HasMapNote, MapNote (LocalizedString): Map markers
 * - LinkedTo (String): Connected waypoint tag
 */

#[derive(Default, Debug, Clone)]
pub struct Utw {
    pub _root: SharedType<Utw>,
    pub _parent: SharedType<Utw>,
    pub _self: SharedType<Self>,
    gff_data: RefCell<OptRc<Gff>>,
    _io: RefCell<BytesReader>,
    f_file_type_valid: Cell<bool>,
    file_type_valid: RefCell<bool>,
    f_version_valid: Cell<bool>,
    version_valid: RefCell<bool>,
}
impl KStruct for Utw {
    type Root = Utw;
    type Parent = Utw;

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
        let t = Self::read_into::<_, Gff>(&*_io, None, None)?.into();
        *self_rc.gff_data.borrow_mut() = t;
        Ok(())
    }
}
impl Utw {
    pub fn file_type_valid(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_file_type_valid.get() {
            return Ok(self.file_type_valid.borrow());
        }
        self.f_file_type_valid.set(true);
        *self.file_type_valid.borrow_mut() = (*self.gff_data().header().file_type() == "UTW ".to_string()) as bool;
        Ok(self.file_type_valid.borrow())
    }
    pub fn version_valid(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_version_valid.get() {
            return Ok(self.version_valid.borrow());
        }
        self.f_version_valid.set(true);
        *self.version_valid.borrow_mut() = ( ((*self.gff_data().header().file_version() == "V3.2".to_string()) || (*self.gff_data().header().file_version() == "V3.3".to_string())) ) as bool;
        Ok(self.version_valid.borrow())
    }
}
impl Utw {
    pub fn gff_data(&self) -> Ref<'_, OptRc<Gff>> {
        self.gff_data.borrow()
    }
}
impl Utw {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
