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

#[derive(Default, Debug, Clone)]
pub struct NcsMinimal {
    pub _root: SharedType<NcsMinimal>,
    pub _parent: SharedType<NcsMinimal>,
    pub _self: SharedType<Self>,
    file_type: RefCell<String>,
    file_version: RefCell<String>,
    size_marker: RefCell<u8>,
    total_file_size: RefCell<u32>,
    instructions: RefCell<Vec<OptRc<NcsMinimal_Instruction>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NcsMinimal {
    type Root = NcsMinimal;
    type Parent = NcsMinimal;

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
        *self_rc.file_type.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        *self_rc.file_version.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        *self_rc.size_marker.borrow_mut() = _io.read_u1()?.into();
        *self_rc.total_file_size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.instructions.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, NcsMinimal_Instruction>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.instructions.borrow_mut().push(t);
                let _t_instructions = self_rc.instructions.borrow();
                let _tmpa = _t_instructions.last().unwrap();
                _i += 1;
                let x = !(((_io.pos() as i32) >= (*_r.total_file_size() as i32)));
                x
            } {}
        }
        Ok(())
    }
}
impl NcsMinimal {
}
impl NcsMinimal {
    pub fn file_type(&self) -> Ref<'_, String> {
        self.file_type.borrow()
    }
}
impl NcsMinimal {
    pub fn file_version(&self) -> Ref<'_, String> {
        self.file_version.borrow()
    }
}
impl NcsMinimal {
    pub fn size_marker(&self) -> Ref<'_, u8> {
        self.size_marker.borrow()
    }
}
impl NcsMinimal {
    pub fn total_file_size(&self) -> Ref<'_, u32> {
        self.total_file_size.borrow()
    }
}
impl NcsMinimal {
    pub fn instructions(&self) -> Ref<'_, Vec<OptRc<NcsMinimal_Instruction>>> {
        self.instructions.borrow()
    }
}
impl NcsMinimal {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NcsMinimal_Instruction {
    pub _root: SharedType<NcsMinimal>,
    pub _parent: SharedType<NcsMinimal>,
    pub _self: SharedType<Self>,
    bytecode: RefCell<u8>,
    qualifier: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NcsMinimal_Instruction {
    type Root = NcsMinimal;
    type Parent = NcsMinimal;

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
        *self_rc.bytecode.borrow_mut() = _io.read_u1()?.into();
        *self_rc.qualifier.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl NcsMinimal_Instruction {
}
impl NcsMinimal_Instruction {
    pub fn bytecode(&self) -> Ref<'_, u8> {
        self.bytecode.borrow()
    }
}
impl NcsMinimal_Instruction {
    pub fn qualifier(&self) -> Ref<'_, u8> {
        self.qualifier.borrow()
    }
}
impl NcsMinimal_Instruction {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
