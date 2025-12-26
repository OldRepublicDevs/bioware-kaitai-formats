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
 * GFF XML format is a human-readable XML representation of GFF (Generic File Format) binary files.
 * Used by xoreos-tools and other modding tools for easier editing than binary GFF format.
 * 
 * The XML format represents the hierarchical GFF structure using XML elements:
 * - Root element: <gff3>
 * - Contains a <struct> element with id attribute
 * - Struct contains field elements (byte, uint32, exostring, locstring, resref, list, etc.)
 * - Each field has a label attribute
 * - Lists contain nested <struct> elements
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 * - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffdumper.cpp
 * - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffcreator.cpp
 */

#[derive(Default, Debug, Clone)]
pub struct GffXml {
    pub _root: SharedType<GffXml>,
    pub _parent: SharedType<GffXml>,
    pub _self: SharedType<Self>,
    xml_content: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GffXml {
    type Root = GffXml;
    type Parent = GffXml;

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
impl GffXml {
}

/**
 * XML document content as UTF-8 text.
 * Structure: <gff3><struct id="...">...</struct></gff3>
 * Note: Kaitai Struct has limited XML parsing capabilities. For full XML parsing,
 * use an XML parser library. This definition serves as a format identifier.
 */
impl GffXml {
    pub fn xml_content(&self) -> Ref<'_, String> {
        self.xml_content.borrow()
    }
}
impl GffXml {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
