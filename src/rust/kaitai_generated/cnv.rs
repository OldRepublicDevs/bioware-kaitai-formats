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
 * CNV (Conversation) files are GFF-based format files that store conversation trees with entries, replies,
 * links, and conversation metadata. CNV files use the GFF (Generic File Format) binary structure
 * with file type signature "CNV ".
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds CNV-specific
 * validation and documentation.
 * 
 * CNV files are used by Eclipse Engine games (Dragon Age Origins, Dragon Age 2, Mass Effect, Mass Effect 2).
 * They are similar to DLG files used by Odyssey and Aurora engines but adapted for Eclipse's conversation system.
 * 
 * CNV Root Struct Fields:
 * - NumWords (Int32): Word count for conversation
 * - Skippable (UInt8): Whether conversation can be skipped
 * - ConversationType (Int32): Conversation type identifier
 * - EntryList (List): NPC dialogue lines (CNVEntry structs)
 * - ReplyList (List): Player response options (CNVReply structs)
 * - StartingList (List): Entry points (CNVLink structs)
 * - StuntList (List): Special animations (CNVStunt structs)
 * 
 * Each Entry/Reply contains:
 * - Text (LocalizedString): Dialogue text
 * - Script (ResRef): Conditional/action scripts
 * - Camera settings, animations, links to other nodes
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-CNV.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 */

#[derive(Default, Debug, Clone)]
pub struct Cnv {
    pub _root: SharedType<Cnv>,
    pub _parent: SharedType<Cnv>,
    pub _self: SharedType<Self>,
    gff_data: RefCell<OptRc<Gff>>,
    _io: RefCell<BytesReader>,
    f_file_type_valid: Cell<bool>,
    file_type_valid: RefCell<bool>,
    f_version_valid: Cell<bool>,
    version_valid: RefCell<bool>,
}
impl KStruct for Cnv {
    type Root = Cnv;
    type Parent = Cnv;

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
impl Cnv {

    /**
     * Validates that this is a CNV file (file type must be "CNV ")
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
        *self.file_type_valid.borrow_mut() = (*self.gff_data().header().file_type() == "CNV ".to_string()) as bool;
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
 * Complete GFF structure. CNV files use standard GFF format with "CNV " file type.
 * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
 */
impl Cnv {
    pub fn gff_data(&self) -> Ref<'_, OptRc<Gff>> {
        self.gff_data.borrow()
    }
}
impl Cnv {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
