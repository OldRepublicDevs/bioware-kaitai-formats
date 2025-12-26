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
use super::bioware_common::BiowareCommon_BiowareLocstring;
use super::bioware_common::BiowareCommon_BiowareCexoString;
use super::bioware_common::BiowareCommon_BiowareResref;
use super::bioware_common::BiowareCommon_BiowareBinaryData;
use super::bioware_common::BiowareCommon_BiowareVector4;
use super::bioware_common::BiowareCommon_BiowareVector3;

/**
 * GFF (Generic File Format) is BioWare's universal container format for structured game data.
 * It is used by many KotOR file types including UTC (creature), UTI (item), DLG (dialogue),
 * ARE (area), GIT (game instance template), IFO (module info), and many others.
 * 
 * GFF uses a hierarchical structure with structs containing fields, which can be simple values,
 * nested structs, or lists of structs. The format supports version V3.2 (KotOR) and later
 * versions (V3.3, V4.0, V4.1) used in other BioWare games.
 * 
 * Binary Format Structure:
 * - File Header (56 bytes): File type signature (FourCC), version, counts, and offsets to all
 *   data tables (structs, fields, labels, field_data, field_indices, list_indices)
 * - Label Array: Array of 16-byte null-padded field name labels
 * - Struct Array: Array of struct entries (12 bytes each) - struct_id, data_or_offset, field_count
 * - Field Array: Array of field entries (12 bytes each) - field_type, label_index, data_or_offset
 * - Field Data: Storage area for complex field types (strings, binary, vectors, etc.)
 * - Field Indices Array: Array of field index arrays (used when structs have multiple fields)
 * - List Indices Array: Array of list entry structures (count + struct indices)
 * 
 * Field Types:
 * - Simple types (0-5, 8): Stored inline in data_or_offset (uint8, int8, uint16, int16, uint32,
 *   int32, float)
 * - Complex types (6-7, 9-13, 16-17): Offset to field_data section (uint64, int64, double, string,
 *   resref, localized_string, binary, vector4, vector3)
 * - Struct (14): Struct index stored inline (nested struct)
 * - List (15): Offset to list_indices_array (list of structs)
 * 
 * Struct Access Pattern:
 * 1. Root struct is always at struct_array index 0
 * 2. If struct.field_count == 1: data_or_offset contains direct field index
 * 3. If struct.field_count > 1: data_or_offset contains offset into field_indices_array
 * 4. Use field_index to access field_array entry
 * 5. Use field.label_index to get field name from label_array
 * 6. Use field.data_or_offset based on field_type (inline, offset, struct index, list offset)
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md - Complete GFF format documentation
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/Bioware-Aurora-GFF.md - Official BioWare Aurora GFF specification
 * - https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/itp.html - Tim Smith/Torlack's GFF/ITP documentation
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/gffreader.cpp - Complete C++ GFF reader implementation
 * - https://github.com/xoreos/xoreos/blob/master/src/aurora/gff3file.cpp - Generic Aurora GFF implementation (shared format)
 * - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/GFFObject.ts - TypeScript GFF parser
 * - https://github.com/KotOR-Community-Patches/KotOR-Unity/blob/master/Assets/Scripts/FileObjects/GFFObject.cs - C# Unity GFF loader
 * - https://github.com/KotOR-Community-Patches/Kotor.NET/tree/master/Kotor.NET/Formats/KotorGFF/ - .NET GFF reader/writer
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff.py - PyKotor binary reader/writer
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/gff_data.py - GFF data model
 */

#[derive(Default, Debug, Clone)]
pub struct Gff {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<Gff>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Gff_GffHeader>>,
    _io: RefCell<BytesReader>,
    f_field_array: Cell<bool>,
    field_array: RefCell<OptRc<Gff_FieldArray>>,
    f_field_data: Cell<bool>,
    field_data: RefCell<OptRc<Gff_FieldData>>,
    f_field_indices_array: Cell<bool>,
    field_indices_array: RefCell<OptRc<Gff_FieldIndicesArray>>,
    f_label_array: Cell<bool>,
    label_array: RefCell<OptRc<Gff_LabelArray>>,
    f_list_indices_array: Cell<bool>,
    list_indices_array: RefCell<OptRc<Gff_ListIndicesArray>>,
    f_root_struct_resolved: Cell<bool>,
    root_struct_resolved: RefCell<OptRc<Gff_ResolvedStruct>>,
    f_struct_array: Cell<bool>,
    struct_array: RefCell<OptRc<Gff_StructArray>>,
}
impl KStruct for Gff {
    type Root = Gff;
    type Parent = Gff;

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
        let t = Self::read_into::<_, Gff_GffHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        Ok(())
    }
}
impl Gff {

    /**
     * Array of field entries (12 bytes each)
     */
    pub fn field_array(
        &self
    ) -> KResult<Ref<'_, OptRc<Gff_FieldArray>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_field_array.get() {
            return Ok(self.field_array.borrow());
        }
        if ((*self.header().field_count() as u32) > (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.header().field_offset() as usize)?;
            let t = Self::read_into::<_, Gff_FieldArray>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.field_array.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.field_array.borrow())
    }

    /**
     * Storage area for complex field types (strings, binary, vectors, etc.)
     */
    pub fn field_data(
        &self
    ) -> KResult<Ref<'_, OptRc<Gff_FieldData>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_field_data.get() {
            return Ok(self.field_data.borrow());
        }
        if ((*self.header().field_data_count() as u32) > (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.header().field_data_offset() as usize)?;
            let t = Self::read_into::<_, Gff_FieldData>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.field_data.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.field_data.borrow())
    }

    /**
     * Array of field index arrays (used when structs have multiple fields)
     */
    pub fn field_indices_array(
        &self
    ) -> KResult<Ref<'_, OptRc<Gff_FieldIndicesArray>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_field_indices_array.get() {
            return Ok(self.field_indices_array.borrow());
        }
        if ((*self.header().field_indices_count() as u32) > (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.header().field_indices_offset() as usize)?;
            let t = Self::read_into::<_, Gff_FieldIndicesArray>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.field_indices_array.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.field_indices_array.borrow())
    }

    /**
     * Array of 16-byte null-padded field name labels
     */
    pub fn label_array(
        &self
    ) -> KResult<Ref<'_, OptRc<Gff_LabelArray>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_label_array.get() {
            return Ok(self.label_array.borrow());
        }
        if ((*self.header().label_count() as u32) > (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.header().label_offset() as usize)?;
            let t = Self::read_into::<_, Gff_LabelArray>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.label_array.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.label_array.borrow())
    }

    /**
     * Array of list entry structures (count + struct indices)
     */
    pub fn list_indices_array(
        &self
    ) -> KResult<Ref<'_, OptRc<Gff_ListIndicesArray>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_list_indices_array.get() {
            return Ok(self.list_indices_array.borrow());
        }
        if ((*self.header().list_indices_count() as u32) > (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.header().list_indices_offset() as usize)?;
            let t = Self::read_into::<_, Gff_ListIndicesArray>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.list_indices_array.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.list_indices_array.borrow())
    }

    /**
     * Convenience "decoded" view of the root struct (struct_array[0]).
     * This resolves field indices to field entries, resolves labels to strings,
     * and decodes field values (including nested structs and lists) into typed instances.
     */
    pub fn root_struct_resolved(
        &self
    ) -> KResult<Ref<'_, OptRc<Gff_ResolvedStruct>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_root_struct_resolved.get() {
            return Ok(self.root_struct_resolved.borrow());
        }
        let f = |t : &mut Gff_ResolvedStruct| Ok(t.set_params((0).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, Gff_ResolvedStruct>(&*_io, Some(self._root.clone()), None, &f)?.into();
        *self.root_struct_resolved.borrow_mut() = t;
        Ok(self.root_struct_resolved.borrow())
    }

    /**
     * Array of struct entries (12 bytes each)
     */
    pub fn struct_array(
        &self
    ) -> KResult<Ref<'_, OptRc<Gff_StructArray>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_struct_array.get() {
            return Ok(self.struct_array.borrow());
        }
        if ((*self.header().struct_count() as u32) > (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.header().struct_offset() as usize)?;
            let t = Self::read_into::<_, Gff_StructArray>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.struct_array.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.struct_array.borrow())
    }
}

/**
 * GFF file header (56 bytes total)
 */
impl Gff {
    pub fn header(&self) -> Ref<'_, OptRc<Gff_GffHeader>> {
        self.header.borrow()
    }
}
impl Gff {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Gff_GffFieldType {
    Uint8,
    Int8,
    Uint16,
    Int16,
    Uint32,
    Int32,
    Uint64,
    Int64,
    Single,
    Double,
    String,
    Resref,
    LocalizedString,
    Binary,
    Struct,
    List,
    Vector4,
    Vector3,
    Unknown(i64),
}

impl TryFrom<i64> for Gff_GffFieldType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Gff_GffFieldType> {
        match flag {
            0 => Ok(Gff_GffFieldType::Uint8),
            1 => Ok(Gff_GffFieldType::Int8),
            2 => Ok(Gff_GffFieldType::Uint16),
            3 => Ok(Gff_GffFieldType::Int16),
            4 => Ok(Gff_GffFieldType::Uint32),
            5 => Ok(Gff_GffFieldType::Int32),
            6 => Ok(Gff_GffFieldType::Uint64),
            7 => Ok(Gff_GffFieldType::Int64),
            8 => Ok(Gff_GffFieldType::Single),
            9 => Ok(Gff_GffFieldType::Double),
            10 => Ok(Gff_GffFieldType::String),
            11 => Ok(Gff_GffFieldType::Resref),
            12 => Ok(Gff_GffFieldType::LocalizedString),
            13 => Ok(Gff_GffFieldType::Binary),
            14 => Ok(Gff_GffFieldType::Struct),
            15 => Ok(Gff_GffFieldType::List),
            16 => Ok(Gff_GffFieldType::Vector4),
            17 => Ok(Gff_GffFieldType::Vector3),
            _ => Ok(Gff_GffFieldType::Unknown(flag)),
        }
    }
}

impl From<&Gff_GffFieldType> for i64 {
    fn from(v: &Gff_GffFieldType) -> Self {
        match *v {
            Gff_GffFieldType::Uint8 => 0,
            Gff_GffFieldType::Int8 => 1,
            Gff_GffFieldType::Uint16 => 2,
            Gff_GffFieldType::Int16 => 3,
            Gff_GffFieldType::Uint32 => 4,
            Gff_GffFieldType::Int32 => 5,
            Gff_GffFieldType::Uint64 => 6,
            Gff_GffFieldType::Int64 => 7,
            Gff_GffFieldType::Single => 8,
            Gff_GffFieldType::Double => 9,
            Gff_GffFieldType::String => 10,
            Gff_GffFieldType::Resref => 11,
            Gff_GffFieldType::LocalizedString => 12,
            Gff_GffFieldType::Binary => 13,
            Gff_GffFieldType::Struct => 14,
            Gff_GffFieldType::List => 15,
            Gff_GffFieldType::Vector4 => 16,
            Gff_GffFieldType::Vector3 => 17,
            Gff_GffFieldType::Unknown(v) => v
        }
    }
}

impl Default for Gff_GffFieldType {
    fn default() -> Self { Gff_GffFieldType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Gff_FieldArray {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<Gff>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Gff_FieldEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gff_FieldArray {
    type Root = Gff;
    type Parent = Gff;

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
        *self_rc.entries.borrow_mut() = Vec::new();
        let l_entries = *_r.header().field_count();
        for _i in 0..l_entries {
            let t = Self::read_into::<_, Gff_FieldEntry>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Gff_FieldArray {
}

/**
 * Array of field entries (12 bytes each)
 */
impl Gff_FieldArray {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Gff_FieldEntry>>> {
        self.entries.borrow()
    }
}
impl Gff_FieldArray {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gff_FieldData {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<Gff>,
    pub _self: SharedType<Self>,
    raw_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gff_FieldData {
    type Root = Gff;
    type Parent = Gff;

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
        *self_rc.raw_data.borrow_mut() = _io.read_bytes(*_r.header().field_data_count() as usize)?.into();
        Ok(())
    }
}
impl Gff_FieldData {
}

/**
 * Raw field data storage. Individual field data entries are accessed via
 * field_entry.field_data_offset_value offsets. The structure of each entry
 * depends on the field_type:
 * - UInt64/Int64/Double: 8 bytes
 * - String: 4-byte length + string bytes
 * - ResRef: 1-byte length + string bytes (max 16)
 * - LocalizedString: variable (see bioware_common::bioware_locstring type)
 * - Binary: 4-byte length + binary bytes
 * - Vector3: 12 bytes (3×float)
 * - Vector4: 16 bytes (4×float)
 */
impl Gff_FieldData {
    pub fn raw_data(&self) -> Ref<'_, Vec<u8>> {
        self.raw_data.borrow()
    }
}
impl Gff_FieldData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gff_FieldEntry {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    field_type: RefCell<Gff_GffFieldType>,
    label_index: RefCell<u32>,
    data_or_offset: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_field_data_offset_value: Cell<bool>,
    field_data_offset_value: RefCell<i32>,
    f_is_complex_type: Cell<bool>,
    is_complex_type: RefCell<bool>,
    f_is_list_type: Cell<bool>,
    is_list_type: RefCell<bool>,
    f_is_simple_type: Cell<bool>,
    is_simple_type: RefCell<bool>,
    f_is_struct_type: Cell<bool>,
    is_struct_type: RefCell<bool>,
    f_list_indices_offset_value: Cell<bool>,
    list_indices_offset_value: RefCell<i32>,
    f_struct_index_value: Cell<bool>,
    struct_index_value: RefCell<u32>,
}
impl KStruct for Gff_FieldEntry {
    type Root = Gff;
    type Parent = KStructUnit;

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
        *self_rc.field_type.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.label_index.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.data_or_offset.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Gff_FieldEntry {

    /**
     * Absolute file offset to field data for complex types
     */
    pub fn field_data_offset_value(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_field_data_offset_value.get() {
            return Ok(self.field_data_offset_value.borrow());
        }
        self.f_field_data_offset_value.set(true);
        if *self.is_complex_type()? {
            *self.field_data_offset_value.borrow_mut() = (((*_r.header().field_data_offset() as u32) + (*self.data_or_offset() as u32))) as i32;
        }
        Ok(self.field_data_offset_value.borrow())
    }

    /**
     * True if field stores data in field_data section
     */
    pub fn is_complex_type(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_complex_type.get() {
            return Ok(self.is_complex_type.borrow());
        }
        self.f_is_complex_type.set(true);
        *self.is_complex_type.borrow_mut() = ( ((*self.field_type() == Gff_GffFieldType::Uint64) || (*self.field_type() == Gff_GffFieldType::Int64) || (*self.field_type() == Gff_GffFieldType::Double) || (*self.field_type() == Gff_GffFieldType::String) || (*self.field_type() == Gff_GffFieldType::Resref) || (*self.field_type() == Gff_GffFieldType::LocalizedString) || (*self.field_type() == Gff_GffFieldType::Binary) || (*self.field_type() == Gff_GffFieldType::Vector4) || (*self.field_type() == Gff_GffFieldType::Vector3)) ) as bool;
        Ok(self.is_complex_type.borrow())
    }

    /**
     * True if field is a list of structs
     */
    pub fn is_list_type(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_list_type.get() {
            return Ok(self.is_list_type.borrow());
        }
        self.f_is_list_type.set(true);
        *self.is_list_type.borrow_mut() = (*self.field_type() == Gff_GffFieldType::List) as bool;
        Ok(self.is_list_type.borrow())
    }

    /**
     * True if field stores data inline (simple types)
     */
    pub fn is_simple_type(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_simple_type.get() {
            return Ok(self.is_simple_type.borrow());
        }
        self.f_is_simple_type.set(true);
        *self.is_simple_type.borrow_mut() = ( ((*self.field_type() == Gff_GffFieldType::Uint8) || (*self.field_type() == Gff_GffFieldType::Int8) || (*self.field_type() == Gff_GffFieldType::Uint16) || (*self.field_type() == Gff_GffFieldType::Int16) || (*self.field_type() == Gff_GffFieldType::Uint32) || (*self.field_type() == Gff_GffFieldType::Int32) || (*self.field_type() == Gff_GffFieldType::Single)) ) as bool;
        Ok(self.is_simple_type.borrow())
    }

    /**
     * True if field is a nested struct
     */
    pub fn is_struct_type(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_struct_type.get() {
            return Ok(self.is_struct_type.borrow());
        }
        self.f_is_struct_type.set(true);
        *self.is_struct_type.borrow_mut() = (*self.field_type() == Gff_GffFieldType::Struct) as bool;
        Ok(self.is_struct_type.borrow())
    }

    /**
     * Absolute file offset to list indices for list type fields
     */
    pub fn list_indices_offset_value(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_list_indices_offset_value.get() {
            return Ok(self.list_indices_offset_value.borrow());
        }
        self.f_list_indices_offset_value.set(true);
        if *self.is_list_type()? {
            *self.list_indices_offset_value.borrow_mut() = (((*_r.header().list_indices_offset() as u32) + (*self.data_or_offset() as u32))) as i32;
        }
        Ok(self.list_indices_offset_value.borrow())
    }

    /**
     * Struct index for struct type fields
     */
    pub fn struct_index_value(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_struct_index_value.get() {
            return Ok(self.struct_index_value.borrow());
        }
        self.f_struct_index_value.set(true);
        if *self.is_struct_type()? {
            *self.struct_index_value.borrow_mut() = (*self.data_or_offset()) as u32;
        }
        Ok(self.struct_index_value.borrow())
    }
}

/**
 * Field data type (see gff_field_type enum):
 * - 0-5, 8: Simple types (stored inline in data_or_offset)
 * - 6-7, 9-13, 16-17: Complex types (offset to field_data in data_or_offset)
 * - 14: Struct (struct index in data_or_offset)
 * - 15: List (offset to list_indices_array in data_or_offset)
 */
impl Gff_FieldEntry {
    pub fn field_type(&self) -> Ref<'_, Gff_GffFieldType> {
        self.field_type.borrow()
    }
}

/**
 * Index into label_array for field name
 */
impl Gff_FieldEntry {
    pub fn label_index(&self) -> Ref<'_, u32> {
        self.label_index.borrow()
    }
}

/**
 * Inline data (simple types) or offset/index (complex types):
 * - Simple types (0-5, 8): Value stored directly (1-4 bytes, sign/zero extended to 4 bytes)
 * - Complex types (6-7, 9-13, 16-17): Byte offset into field_data section (relative to field_data_offset)
 * - Struct (14): Struct index (index into struct_array)
 * - List (15): Byte offset into list_indices_array (relative to list_indices_offset)
 */
impl Gff_FieldEntry {
    pub fn data_or_offset(&self) -> Ref<'_, u32> {
        self.data_or_offset.borrow()
    }
}
impl Gff_FieldEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gff_FieldIndicesArray {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<Gff>,
    pub _self: SharedType<Self>,
    indices: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gff_FieldIndicesArray {
    type Root = Gff;
    type Parent = Gff;

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
        *self_rc.indices.borrow_mut() = Vec::new();
        let l_indices = *_r.header().field_indices_count();
        for _i in 0..l_indices {
            self_rc.indices.borrow_mut().push(_io.read_u4le()?.into());
        }
        Ok(())
    }
}
impl Gff_FieldIndicesArray {
}

/**
 * Array of field indices. When a struct has multiple fields, it stores an offset
 * into this array, and the next N consecutive u4 values (where N = struct.field_count)
 * are the field indices for that struct.
 */
impl Gff_FieldIndicesArray {
    pub fn indices(&self) -> Ref<'_, Vec<u32>> {
        self.indices.borrow()
    }
}
impl Gff_FieldIndicesArray {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gff_GffHeader {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<Gff>,
    pub _self: SharedType<Self>,
    file_type: RefCell<String>,
    file_version: RefCell<String>,
    struct_offset: RefCell<u32>,
    struct_count: RefCell<u32>,
    field_offset: RefCell<u32>,
    field_count: RefCell<u32>,
    label_offset: RefCell<u32>,
    label_count: RefCell<u32>,
    field_data_offset: RefCell<u32>,
    field_data_count: RefCell<u32>,
    field_indices_offset: RefCell<u32>,
    field_indices_count: RefCell<u32>,
    list_indices_offset: RefCell<u32>,
    list_indices_count: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gff_GffHeader {
    type Root = Gff;
    type Parent = Gff;

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
        *self_rc.struct_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.struct_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.field_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.field_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.label_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.label_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.field_data_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.field_data_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.field_indices_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.field_indices_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.list_indices_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.list_indices_count.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Gff_GffHeader {
}

/**
 * File type signature (FourCC). Examples: "GFF ", "UTC ", "UTI ", "DLG ", "ARE ", etc.
 * Must match a valid GFFContent enum value.
 */
impl Gff_GffHeader {
    pub fn file_type(&self) -> Ref<'_, String> {
        self.file_type.borrow()
    }
}

/**
 * File format version. Must be "V3.2" for KotOR games.
 * Later BioWare games use "V3.3", "V4.0", or "V4.1".
 * Valid values: "V3.2" (KotOR), "V3.3", "V4.0", "V4.1" (other BioWare games)
 */
impl Gff_GffHeader {
    pub fn file_version(&self) -> Ref<'_, String> {
        self.file_version.borrow()
    }
}

/**
 * Byte offset to struct array from beginning of file
 */
impl Gff_GffHeader {
    pub fn struct_offset(&self) -> Ref<'_, u32> {
        self.struct_offset.borrow()
    }
}

/**
 * Number of struct entries in struct array
 */
impl Gff_GffHeader {
    pub fn struct_count(&self) -> Ref<'_, u32> {
        self.struct_count.borrow()
    }
}

/**
 * Byte offset to field array from beginning of file
 */
impl Gff_GffHeader {
    pub fn field_offset(&self) -> Ref<'_, u32> {
        self.field_offset.borrow()
    }
}

/**
 * Number of field entries in field array
 */
impl Gff_GffHeader {
    pub fn field_count(&self) -> Ref<'_, u32> {
        self.field_count.borrow()
    }
}

/**
 * Byte offset to label array from beginning of file
 */
impl Gff_GffHeader {
    pub fn label_offset(&self) -> Ref<'_, u32> {
        self.label_offset.borrow()
    }
}

/**
 * Number of labels in label array
 */
impl Gff_GffHeader {
    pub fn label_count(&self) -> Ref<'_, u32> {
        self.label_count.borrow()
    }
}

/**
 * Byte offset to field data section from beginning of file
 */
impl Gff_GffHeader {
    pub fn field_data_offset(&self) -> Ref<'_, u32> {
        self.field_data_offset.borrow()
    }
}

/**
 * Size of field data section in bytes
 */
impl Gff_GffHeader {
    pub fn field_data_count(&self) -> Ref<'_, u32> {
        self.field_data_count.borrow()
    }
}

/**
 * Byte offset to field indices array from beginning of file
 */
impl Gff_GffHeader {
    pub fn field_indices_offset(&self) -> Ref<'_, u32> {
        self.field_indices_offset.borrow()
    }
}

/**
 * Number of field indices (total count across all structs with multiple fields)
 */
impl Gff_GffHeader {
    pub fn field_indices_count(&self) -> Ref<'_, u32> {
        self.field_indices_count.borrow()
    }
}

/**
 * Byte offset to list indices array from beginning of file
 */
impl Gff_GffHeader {
    pub fn list_indices_offset(&self) -> Ref<'_, u32> {
        self.list_indices_offset.borrow()
    }
}

/**
 * Number of list indices entries
 */
impl Gff_GffHeader {
    pub fn list_indices_count(&self) -> Ref<'_, u32> {
        self.list_indices_count.borrow()
    }
}
impl Gff_GffHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gff_LabelArray {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<Gff>,
    pub _self: SharedType<Self>,
    labels: RefCell<Vec<OptRc<Gff_LabelEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gff_LabelArray {
    type Root = Gff;
    type Parent = Gff;

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
        *self_rc.labels.borrow_mut() = Vec::new();
        let l_labels = *_r.header().label_count();
        for _i in 0..l_labels {
            let t = Self::read_into::<_, Gff_LabelEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.labels.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Gff_LabelArray {
}

/**
 * Array of label entries (16 bytes each)
 */
impl Gff_LabelArray {
    pub fn labels(&self) -> Ref<'_, Vec<OptRc<Gff_LabelEntry>>> {
        self.labels.borrow()
    }
}
impl Gff_LabelArray {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gff_LabelEntry {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<Gff_LabelArray>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gff_LabelEntry {
    type Root = Gff;
    type Parent = Gff_LabelArray;

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
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes(16 as usize)?.into(), "ASCII")?;
        Ok(())
    }
}
impl Gff_LabelEntry {
}

/**
 * Field name label (null-padded to 16 bytes, null-terminated).
 * The actual label length is determined by the first null byte.
 * Application code should trim trailing null bytes when using this field.
 */
impl Gff_LabelEntry {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Gff_LabelEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Label entry as a null-terminated ASCII string within a fixed 16-byte field.
 * This avoids leaking trailing `\0` bytes into generated-code consumers.
 */

#[derive(Default, Debug, Clone)]
pub struct Gff_LabelEntryTerminated {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<Gff_ResolvedField>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gff_LabelEntryTerminated {
    type Root = Gff;
    type Parent = Gff_ResolvedField;

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
        *self_rc.name.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(16 as usize)?.into(), 0, false).into(), "ASCII")?;
        Ok(())
    }
}
impl Gff_LabelEntryTerminated {
}
impl Gff_LabelEntryTerminated {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Gff_LabelEntryTerminated {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gff_ListEntry {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<Gff_ResolvedField>,
    pub _self: SharedType<Self>,
    num_struct_indices: RefCell<u32>,
    struct_indices: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gff_ListEntry {
    type Root = Gff;
    type Parent = Gff_ResolvedField;

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
        *self_rc.num_struct_indices.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.struct_indices.borrow_mut() = Vec::new();
        let l_struct_indices = *self_rc.num_struct_indices();
        for _i in 0..l_struct_indices {
            self_rc.struct_indices.borrow_mut().push(_io.read_u4le()?.into());
        }
        Ok(())
    }
}
impl Gff_ListEntry {
}

/**
 * Number of struct indices in this list
 */
impl Gff_ListEntry {
    pub fn num_struct_indices(&self) -> Ref<'_, u32> {
        self.num_struct_indices.borrow()
    }
}

/**
 * Array of struct indices (indices into struct_array)
 */
impl Gff_ListEntry {
    pub fn struct_indices(&self) -> Ref<'_, Vec<u32>> {
        self.struct_indices.borrow()
    }
}
impl Gff_ListEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gff_ListIndicesArray {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<Gff>,
    pub _self: SharedType<Self>,
    raw_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gff_ListIndicesArray {
    type Root = Gff;
    type Parent = Gff;

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
        *self_rc.raw_data.borrow_mut() = _io.read_bytes(*_r.header().list_indices_count() as usize)?.into();
        Ok(())
    }
}
impl Gff_ListIndicesArray {
}

/**
 * Raw list indices data. List entries are accessed via offsets stored in
 * list-type field entries (field_entry.list_indices_offset_value).
 * Each entry starts with a count (u4), followed by that many struct indices (u4 each).
 * 
 * Note: This is a raw data block. In practice, list entries are accessed via
 * offsets stored in list-type field entries, not as a sequential array.
 * Use list_entry type to parse individual entries at specific offsets.
 */
impl Gff_ListIndicesArray {
    pub fn raw_data(&self) -> Ref<'_, Vec<u8>> {
        self.raw_data.borrow()
    }
}
impl Gff_ListIndicesArray {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A decoded field: includes resolved label string and decoded typed value.
 * Exactly one `value_*` instance (or one of `value_struct` / `list_*`) will be non-null.
 */

#[derive(Default, Debug, Clone)]
pub struct Gff_ResolvedField {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<Gff_ResolvedStruct>,
    pub _self: SharedType<Self>,
    field_index: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_entry: Cell<bool>,
    entry: RefCell<OptRc<Gff_FieldEntry>>,
    f_field_entry_pos: Cell<bool>,
    field_entry_pos: RefCell<i32>,
    f_label: Cell<bool>,
    label: RefCell<OptRc<Gff_LabelEntryTerminated>>,
    f_list_entry: Cell<bool>,
    list_entry: RefCell<OptRc<Gff_ListEntry>>,
    f_list_structs: Cell<bool>,
    list_structs: RefCell<Vec<OptRc<Gff_ResolvedStruct>>>,
    f_value_binary: Cell<bool>,
    value_binary: RefCell<OptRc<BiowareCommon_BiowareBinaryData>>,
    f_value_double: Cell<bool>,
    value_double: RefCell<f64>,
    f_value_int16: Cell<bool>,
    value_int16: RefCell<i16>,
    f_value_int32: Cell<bool>,
    value_int32: RefCell<i32>,
    f_value_int64: Cell<bool>,
    value_int64: RefCell<i64>,
    f_value_int8: Cell<bool>,
    value_int8: RefCell<i8>,
    f_value_localized_string: Cell<bool>,
    value_localized_string: RefCell<OptRc<BiowareCommon_BiowareLocstring>>,
    f_value_resref: Cell<bool>,
    value_resref: RefCell<OptRc<BiowareCommon_BiowareResref>>,
    f_value_single: Cell<bool>,
    value_single: RefCell<f32>,
    f_value_string: Cell<bool>,
    value_string: RefCell<OptRc<BiowareCommon_BiowareCexoString>>,
    f_value_struct: Cell<bool>,
    value_struct: RefCell<OptRc<Gff_ResolvedStruct>>,
    f_value_uint16: Cell<bool>,
    value_uint16: RefCell<u16>,
    f_value_uint32: Cell<bool>,
    value_uint32: RefCell<u32>,
    f_value_uint64: Cell<bool>,
    value_uint64: RefCell<u64>,
    f_value_uint8: Cell<bool>,
    value_uint8: RefCell<u8>,
    f_value_vector3: Cell<bool>,
    value_vector3: RefCell<OptRc<BiowareCommon_BiowareVector3>>,
    f_value_vector4: Cell<bool>,
    value_vector4: RefCell<OptRc<BiowareCommon_BiowareVector4>>,
}
impl KStruct for Gff_ResolvedField {
    type Root = Gff;
    type Parent = Gff_ResolvedStruct;

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
        Ok(())
    }
}
impl Gff_ResolvedField {
    pub fn field_index(&self) -> Ref<'_, u32> {
        self.field_index.borrow()
    }
}
impl Gff_ResolvedField {
    pub fn set_params(&mut self, field_index: u32) {
        *self.field_index.borrow_mut() = field_index;
    }
}
impl Gff_ResolvedField {

    /**
     * Raw field entry at field_index
     */
    pub fn entry(
        &self
    ) -> KResult<Ref<'_, OptRc<Gff_FieldEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_entry.get() {
            return Ok(self.entry.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((*_r.header().field_offset() as i32) + (((*self.field_index() as u32) * (12 as u32)) as i32)) as usize)?;
        let t = Self::read_into::<_, Gff_FieldEntry>(&*_io, Some(self._root.clone()), None)?.into();
        *self.entry.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.entry.borrow())
    }

    /**
     * Absolute file offset of this field entry (start of 12-byte record)
     */
    pub fn field_entry_pos(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_field_entry_pos.get() {
            return Ok(self.field_entry_pos.borrow());
        }
        self.f_field_entry_pos.set(true);
        *self.field_entry_pos.borrow_mut() = (((*_r.header().field_offset() as i32) + (((*self.field_index() as u32) * (12 as u32)) as i32))) as i32;
        Ok(self.field_entry_pos.borrow())
    }

    /**
     * Resolved field label string
     */
    pub fn label(
        &self
    ) -> KResult<Ref<'_, OptRc<Gff_LabelEntryTerminated>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_label.get() {
            return Ok(self.label.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((*_r.header().label_offset() as i32) + (((*self.entry()?.label_index() as u32) * (16 as u32)) as i32)) as usize)?;
        let t = Self::read_into::<_, Gff_LabelEntryTerminated>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.label.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.label.borrow())
    }

    /**
     * Parsed list entry at offset (list indices)
     */
    pub fn list_entry(
        &self
    ) -> KResult<Ref<'_, OptRc<Gff_ListEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_list_entry.get() {
            return Ok(self.list_entry.borrow());
        }
        if *self.entry()?.field_type() == Gff_GffFieldType::List {
            let _pos = _io.pos();
            _io.seek(((*_r.header().list_indices_offset() as u32) + (*self.entry()?.data_or_offset() as u32)) as usize)?;
            let t = Self::read_into::<_, Gff_ListEntry>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.list_entry.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.list_entry.borrow())
    }

    /**
     * Resolved structs referenced by this list
     */
    pub fn list_structs(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Gff_ResolvedStruct>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_list_structs.get() {
            return Ok(self.list_structs.borrow());
        }
        self.f_list_structs.set(true);
        if *self.entry()?.field_type() == Gff_GffFieldType::List {
            *self.list_structs.borrow_mut() = Vec::new();
            let l_list_structs = *self.list_entry()?.num_struct_indices();
            for _i in 0..l_list_structs {
                let f = |t : &mut Gff_ResolvedStruct| Ok(t.set_params((self.list_entry()?.struct_indices()[_i as usize]).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Gff_ResolvedStruct>(&*_io, Some(self._root.clone()), None, &f)?.into();
                self.list_structs.borrow_mut().push(t);
            }
        }
        Ok(self.list_structs.borrow())
    }
    pub fn value_binary(
        &self
    ) -> KResult<Ref<'_, OptRc<BiowareCommon_BiowareBinaryData>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_binary.get() {
            return Ok(self.value_binary.borrow());
        }
        if *self.entry()?.field_type() == Gff_GffFieldType::Binary {
            let _pos = _io.pos();
            _io.seek(((*_r.header().field_data_offset() as u32) + (*self.entry()?.data_or_offset() as u32)) as usize)?;
            let t = Self::read_into::<_, BiowareCommon_BiowareBinaryData>(&*_io, None, None)?.into();
            *self.value_binary.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.value_binary.borrow())
    }
    pub fn value_double(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_double.get() {
            return Ok(self.value_double.borrow());
        }
        self.f_value_double.set(true);
        if *self.entry()?.field_type() == Gff_GffFieldType::Double {
            let _pos = _io.pos();
            _io.seek(((*_r.header().field_data_offset() as u32) + (*self.entry()?.data_or_offset() as u32)) as usize)?;
            *self.value_double.borrow_mut() = _io.read_f8le()?.into();
            _io.seek(_pos)?;
        }
        Ok(self.value_double.borrow())
    }
    pub fn value_int16(
        &self
    ) -> KResult<Ref<'_, i16>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_int16.get() {
            return Ok(self.value_int16.borrow());
        }
        self.f_value_int16.set(true);
        if *self.entry()?.field_type() == Gff_GffFieldType::Int16 {
            let _pos = _io.pos();
            _io.seek(((*self.field_entry_pos()? as i32) + (8 as i32)) as usize)?;
            *self.value_int16.borrow_mut() = _io.read_s2le()?.into();
            _io.seek(_pos)?;
        }
        Ok(self.value_int16.borrow())
    }
    pub fn value_int32(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_int32.get() {
            return Ok(self.value_int32.borrow());
        }
        self.f_value_int32.set(true);
        if *self.entry()?.field_type() == Gff_GffFieldType::Int32 {
            let _pos = _io.pos();
            _io.seek(((*self.field_entry_pos()? as i32) + (8 as i32)) as usize)?;
            *self.value_int32.borrow_mut() = _io.read_s4le()?.into();
            _io.seek(_pos)?;
        }
        Ok(self.value_int32.borrow())
    }
    pub fn value_int64(
        &self
    ) -> KResult<Ref<'_, i64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_int64.get() {
            return Ok(self.value_int64.borrow());
        }
        self.f_value_int64.set(true);
        if *self.entry()?.field_type() == Gff_GffFieldType::Int64 {
            let _pos = _io.pos();
            _io.seek(((*_r.header().field_data_offset() as u32) + (*self.entry()?.data_or_offset() as u32)) as usize)?;
            *self.value_int64.borrow_mut() = _io.read_s8le()?.into();
            _io.seek(_pos)?;
        }
        Ok(self.value_int64.borrow())
    }
    pub fn value_int8(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_int8.get() {
            return Ok(self.value_int8.borrow());
        }
        self.f_value_int8.set(true);
        if *self.entry()?.field_type() == Gff_GffFieldType::Int8 {
            let _pos = _io.pos();
            _io.seek(((*self.field_entry_pos()? as i32) + (8 as i32)) as usize)?;
            *self.value_int8.borrow_mut() = _io.read_s1()?.into();
            _io.seek(_pos)?;
        }
        Ok(self.value_int8.borrow())
    }
    pub fn value_localized_string(
        &self
    ) -> KResult<Ref<'_, OptRc<BiowareCommon_BiowareLocstring>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_localized_string.get() {
            return Ok(self.value_localized_string.borrow());
        }
        if *self.entry()?.field_type() == Gff_GffFieldType::LocalizedString {
            let _pos = _io.pos();
            _io.seek(((*_r.header().field_data_offset() as u32) + (*self.entry()?.data_or_offset() as u32)) as usize)?;
            let t = Self::read_into::<_, BiowareCommon_BiowareLocstring>(&*_io, None, None)?.into();
            *self.value_localized_string.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.value_localized_string.borrow())
    }
    pub fn value_resref(
        &self
    ) -> KResult<Ref<'_, OptRc<BiowareCommon_BiowareResref>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_resref.get() {
            return Ok(self.value_resref.borrow());
        }
        if *self.entry()?.field_type() == Gff_GffFieldType::Resref {
            let _pos = _io.pos();
            _io.seek(((*_r.header().field_data_offset() as u32) + (*self.entry()?.data_or_offset() as u32)) as usize)?;
            let t = Self::read_into::<_, BiowareCommon_BiowareResref>(&*_io, None, None)?.into();
            *self.value_resref.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.value_resref.borrow())
    }
    pub fn value_single(
        &self
    ) -> KResult<Ref<'_, f32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_single.get() {
            return Ok(self.value_single.borrow());
        }
        self.f_value_single.set(true);
        if *self.entry()?.field_type() == Gff_GffFieldType::Single {
            let _pos = _io.pos();
            _io.seek(((*self.field_entry_pos()? as i32) + (8 as i32)) as usize)?;
            *self.value_single.borrow_mut() = _io.read_f4le()?.into();
            _io.seek(_pos)?;
        }
        Ok(self.value_single.borrow())
    }
    pub fn value_string(
        &self
    ) -> KResult<Ref<'_, OptRc<BiowareCommon_BiowareCexoString>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_string.get() {
            return Ok(self.value_string.borrow());
        }
        if *self.entry()?.field_type() == Gff_GffFieldType::String {
            let _pos = _io.pos();
            _io.seek(((*_r.header().field_data_offset() as u32) + (*self.entry()?.data_or_offset() as u32)) as usize)?;
            let t = Self::read_into::<_, BiowareCommon_BiowareCexoString>(&*_io, None, None)?.into();
            *self.value_string.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.value_string.borrow())
    }

    /**
     * Nested struct (struct index = entry.data_or_offset)
     */
    pub fn value_struct(
        &self
    ) -> KResult<Ref<'_, OptRc<Gff_ResolvedStruct>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_struct.get() {
            return Ok(self.value_struct.borrow());
        }
        if *self.entry()?.field_type() == Gff_GffFieldType::Struct {
            let f = |t : &mut Gff_ResolvedStruct| Ok(t.set_params((*self.entry()?.data_or_offset()).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Gff_ResolvedStruct>(&*_io, Some(self._root.clone()), None, &f)?.into();
            *self.value_struct.borrow_mut() = t;
        }
        Ok(self.value_struct.borrow())
    }
    pub fn value_uint16(
        &self
    ) -> KResult<Ref<'_, u16>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_uint16.get() {
            return Ok(self.value_uint16.borrow());
        }
        self.f_value_uint16.set(true);
        if *self.entry()?.field_type() == Gff_GffFieldType::Uint16 {
            let _pos = _io.pos();
            _io.seek(((*self.field_entry_pos()? as i32) + (8 as i32)) as usize)?;
            *self.value_uint16.borrow_mut() = _io.read_u2le()?.into();
            _io.seek(_pos)?;
        }
        Ok(self.value_uint16.borrow())
    }
    pub fn value_uint32(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_uint32.get() {
            return Ok(self.value_uint32.borrow());
        }
        self.f_value_uint32.set(true);
        if *self.entry()?.field_type() == Gff_GffFieldType::Uint32 {
            let _pos = _io.pos();
            _io.seek(((*self.field_entry_pos()? as i32) + (8 as i32)) as usize)?;
            *self.value_uint32.borrow_mut() = _io.read_u4le()?.into();
            _io.seek(_pos)?;
        }
        Ok(self.value_uint32.borrow())
    }
    pub fn value_uint64(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_uint64.get() {
            return Ok(self.value_uint64.borrow());
        }
        self.f_value_uint64.set(true);
        if *self.entry()?.field_type() == Gff_GffFieldType::Uint64 {
            let _pos = _io.pos();
            _io.seek(((*_r.header().field_data_offset() as u32) + (*self.entry()?.data_or_offset() as u32)) as usize)?;
            *self.value_uint64.borrow_mut() = _io.read_u8le()?.into();
            _io.seek(_pos)?;
        }
        Ok(self.value_uint64.borrow())
    }
    pub fn value_uint8(
        &self
    ) -> KResult<Ref<'_, u8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_uint8.get() {
            return Ok(self.value_uint8.borrow());
        }
        self.f_value_uint8.set(true);
        if *self.entry()?.field_type() == Gff_GffFieldType::Uint8 {
            let _pos = _io.pos();
            _io.seek(((*self.field_entry_pos()? as i32) + (8 as i32)) as usize)?;
            *self.value_uint8.borrow_mut() = _io.read_u1()?.into();
            _io.seek(_pos)?;
        }
        Ok(self.value_uint8.borrow())
    }
    pub fn value_vector3(
        &self
    ) -> KResult<Ref<'_, OptRc<BiowareCommon_BiowareVector3>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_vector3.get() {
            return Ok(self.value_vector3.borrow());
        }
        if *self.entry()?.field_type() == Gff_GffFieldType::Vector3 {
            let _pos = _io.pos();
            _io.seek(((*_r.header().field_data_offset() as u32) + (*self.entry()?.data_or_offset() as u32)) as usize)?;
            let t = Self::read_into::<_, BiowareCommon_BiowareVector3>(&*_io, None, None)?.into();
            *self.value_vector3.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.value_vector3.borrow())
    }
    pub fn value_vector4(
        &self
    ) -> KResult<Ref<'_, OptRc<BiowareCommon_BiowareVector4>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_vector4.get() {
            return Ok(self.value_vector4.borrow());
        }
        if *self.entry()?.field_type() == Gff_GffFieldType::Vector4 {
            let _pos = _io.pos();
            _io.seek(((*_r.header().field_data_offset() as u32) + (*self.entry()?.data_or_offset() as u32)) as usize)?;
            let t = Self::read_into::<_, BiowareCommon_BiowareVector4>(&*_io, None, None)?.into();
            *self.value_vector4.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.value_vector4.borrow())
    }
}
impl Gff_ResolvedField {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A decoded struct node: resolves field indices -> field entries -> typed values,
 * and recursively resolves nested structs and lists.
 */

#[derive(Default, Debug, Clone)]
pub struct Gff_ResolvedStruct {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    struct_index: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_entry: Cell<bool>,
    entry: RefCell<OptRc<Gff_StructEntry>>,
    f_field_indices: Cell<bool>,
    field_indices: RefCell<Vec<u32>>,
    f_fields: Cell<bool>,
    fields: RefCell<Vec<OptRc<Gff_ResolvedField>>>,
    f_single_field: Cell<bool>,
    single_field: RefCell<OptRc<Gff_ResolvedField>>,
}
impl KStruct for Gff_ResolvedStruct {
    type Root = Gff;
    type Parent = KStructUnit;

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
        Ok(())
    }
}
impl Gff_ResolvedStruct {
    pub fn struct_index(&self) -> Ref<'_, u32> {
        self.struct_index.borrow()
    }
}
impl Gff_ResolvedStruct {
    pub fn set_params(&mut self, struct_index: u32) {
        *self.struct_index.borrow_mut() = struct_index;
    }
}
impl Gff_ResolvedStruct {

    /**
     * Raw struct entry at struct_index
     */
    pub fn entry(
        &self
    ) -> KResult<Ref<'_, OptRc<Gff_StructEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_entry.get() {
            return Ok(self.entry.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((*_r.header().struct_offset() as i32) + (((*self.struct_index() as u32) * (12 as u32)) as i32)) as usize)?;
        let t = Self::read_into::<_, Gff_StructEntry>(&*_io, Some(self._root.clone()), None)?.into();
        *self.entry.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.entry.borrow())
    }

    /**
     * Field indices for this struct (only present when field_count > 1).
     * When field_count == 1, the single field index is stored directly in entry.data_or_offset.
     */
    pub fn field_indices(
        &self
    ) -> KResult<Ref<'_, Vec<u32>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_field_indices.get() {
            return Ok(self.field_indices.borrow());
        }
        self.f_field_indices.set(true);
        if ((*self.entry()?.field_count() as u32) > (1 as u32)) {
            let _pos = _io.pos();
            _io.seek(((*_r.header().field_indices_offset() as u32) + (*self.entry()?.data_or_offset() as u32)) as usize)?;
            *self.field_indices.borrow_mut() = Vec::new();
            let l_field_indices = *self.entry()?.field_count();
            for _i in 0..l_field_indices {
                self.field_indices.borrow_mut().push(_io.read_u4le()?.into());
            }
            _io.seek(_pos)?;
        }
        Ok(self.field_indices.borrow())
    }

    /**
     * Resolved fields (multi-field struct)
     */
    pub fn fields(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Gff_ResolvedField>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_fields.get() {
            return Ok(self.fields.borrow());
        }
        self.f_fields.set(true);
        if ((*self.entry()?.field_count() as u32) > (1 as u32)) {
            *self.fields.borrow_mut() = Vec::new();
            let l_fields = *self.entry()?.field_count();
            for _i in 0..l_fields {
                let f = |t : &mut Gff_ResolvedField| Ok(t.set_params((self.field_indices()?[_i as usize]).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Gff_ResolvedField>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                self.fields.borrow_mut().push(t);
            }
        }
        Ok(self.fields.borrow())
    }

    /**
     * Resolved field (single-field struct)
     */
    pub fn single_field(
        &self
    ) -> KResult<Ref<'_, OptRc<Gff_ResolvedField>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_single_field.get() {
            return Ok(self.single_field.borrow());
        }
        if ((*self.entry()?.field_count() as u32) == (1 as u32)) {
            let f = |t : &mut Gff_ResolvedField| Ok(t.set_params((*self.entry()?.data_or_offset()).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Gff_ResolvedField>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
            *self.single_field.borrow_mut() = t;
        }
        Ok(self.single_field.borrow())
    }
}
impl Gff_ResolvedStruct {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gff_StructArray {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<Gff>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Gff_StructEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gff_StructArray {
    type Root = Gff;
    type Parent = Gff;

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
        *self_rc.entries.borrow_mut() = Vec::new();
        let l_entries = *_r.header().struct_count();
        for _i in 0..l_entries {
            let t = Self::read_into::<_, Gff_StructEntry>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Gff_StructArray {
}

/**
 * Array of struct entries (12 bytes each)
 */
impl Gff_StructArray {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Gff_StructEntry>>> {
        self.entries.borrow()
    }
}
impl Gff_StructArray {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gff_StructEntry {
    pub _root: SharedType<Gff>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    struct_id: RefCell<i32>,
    data_or_offset: RefCell<u32>,
    field_count: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_field_indices_offset: Cell<bool>,
    field_indices_offset: RefCell<u32>,
    f_has_multiple_fields: Cell<bool>,
    has_multiple_fields: RefCell<bool>,
    f_has_single_field: Cell<bool>,
    has_single_field: RefCell<bool>,
    f_single_field_index: Cell<bool>,
    single_field_index: RefCell<u32>,
}
impl KStruct for Gff_StructEntry {
    type Root = Gff;
    type Parent = KStructUnit;

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
        *self_rc.struct_id.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.data_or_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.field_count.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Gff_StructEntry {

    /**
     * Byte offset into field_indices_array when struct has multiple fields
     */
    pub fn field_indices_offset(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_field_indices_offset.get() {
            return Ok(self.field_indices_offset.borrow());
        }
        self.f_field_indices_offset.set(true);
        if *self.has_multiple_fields()? {
            *self.field_indices_offset.borrow_mut() = (*self.data_or_offset()) as u32;
        }
        Ok(self.field_indices_offset.borrow())
    }

    /**
     * True if struct has multiple fields (offset to field indices in data_or_offset)
     */
    pub fn has_multiple_fields(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_multiple_fields.get() {
            return Ok(self.has_multiple_fields.borrow());
        }
        self.f_has_multiple_fields.set(true);
        *self.has_multiple_fields.borrow_mut() = (((*self.field_count() as u32) > (1 as u32))) as bool;
        Ok(self.has_multiple_fields.borrow())
    }

    /**
     * True if struct has exactly one field (direct field index in data_or_offset)
     */
    pub fn has_single_field(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_single_field.get() {
            return Ok(self.has_single_field.borrow());
        }
        self.f_has_single_field.set(true);
        *self.has_single_field.borrow_mut() = (((*self.field_count() as u32) == (1 as u32))) as bool;
        Ok(self.has_single_field.borrow())
    }

    /**
     * Direct field index when struct has exactly one field
     */
    pub fn single_field_index(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_single_field_index.get() {
            return Ok(self.single_field_index.borrow());
        }
        self.f_single_field_index.set(true);
        if *self.has_single_field()? {
            *self.single_field_index.borrow_mut() = (*self.data_or_offset()) as u32;
        }
        Ok(self.single_field_index.borrow())
    }
}

/**
 * Structure type identifier. Often 0xFFFFFFFF (-1) for generic structs.
 * Used to identify struct types in schema-aware parsers.
 */
impl Gff_StructEntry {
    pub fn struct_id(&self) -> Ref<'_, i32> {
        self.struct_id.borrow()
    }
}

/**
 * Field index (if field_count == 1) or byte offset to field indices array (if field_count > 1).
 * If field_count == 0, this value is unused.
 */
impl Gff_StructEntry {
    pub fn data_or_offset(&self) -> Ref<'_, u32> {
        self.data_or_offset.borrow()
    }
}

/**
 * Number of fields in this struct:
 * - 0: No fields
 * - 1: Single field, data_or_offset contains the field index directly
 * - >1: Multiple fields, data_or_offset contains byte offset into field_indices_array
 */
impl Gff_StructEntry {
    pub fn field_count(&self) -> Ref<'_, u32> {
        self.field_count.borrow()
    }
}
impl Gff_StructEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
