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
 * LIP (LIP Synchronization) files drive mouth animation for voiced dialogue in BioWare games.
 * Each file contains a compact series of keyframes that map timestamps to discrete viseme
 * (mouth shape) indices so that the engine can interpolate character lip movement while
 * playing the companion WAV audio line.
 * 
 * LIP files are always binary and contain only animation data. They are paired with WAV
 * voice-over resources of identical duration; the LIP length field must match the WAV
 * playback time for glitch-free animation.
 * 
 * Keyframes are sorted chronologically and store a timestamp (float seconds) plus a
 * 1-byte viseme index (0-15). The format uses the 16-shape Preston Blair phoneme set.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/LIP-File-Format.md
 * - https://github.com/seedhartha/reone/blob/master/src/libs/graphics/format/lipreader.cpp:27-42
 * - https://github.com/xoreos/xoreos/blob/master/src/graphics/aurora/lipfile.cpp
 * - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/LIPObject.ts:93-146
 */

#[derive(Default, Debug, Clone)]
pub struct Lip {
    pub _root: SharedType<Lip>,
    pub _parent: SharedType<Lip>,
    pub _self: SharedType<Self>,
    file_type: RefCell<String>,
    file_version: RefCell<String>,
    length: RefCell<f32>,
    num_keyframes: RefCell<u32>,
    keyframes: RefCell<Vec<OptRc<Lip_KeyframeEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lip {
    type Root = Lip;
    type Parent = Lip;

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
        *self_rc.length.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.num_keyframes.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.keyframes.borrow_mut() = Vec::new();
        let l_keyframes = *self_rc.num_keyframes();
        for _i in 0..l_keyframes {
            let t = Self::read_into::<_, Lip_KeyframeEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.keyframes.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Lip {
}

/**
 * File type signature. Must be "LIP " (space-padded) for LIP files.
 */
impl Lip {
    pub fn file_type(&self) -> Ref<'_, String> {
        self.file_type.borrow()
    }
}

/**
 * File format version. Must be "V1.0" for LIP files.
 */
impl Lip {
    pub fn file_version(&self) -> Ref<'_, String> {
        self.file_version.borrow()
    }
}

/**
 * Duration in seconds. Must equal the paired WAV file playback time for
 * glitch-free animation. This is the total length of the lip sync animation.
 */
impl Lip {
    pub fn length(&self) -> Ref<'_, f32> {
        self.length.borrow()
    }
}

/**
 * Number of keyframes immediately following. Each keyframe contains a timestamp
 * and a viseme shape index. Keyframes should be sorted ascending by timestamp.
 */
impl Lip {
    pub fn num_keyframes(&self) -> Ref<'_, u32> {
        self.num_keyframes.borrow()
    }
}

/**
 * Array of keyframe entries. Each entry maps a timestamp to a mouth shape.
 * Entries must be stored in chronological order (ascending by timestamp).
 */
impl Lip {
    pub fn keyframes(&self) -> Ref<'_, Vec<OptRc<Lip_KeyframeEntry>>> {
        self.keyframes.borrow()
    }
}
impl Lip {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Lip_LipShapes {
    Neutral,
    Ee,
    Eh,
    Ah,
    Oh,
    Ooh,
    Y,
    Sts,
    Fv,
    Ng,
    Th,
    Mpb,
    Td,
    Sh,
    L,
    Kg,
    Unknown(i64),
}

impl TryFrom<i64> for Lip_LipShapes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Lip_LipShapes> {
        match flag {
            0 => Ok(Lip_LipShapes::Neutral),
            1 => Ok(Lip_LipShapes::Ee),
            2 => Ok(Lip_LipShapes::Eh),
            3 => Ok(Lip_LipShapes::Ah),
            4 => Ok(Lip_LipShapes::Oh),
            5 => Ok(Lip_LipShapes::Ooh),
            6 => Ok(Lip_LipShapes::Y),
            7 => Ok(Lip_LipShapes::Sts),
            8 => Ok(Lip_LipShapes::Fv),
            9 => Ok(Lip_LipShapes::Ng),
            10 => Ok(Lip_LipShapes::Th),
            11 => Ok(Lip_LipShapes::Mpb),
            12 => Ok(Lip_LipShapes::Td),
            13 => Ok(Lip_LipShapes::Sh),
            14 => Ok(Lip_LipShapes::L),
            15 => Ok(Lip_LipShapes::Kg),
            _ => Ok(Lip_LipShapes::Unknown(flag)),
        }
    }
}

impl From<&Lip_LipShapes> for i64 {
    fn from(v: &Lip_LipShapes) -> Self {
        match *v {
            Lip_LipShapes::Neutral => 0,
            Lip_LipShapes::Ee => 1,
            Lip_LipShapes::Eh => 2,
            Lip_LipShapes::Ah => 3,
            Lip_LipShapes::Oh => 4,
            Lip_LipShapes::Ooh => 5,
            Lip_LipShapes::Y => 6,
            Lip_LipShapes::Sts => 7,
            Lip_LipShapes::Fv => 8,
            Lip_LipShapes::Ng => 9,
            Lip_LipShapes::Th => 10,
            Lip_LipShapes::Mpb => 11,
            Lip_LipShapes::Td => 12,
            Lip_LipShapes::Sh => 13,
            Lip_LipShapes::L => 14,
            Lip_LipShapes::Kg => 15,
            Lip_LipShapes::Unknown(v) => v
        }
    }
}

impl Default for Lip_LipShapes {
    fn default() -> Self { Lip_LipShapes::Unknown(0) }
}


/**
 * A single keyframe entry mapping a timestamp to a viseme (mouth shape).
 * Keyframes are used by the engine to interpolate between mouth shapes during
 * audio playback to create lip sync animation.
 */

#[derive(Default, Debug, Clone)]
pub struct Lip_KeyframeEntry {
    pub _root: SharedType<Lip>,
    pub _parent: SharedType<Lip>,
    pub _self: SharedType<Self>,
    timestamp: RefCell<f32>,
    shape: RefCell<Lip_LipShapes>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lip_KeyframeEntry {
    type Root = Lip;
    type Parent = Lip;

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
        *self_rc.timestamp.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.shape.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        Ok(())
    }
}
impl Lip_KeyframeEntry {
}

/**
 * Seconds from animation start. Must be >= 0 and <= length.
 * Keyframes should be sorted ascending by timestamp.
 */
impl Lip_KeyframeEntry {
    pub fn timestamp(&self) -> Ref<'_, f32> {
        self.timestamp.borrow()
    }
}

/**
 * Viseme index (0-15) indicating which mouth shape to use at this timestamp.
 * Uses the 16-shape Preston Blair phoneme set. See lip_shapes enum for details.
 */
impl Lip_KeyframeEntry {
    pub fn shape(&self) -> Ref<'_, Lip_LipShapes> {
        self.shape.borrow()
    }
}
impl Lip_KeyframeEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
