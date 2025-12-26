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
 * LTR (Letter) resources store third-order Markov chain probability tables that the game uses
 * to procedurally generate NPC names. The data encodes likelihoods for characters appearing at
 * the start, middle, and end of names given zero, one, or two-character context.
 * 
 * KotOR always uses the 28-character alphabet (a-z plus ' and -). Neverwinter Nights (NWN) used
 * 26 characters; the header explicitly stores the count. This is a KotOR-specific difference from NWN.
 * 
 * LTR files are binary and consist of a short header followed by three probability tables
 * (singles, doubles, triples) stored as contiguous float arrays.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/LTR-File-Format.md
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/ltrreader.cpp:27-74
 * - https://github.com/xoreos/xoreos/blob/master/src/aurora/ltrfile.cpp:135-168
 * - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/LTRObject.ts:61-117
 */

#[derive(Default, Debug, Clone)]
pub struct Ltr {
    pub _root: SharedType<Ltr>,
    pub _parent: SharedType<Ltr>,
    pub _self: SharedType<Self>,
    file_type: RefCell<String>,
    file_version: RefCell<String>,
    letter_count: RefCell<u8>,
    single_letter_block: RefCell<OptRc<Ltr_LetterBlock>>,
    double_letter_blocks: RefCell<OptRc<Ltr_DoubleLetterBlocksArray>>,
    triple_letter_blocks: RefCell<OptRc<Ltr_TripleLetterBlocksArray>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ltr {
    type Root = Ltr;
    type Parent = Ltr;

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
        *self_rc.letter_count.borrow_mut() = _io.read_u1()?.into();
        let t = Self::read_into::<_, Ltr_LetterBlock>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.single_letter_block.borrow_mut() = t;
        let t = Self::read_into::<_, Ltr_DoubleLetterBlocksArray>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.double_letter_blocks.borrow_mut() = t;
        let t = Self::read_into::<_, Ltr_TripleLetterBlocksArray>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.triple_letter_blocks.borrow_mut() = t;
        Ok(())
    }
}
impl Ltr {
}

/**
 * File type signature. Must be "LTR " (space-padded) for LTR files.
 */
impl Ltr {
    pub fn file_type(&self) -> Ref<'_, String> {
        self.file_type.borrow()
    }
}

/**
 * File format version. Must be "V1.0" for LTR files.
 */
impl Ltr {
    pub fn file_version(&self) -> Ref<'_, String> {
        self.file_version.borrow()
    }
}

/**
 * Number of characters in the alphabet. Must be 26 (NWN) or 28 (KotOR).
 * KotOR uses 28 characters: "abcdefghijklmnopqrstuvwxyz'-"
 * NWN uses 26 characters: "abcdefghijklmnopqrstuvwxyz"
 */
impl Ltr {
    pub fn letter_count(&self) -> Ref<'_, u8> {
        self.letter_count.borrow()
    }
}

/**
 * Single-letter probability block (no context).
 * Used for generating the first character of names.
 * Contains start/middle/end probability arrays, each with letter_count floats.
 * Total size: letter_count × 3 × 4 bytes = 336 bytes for KotOR (28 chars).
 */
impl Ltr {
    pub fn single_letter_block(&self) -> Ref<'_, OptRc<Ltr_LetterBlock>> {
        self.single_letter_block.borrow()
    }
}

/**
 * Double-letter probability blocks (1-character context).
 * Array of letter_count blocks, each indexed by the previous character.
 * Used for generating the second character based on the first character.
 * Each block contains start/middle/end probability arrays.
 * Total size: letter_count × 3 × letter_count × 4 bytes = 9,408 bytes for KotOR.
 */
impl Ltr {
    pub fn double_letter_blocks(&self) -> Ref<'_, OptRc<Ltr_DoubleLetterBlocksArray>> {
        self.double_letter_blocks.borrow()
    }
}

/**
 * Triple-letter probability blocks (2-character context).
 * Two-dimensional array of letter_count × letter_count blocks.
 * Each block is indexed by the previous two characters.
 * Used for generating third and subsequent characters.
 * Each block contains start/middle/end probability arrays.
 * Total size: letter_count × letter_count × 3 × letter_count × 4 bytes = 73,472 bytes for KotOR.
 */
impl Ltr {
    pub fn triple_letter_blocks(&self) -> Ref<'_, OptRc<Ltr_TripleLetterBlocksArray>> {
        self.triple_letter_blocks.borrow()
    }
}
impl Ltr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Array of double-letter blocks. One block per character in the alphabet.
 * Each block is indexed by the previous character (context length 1).
 */

#[derive(Default, Debug, Clone)]
pub struct Ltr_DoubleLetterBlocksArray {
    pub _root: SharedType<Ltr>,
    pub _parent: SharedType<Ltr>,
    pub _self: SharedType<Self>,
    blocks: RefCell<Vec<OptRc<Ltr_LetterBlock>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ltr_DoubleLetterBlocksArray {
    type Root = Ltr;
    type Parent = Ltr;

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
        *self_rc.blocks.borrow_mut() = Vec::new();
        let l_blocks = *_r.letter_count();
        for _i in 0..l_blocks {
            let t = Self::read_into::<_, Ltr_LetterBlock>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.blocks.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Ltr_DoubleLetterBlocksArray {
}

/**
 * Array of letter_count blocks, each containing start/middle/end probability arrays.
 * Block index corresponds to the previous character in the alphabet.
 */
impl Ltr_DoubleLetterBlocksArray {
    pub fn blocks(&self) -> Ref<'_, Vec<OptRc<Ltr_LetterBlock>>> {
        self.blocks.borrow()
    }
}
impl Ltr_DoubleLetterBlocksArray {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A probability block containing three arrays of probabilities (start, middle, end).
 * Each array has letter_count floats representing cumulative probabilities for each character
 * in the alphabet appearing at that position (start, middle, or end of name).
 * 
 * Blocks store cumulative probabilities (monotonically increasing floats) that are compared
 * against random roll values during name generation.
 */

#[derive(Default, Debug, Clone)]
pub struct Ltr_LetterBlock {
    pub _root: SharedType<Ltr>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    start_probabilities: RefCell<Vec<f32>>,
    middle_probabilities: RefCell<Vec<f32>>,
    end_probabilities: RefCell<Vec<f32>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ltr_LetterBlock {
    type Root = Ltr;
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
        *self_rc.start_probabilities.borrow_mut() = Vec::new();
        let l_start_probabilities = *_r.letter_count();
        for _i in 0..l_start_probabilities {
            self_rc.start_probabilities.borrow_mut().push(_io.read_f4le()?.into());
        }
        *self_rc.middle_probabilities.borrow_mut() = Vec::new();
        let l_middle_probabilities = *_r.letter_count();
        for _i in 0..l_middle_probabilities {
            self_rc.middle_probabilities.borrow_mut().push(_io.read_f4le()?.into());
        }
        *self_rc.end_probabilities.borrow_mut() = Vec::new();
        let l_end_probabilities = *_r.letter_count();
        for _i in 0..l_end_probabilities {
            self_rc.end_probabilities.borrow_mut().push(_io.read_f4le()?.into());
        }
        Ok(())
    }
}
impl Ltr_LetterBlock {
}

/**
 * Array of start probabilities. One float per character in alphabet.
 * Probability of each letter starting a name (no context for singles,
 * after previous character for doubles, after previous two for triples).
 */
impl Ltr_LetterBlock {
    pub fn start_probabilities(&self) -> Ref<'_, Vec<f32>> {
        self.start_probabilities.borrow()
    }
}

/**
 * Array of middle probabilities. One float per character in alphabet.
 * Probability of each letter appearing in the middle of a name.
 */
impl Ltr_LetterBlock {
    pub fn middle_probabilities(&self) -> Ref<'_, Vec<f32>> {
        self.middle_probabilities.borrow()
    }
}

/**
 * Array of end probabilities. One float per character in alphabet.
 * Probability of each letter ending a name.
 */
impl Ltr_LetterBlock {
    pub fn end_probabilities(&self) -> Ref<'_, Vec<f32>> {
        self.end_probabilities.borrow()
    }
}
impl Ltr_LetterBlock {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Two-dimensional array of triple-letter blocks. letter_count × letter_count blocks total.
 * Each block is indexed by the previous two characters (context length 2).
 */

#[derive(Default, Debug, Clone)]
pub struct Ltr_TripleLetterBlocksArray {
    pub _root: SharedType<Ltr>,
    pub _parent: SharedType<Ltr>,
    pub _self: SharedType<Self>,
    rows: RefCell<Vec<OptRc<Ltr_TripleLetterRow>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ltr_TripleLetterBlocksArray {
    type Root = Ltr;
    type Parent = Ltr;

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
        *self_rc.rows.borrow_mut() = Vec::new();
        let l_rows = *_r.letter_count();
        for _i in 0..l_rows {
            let t = Self::read_into::<_, Ltr_TripleLetterRow>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.rows.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Ltr_TripleLetterBlocksArray {
}

/**
 * Array of letter_count rows, each containing letter_count blocks.
 * First index corresponds to the second-to-last character.
 * Second index corresponds to the last character.
 */
impl Ltr_TripleLetterBlocksArray {
    pub fn rows(&self) -> Ref<'_, Vec<OptRc<Ltr_TripleLetterRow>>> {
        self.rows.borrow()
    }
}
impl Ltr_TripleLetterBlocksArray {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A row in the triple-letter blocks array. Contains letter_count blocks,
 * each indexed by the last character in the two-character context.
 */

#[derive(Default, Debug, Clone)]
pub struct Ltr_TripleLetterRow {
    pub _root: SharedType<Ltr>,
    pub _parent: SharedType<Ltr_TripleLetterBlocksArray>,
    pub _self: SharedType<Self>,
    blocks: RefCell<Vec<OptRc<Ltr_LetterBlock>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ltr_TripleLetterRow {
    type Root = Ltr;
    type Parent = Ltr_TripleLetterBlocksArray;

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
        *self_rc.blocks.borrow_mut() = Vec::new();
        let l_blocks = *_r.letter_count();
        for _i in 0..l_blocks {
            let t = Self::read_into::<_, Ltr_LetterBlock>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.blocks.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Ltr_TripleLetterRow {
}

/**
 * Array of letter_count blocks, each containing start/middle/end probability arrays.
 * Block index corresponds to the last character in the two-character context.
 */
impl Ltr_TripleLetterRow {
    pub fn blocks(&self) -> Ref<'_, Vec<OptRc<Ltr_LetterBlock>>> {
        self.blocks.borrow()
    }
}
impl Ltr_TripleLetterRow {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
