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
 * PT (Party Table) files are GFF-based format files that store party and game state information
 * for Odyssey Engine games (KotOR and KotOR 2). PT files use the GFF (Generic File Format) binary
 * structure with file type signature "PT  ".
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds PT-specific
 * validation and documentation.
 * 
 * PT files are typically named "PARTYTABLE.res" and are stored in savegame.sav ERF archives.
 * They contain comprehensive party and game state information including:
 * - Party composition (current members, available NPCs, leader)
 * - Resources (gold/credits, XP pool, components, chemicals)
 * - Journal entries with states, dates, and times
 * - Pazaak cards and side decks for the mini-game
 * - UI state (last panel, messages, tutorial windows shown)
 * - AI state (follow mode, AI enabled, solo mode)
 * - K2-specific: Influence values per companion
 * 
 * PT Root Struct Fields (Common):
 * - "PT_PCNAME" (String): Player character name
 * - "PT_GOLD" (Int32): Credits/gold amount
 * - "PT_XP_POOL" (Int32): Experience points
 * - "PT_PLAYEDSECONDS" (UInt32): Total playtime in seconds
 * - "PT_NUM_MEMBERS" (Int32): Party member count
 * - "PT_CONTROLLED_NPC", "PT_SOLOMODE", "PT_AISTATE", "PT_FOLLOWSTATE" (Int32): AI/party state
 * - "PT_MEMBERS" (List): Party member ResRefs and leader flags
 * - "PT_AVAIL_NPCS" (List): Available NPCs for recruitment
 * - "PT_INFLUENCE" (List): Influence values (KotOR 2 only)
 * - "PT_PAZAAKCARDS", "PT_PAZSIDELIST" (List): Pazaak card collections
 * - Journal/message lists: "PT_FB_MSG_LIST", "PT_DLG_MSG_LIST", "PT_COM_MSG_LIST"
 * 
 * Based on swkotor2.exe: SavePartyTable @ 0x0057bd70
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/extract/savedata.py
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PT.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 */

#[derive(Default, Debug, Clone)]
pub struct Pt {
    pub _root: SharedType<Pt>,
    pub _parent: SharedType<Pt>,
    pub _self: SharedType<Self>,
    gff_data: RefCell<OptRc<Gff>>,
    _io: RefCell<BytesReader>,
    f_file_type_valid: Cell<bool>,
    file_type_valid: RefCell<bool>,
    f_version_valid: Cell<bool>,
    version_valid: RefCell<bool>,
}
impl KStruct for Pt {
    type Root = Pt;
    type Parent = Pt;

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
impl Pt {

    /**
     * Validates that this is a PT file (file type must be "PT  ")
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
        *self.file_type_valid.borrow_mut() = (*self.gff_data().header().file_type() == "PT  ".to_string()) as bool;
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
 * Complete GFF structure. PT files use standard GFF format with "PT  " file type.
 * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
 */
impl Pt {
    pub fn gff_data(&self) -> Ref<'_, OptRc<Gff>> {
        self.gff_data.borrow()
    }
}
impl Pt {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
