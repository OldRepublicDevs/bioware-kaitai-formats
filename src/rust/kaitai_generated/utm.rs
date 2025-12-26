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
 * UTM (Store/Merchant Template) files define merchant inventories and prices.
 * 
 * UTM files contain:
 * - Root struct with merchant metadata:
 *   - ResRef: Merchant template ResRef (unique identifier, max 16 characters, ResRef type)
 *   - LocName: Localized merchant name (LocalizedString/CExoLocString type)
 *   - Tag: Merchant tag identifier (String/CExoString type, used for scripting references)
 *   - MarkUp: Markup percentage for selling items to player (Int32, typically 0-200, represents percentage)
 *   - MarkDown: Markdown percentage for buying items from player (Int32, typically 0-200, represents percentage)
 *   - OnOpenStore: Script ResRef executed when store opens (ResRef type, max 16 characters)
 *   - Comment: Developer comment string (String/CExoString type, not used by game engine)
 *   - BuySellFlag: Flags for buy/sell capabilities (UInt8/Byte type)
 *     - Bit 0 (mask 0x01): Can buy items (1 = can buy, 0 = cannot buy)
 *     - Bit 1 (mask 0x02): Can sell items (1 = can sell, 0 = cannot sell)
 *     - Bits 2-7: Reserved/unused
 *   - ID: Deprecated field, not used by game engine (UInt8/Byte type)
 * - ItemList: Array of UTM_ItemList structs containing merchant inventory items (List type)
 *   Each item (struct_id typically 0 or custom) contains:
 *   - InventoryRes: Item ResRef (ResRef type, max 16 characters, references the item template UTI file)
 *   - Infinite: Whether item stock is infinite (UInt8/Byte type, 0 = finite stock, 1 = infinite stock)
 *   - Dropable: Whether item is droppable by merchant (UInt8/Byte type, 0 = not droppable, 1 = droppable)
 *     Note: Field name is "Dropable" (not "Droppable") in the binary format
 *   - Repos_PosX: X position in merchant inventory grid (UInt16 type, grid coordinate)
 *   - Repos_PosY: Y position in merchant inventory grid (UInt16 type, grid coordinate)
 * 
 * The BuySellFlag field encodes two boolean flags in a single byte:
 * - Value 0: Cannot buy, cannot sell
 * - Value 1: Can buy, cannot sell (bit 0 set)
 * - Value 2: Cannot buy, can sell (bit 1 set)
 * - Value 3: Can buy, can sell (bits 0 and 1 set)
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTM.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/seedhartha/reone/blob/master/include/reone/resource/parser/gff/utm.h:35-46 (UTM struct definition)
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/utm.cpp:37-52 (UTM parsing from GFF)
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utm.py:16-223 (PyKotor implementation)
 */

#[derive(Default, Debug, Clone)]
pub struct Utm {
    pub _root: SharedType<Utm>,
    pub _parent: SharedType<Utm>,
    pub _self: SharedType<Self>,
    gff_data: RefCell<OptRc<Gff>>,
    _io: RefCell<BytesReader>,
    f_file_type_valid: Cell<bool>,
    file_type_valid: RefCell<bool>,
    f_version_valid: Cell<bool>,
    version_valid: RefCell<bool>,
}
impl KStruct for Utm {
    type Root = Utm;
    type Parent = Utm;

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
impl Utm {
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
        *self.file_type_valid.borrow_mut() = (*self.gff_data().header().file_type() == "UTM ".to_string()) as bool;
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
impl Utm {
    pub fn gff_data(&self) -> Ref<'_, OptRc<Gff>> {
        self.gff_data.borrow()
    }
}
impl Utm {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
