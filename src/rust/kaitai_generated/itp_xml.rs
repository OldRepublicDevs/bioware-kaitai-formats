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
 * ITP XML format is a human-readable XML representation of ITP (Palette) binary files.
 * ITP files use GFF format (FileType "ITP " in GFF header).
 * Uses GFF XML structure with root element <gff3> containing <struct> elements.
 * Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/itp/itp.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/gff/itp.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/ITP-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/aurora/gff3file.cpp
 */

#[derive(Default, Debug, Clone)]
pub struct ItpXml {
    pub _root: SharedType<ItpXml>,
    pub _parent: SharedType<ItpXml>,
    pub _self: SharedType<Self>,
    xml_content: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ItpXml {
    type Root = ItpXml;
    type Parent = ItpXml;

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
impl ItpXml {
}

/**
 * XML document content as UTF-8 text
 */
impl ItpXml {
    pub fn xml_content(&self) -> Ref<'_, String> {
        self.xml_content.borrow()
    }
}
impl ItpXml {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
