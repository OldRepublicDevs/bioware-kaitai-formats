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
 * IFO (Module Information) files store module metadata including entry points,
 * starting locations, and module properties.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * IFO Root Struct Fields:
 * - Mod_ID (ResRef): Module identifier
 * - Mod_Name (LocalizedString): Module display name
 * - Mod_Entry_Area (ResRef): Starting area
 * - Mod_Entry_X, Mod_Entry_Y, Mod_Entry_Z (Float): Starting position
 * - Mod_Entry_Dir_X, Mod_Entry_Dir_Y (Float): Starting orientation
 * - Mod_OnHeartbeat, Mod_OnModLoad, Mod_OnModStart (ResRef): Script hooks
 * - Mod_MinGameVer (String): Minimum game version required
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-IFO.md
 */

#[derive(Default, Debug, Clone)]
pub struct Ifo {
    pub _root: SharedType<Ifo>,
    pub _parent: SharedType<Ifo>,
    pub _self: SharedType<Self>,
    gff_data: RefCell<OptRc<Gff>>,
    _io: RefCell<BytesReader>,
    f_file_type_valid: Cell<bool>,
    file_type_valid: RefCell<bool>,
    f_version_valid: Cell<bool>,
    version_valid: RefCell<bool>,
}
impl KStruct for Ifo {
    type Root = Ifo;
    type Parent = Ifo;

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
impl Ifo {
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
        *self.file_type_valid.borrow_mut() = (*self.gff_data().header().file_type() == "IFO ".to_string()) as bool;
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
        *self.version_valid.borrow_mut() = ( ((*self.gff_data().header().file_version() == "V3.2".to_string()) || (*self.gff_data().header().file_version() == "V3.3".to_string()) || (*self.gff_data().header().file_version() == "V4.0".to_string()) || (*self.gff_data().header().file_version() == "V4.1".to_string())) ) as bool;
        Ok(self.version_valid.borrow())
    }
}
impl Ifo {
    pub fn gff_data(&self) -> Ref<'_, OptRc<Gff>> {
        self.gff_data.borrow()
    }
}
impl Ifo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
