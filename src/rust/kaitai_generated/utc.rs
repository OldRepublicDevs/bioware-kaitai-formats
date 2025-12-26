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
 * UTC (Creature Template) files are GFF-based format files that store creature definitions
 * including stats, appearance, inventory, feats, and script hooks. UTC files are used to
 * define NPCs, party members, enemies, and the player character in Knights of the Old Republic.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds UTC-specific
 * validation and documentation.
 * 
 * UTC Root Struct Fields (Common):
 * - "TemplateResRef" (ResRef): Blueprint identifier
 * - "Tag" (String): Unique instance identifier
 * - "FirstName", "LastName" (LocalizedString): Creature name
 * - "Appearance_Type" (UInt32): Appearance ID (appearance.2da)
 * - "PortraitId" (UInt16): Portrait index (portraits.2da)
 * - "Gender", "Race" (UInt8/UInt16): Character attributes
 * - "Str", "Dex", "Con", "Int", "Wis", "Cha" (UInt8): Ability scores
 * - "HitPoints", "MaxHitPoints", "ForcePoints" (Int16): Health/Force stats
 * - "ClassList" (List): Character classes with levels
 * - "FeatList" (List): Known feats
 * - "SkillList" (List): Skill ranks
 * - "ItemList" (List): Inventory items
 * - "Equip_ItemList" (List): Equipped items with slots
 * - Script hooks: "ScriptAttacked", "ScriptDamaged", "ScriptDeath", etc. (ResRef)
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTC.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utc.py
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/utc.cpp
 */

#[derive(Default, Debug, Clone)]
pub struct Utc {
    pub _root: SharedType<Utc>,
    pub _parent: SharedType<Utc>,
    pub _self: SharedType<Self>,
    gff_data: RefCell<OptRc<Gff>>,
    _io: RefCell<BytesReader>,
    f_file_type_valid: Cell<bool>,
    file_type_valid: RefCell<bool>,
    f_version_valid: Cell<bool>,
    version_valid: RefCell<bool>,
}
impl KStruct for Utc {
    type Root = Utc;
    type Parent = Utc;

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
impl Utc {

    /**
     * Validates that this is a UTC file (file type must be "UTC ")
     */
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
        *self.file_type_valid.borrow_mut() = (*self.gff_data().header().file_type() == "UTC ".to_string()) as bool;
        Ok(self.file_type_valid.borrow())
    }

    /**
     * Validates GFF version is supported
     */
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

/**
 * Complete GFF structure. UTC files use standard GFF format with "UTC " file type.
 * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
 */
impl Utc {
    pub fn gff_data(&self) -> Ref<'_, OptRc<Gff>> {
        self.gff_data.borrow()
    }
}
impl Utc {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
