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
 * KEY files serve as the master index for all BIF files in the game.
 * They map resource names (ResRefs) and types to specific locations within BIF archives.
 * 
 * The KEY file contains:
 * - BIF file entries (filename, size, location)
 * - KEY entries mapping ResRef + ResourceType to Resource ID
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/KEY-File-Format.md
 * - https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/key.html
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/keyreader.cpp
 */

#[derive(Default, Debug, Clone)]
pub struct Key {
    pub _root: SharedType<Key>,
    pub _parent: SharedType<Key>,
    pub _self: SharedType<Self>,
    file_type: RefCell<String>,
    file_version: RefCell<String>,
    bif_count: RefCell<u32>,
    key_count: RefCell<u32>,
    file_table_offset: RefCell<u32>,
    key_table_offset: RefCell<u32>,
    build_year: RefCell<u32>,
    build_day: RefCell<u32>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_file_table: Cell<bool>,
    file_table: RefCell<OptRc<Key_FileTable>>,
    f_key_table: Cell<bool>,
    key_table: RefCell<OptRc<Key_KeyTable>>,
}
impl KStruct for Key {
    type Root = Key;
    type Parent = Key;

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
        if !(*self_rc.file_type() == "KEY ".to_string()) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.file_version.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        if !( ((*self_rc.file_version() == "V1  ".to_string()) || (*self_rc.file_version() == "V1.1".to_string())) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/seq/1".to_string() }));
        }
        *self_rc.bif_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.key_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.file_table_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.key_table_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.build_year.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.build_day.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        Ok(())
    }
}
impl Key {

    /**
     * File table containing BIF file entries.
     */
    pub fn file_table(
        &self
    ) -> KResult<Ref<'_, OptRc<Key_FileTable>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_file_table.get() {
            return Ok(self.file_table.borrow());
        }
        if ((*self.bif_count() as u32) > (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.file_table_offset() as usize)?;
            let t = Self::read_into::<_, Key_FileTable>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.file_table.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.file_table.borrow())
    }

    /**
     * KEY table containing resource entries.
     */
    pub fn key_table(
        &self
    ) -> KResult<Ref<'_, OptRc<Key_KeyTable>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_key_table.get() {
            return Ok(self.key_table.borrow());
        }
        if ((*self.key_count() as u32) > (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.key_table_offset() as usize)?;
            let t = Self::read_into::<_, Key_KeyTable>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.key_table.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.key_table.borrow())
    }
}

/**
 * File type signature. Must be "KEY " (space-padded).
 */
impl Key {
    pub fn file_type(&self) -> Ref<'_, String> {
        self.file_type.borrow()
    }
}

/**
 * File format version. Typically "V1  " or "V1.1".
 */
impl Key {
    pub fn file_version(&self) -> Ref<'_, String> {
        self.file_version.borrow()
    }
}

/**
 * Number of BIF files referenced by this KEY file.
 */
impl Key {
    pub fn bif_count(&self) -> Ref<'_, u32> {
        self.bif_count.borrow()
    }
}

/**
 * Number of resource entries in the KEY table.
 */
impl Key {
    pub fn key_count(&self) -> Ref<'_, u32> {
        self.key_count.borrow()
    }
}

/**
 * Byte offset to the file table from the beginning of the file.
 */
impl Key {
    pub fn file_table_offset(&self) -> Ref<'_, u32> {
        self.file_table_offset.borrow()
    }
}

/**
 * Byte offset to the KEY table from the beginning of the file.
 */
impl Key {
    pub fn key_table_offset(&self) -> Ref<'_, u32> {
        self.key_table_offset.borrow()
    }
}

/**
 * Build year (years since 1900).
 */
impl Key {
    pub fn build_year(&self) -> Ref<'_, u32> {
        self.build_year.borrow()
    }
}

/**
 * Build day (days since January 1).
 */
impl Key {
    pub fn build_day(&self) -> Ref<'_, u32> {
        self.build_day.borrow()
    }
}

/**
 * Reserved padding (usually zeros).
 */
impl Key {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Key {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Key_XoreosFileTypeId {
    None,
    Res,
    Bmp,
    Mve,
    Tga,
    Wav,
    Plt,
    Ini,
    Bmu,
    Mpg,
    Txt,
    Wma,
    Wmv,
    Xmv,
    Plh,
    Tex,
    Mdl,
    Thg,
    Fnt,
    Lua,
    Slt,
    Nss,
    Ncs,
    Mod,
    Are,
    Set,
    Ifo,
    Bic,
    Wok,
    TwoDa,
    Tlk,
    Txi,
    Git,
    Bti,
    Uti,
    Btc,
    Utc,
    Dlg,
    Itp,
    Btt,
    Utt,
    Dds,
    Bts,
    Uts,
    Ltr,
    Gff,
    Fac,
    Bte,
    Ute,
    Btd,
    Utd,
    Btp,
    Utp,
    Dft,
    Gic,
    Gui,
    Css,
    Ccs,
    Btm,
    Utm,
    Dwk,
    Pwk,
    Btg,
    Utg,
    Jrl,
    Sav,
    Utw,
    FourPc,
    Ssf,
    Hak,
    Nwm,
    Bik,
    Ndb,
    Ptm,
    Ptt,
    Ncm,
    Mfx,
    Mat,
    Mdb,
    Say,
    Ttf,
    Ttc,
    Cut,
    Ka,
    Jpg,
    Ico,
    Ogg,
    Spt,
    Spw,
    Wfx,
    Ugm,
    Qdb,
    Qst,
    Npc,
    Spn,
    Utx,
    Mmd,
    Smm,
    Uta,
    Mde,
    Mdv,
    Mda,
    Mba,
    Oct,
    Bfx,
    Pdb,
    TheWitcherSave,
    Pvs,
    Cfx,
    Luc,
    Prb,
    Cam,
    Vds,
    Bin,
    Wob,
    Api,
    Properties,
    Png,
    Lyt,
    Vis,
    Rim,
    Pth,
    Lip,
    Bwm,
    Txb,
    Tpc,
    Mdx,
    Rsv,
    Sig,
    Mab,
    Qst2,
    Sto,
    Hex,
    Mdx2,
    Txb2,
    Fsm,
    Art,
    Amp,
    Cwa,
    Bip,
    Mdb2,
    Mda2,
    Spt2,
    Gr2,
    Fxa,
    Fxe,
    Jpg2,
    Pwc,
    OneDa,
    Erf,
    Bif,
    Key,
    Exe,
    Dbf,
    Cdx,
    Fpt,
    Zip,
    Fxm,
    Fxs,
    Xml,
    Wlk,
    Utr,
    Sef,
    Pfx,
    Tfx,
    Ifx,
    Lfx,
    Bbx,
    Pfb,
    Upe,
    Usc,
    Ult,
    Fx,
    Max,
    Doc,
    Scc,
    Wmp,
    Osc,
    Trn,
    Uen,
    Ros,
    Rst,
    Ptx,
    Ltx,
    Trx,
    Nds,
    Herf,
    Dict,
    Small,
    Cbgt,
    Cdpth,
    Emit,
    Itm,
    Nanr,
    Nbfp,
    Nbfs,
    Ncer,
    Ncgr,
    Nclr,
    Nftr,
    Nsbca,
    Nsbmd,
    Nsbta,
    Nsbtp,
    Nsbtx,
    Pal,
    Raw,
    Sadl,
    Sdat,
    Smp,
    Spl,
    Vx,
    Anb,
    Ani,
    Cns,
    Cur,
    Evt,
    Fdl,
    Fxo,
    Gad,
    Gda,
    Gfx,
    Ldf,
    Lst,
    Mal,
    Mao,
    Mmh,
    Mop,
    Mor,
    Msh,
    Mtx,
    Ncc,
    Phy,
    Plo,
    Stg,
    Tbi,
    Tnt,
    Arl,
    Fev,
    Fsb,
    Opf,
    Crf,
    Rimp,
    Met,
    Meta,
    Fxr,
    Cif,
    Cub,
    Dlb,
    Nsc,
    Mov,
    Curs,
    Pict,
    Rsrc,
    Plist,
    Cre,
    Pso,
    Vso,
    Abc,
    Sbm,
    Pvd,
    Pla,
    Trg,
    Pk,
    Als,
    Apl,
    Assembly,
    Bak,
    Bnk,
    Cl,
    Cnv,
    Con,
    Dat,
    Dx11,
    Ids,
    Log,
    Map,
    Mml,
    Mp3,
    Pck,
    Rml,
    S,
    Sta,
    Svr,
    Vlm,
    Wbd,
    Xbx,
    Xls,
    Bzf,
    Adv,
    Json,
    TlkExpert,
    TlkMobile,
    TlkTouch,
    Otf,
    Par,
    Xwb,
    Xsb,
    Xds,
    Wnd,
    Xeositex,
    Unknown(i64),
}

impl TryFrom<i64> for Key_XoreosFileTypeId {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Key_XoreosFileTypeId> {
        match flag {
            -1 => Ok(Key_XoreosFileTypeId::None),
            0 => Ok(Key_XoreosFileTypeId::Res),
            1 => Ok(Key_XoreosFileTypeId::Bmp),
            2 => Ok(Key_XoreosFileTypeId::Mve),
            3 => Ok(Key_XoreosFileTypeId::Tga),
            4 => Ok(Key_XoreosFileTypeId::Wav),
            6 => Ok(Key_XoreosFileTypeId::Plt),
            7 => Ok(Key_XoreosFileTypeId::Ini),
            8 => Ok(Key_XoreosFileTypeId::Bmu),
            9 => Ok(Key_XoreosFileTypeId::Mpg),
            10 => Ok(Key_XoreosFileTypeId::Txt),
            11 => Ok(Key_XoreosFileTypeId::Wma),
            12 => Ok(Key_XoreosFileTypeId::Wmv),
            13 => Ok(Key_XoreosFileTypeId::Xmv),
            2000 => Ok(Key_XoreosFileTypeId::Plh),
            2001 => Ok(Key_XoreosFileTypeId::Tex),
            2002 => Ok(Key_XoreosFileTypeId::Mdl),
            2003 => Ok(Key_XoreosFileTypeId::Thg),
            2005 => Ok(Key_XoreosFileTypeId::Fnt),
            2007 => Ok(Key_XoreosFileTypeId::Lua),
            2008 => Ok(Key_XoreosFileTypeId::Slt),
            2009 => Ok(Key_XoreosFileTypeId::Nss),
            2010 => Ok(Key_XoreosFileTypeId::Ncs),
            2011 => Ok(Key_XoreosFileTypeId::Mod),
            2012 => Ok(Key_XoreosFileTypeId::Are),
            2013 => Ok(Key_XoreosFileTypeId::Set),
            2014 => Ok(Key_XoreosFileTypeId::Ifo),
            2015 => Ok(Key_XoreosFileTypeId::Bic),
            2016 => Ok(Key_XoreosFileTypeId::Wok),
            2017 => Ok(Key_XoreosFileTypeId::TwoDa),
            2018 => Ok(Key_XoreosFileTypeId::Tlk),
            2022 => Ok(Key_XoreosFileTypeId::Txi),
            2023 => Ok(Key_XoreosFileTypeId::Git),
            2024 => Ok(Key_XoreosFileTypeId::Bti),
            2025 => Ok(Key_XoreosFileTypeId::Uti),
            2026 => Ok(Key_XoreosFileTypeId::Btc),
            2027 => Ok(Key_XoreosFileTypeId::Utc),
            2029 => Ok(Key_XoreosFileTypeId::Dlg),
            2030 => Ok(Key_XoreosFileTypeId::Itp),
            2031 => Ok(Key_XoreosFileTypeId::Btt),
            2032 => Ok(Key_XoreosFileTypeId::Utt),
            2033 => Ok(Key_XoreosFileTypeId::Dds),
            2034 => Ok(Key_XoreosFileTypeId::Bts),
            2035 => Ok(Key_XoreosFileTypeId::Uts),
            2036 => Ok(Key_XoreosFileTypeId::Ltr),
            2037 => Ok(Key_XoreosFileTypeId::Gff),
            2038 => Ok(Key_XoreosFileTypeId::Fac),
            2039 => Ok(Key_XoreosFileTypeId::Bte),
            2040 => Ok(Key_XoreosFileTypeId::Ute),
            2041 => Ok(Key_XoreosFileTypeId::Btd),
            2042 => Ok(Key_XoreosFileTypeId::Utd),
            2043 => Ok(Key_XoreosFileTypeId::Btp),
            2044 => Ok(Key_XoreosFileTypeId::Utp),
            2045 => Ok(Key_XoreosFileTypeId::Dft),
            2046 => Ok(Key_XoreosFileTypeId::Gic),
            2047 => Ok(Key_XoreosFileTypeId::Gui),
            2048 => Ok(Key_XoreosFileTypeId::Css),
            2049 => Ok(Key_XoreosFileTypeId::Ccs),
            2050 => Ok(Key_XoreosFileTypeId::Btm),
            2051 => Ok(Key_XoreosFileTypeId::Utm),
            2052 => Ok(Key_XoreosFileTypeId::Dwk),
            2053 => Ok(Key_XoreosFileTypeId::Pwk),
            2054 => Ok(Key_XoreosFileTypeId::Btg),
            2055 => Ok(Key_XoreosFileTypeId::Utg),
            2056 => Ok(Key_XoreosFileTypeId::Jrl),
            2057 => Ok(Key_XoreosFileTypeId::Sav),
            2058 => Ok(Key_XoreosFileTypeId::Utw),
            2059 => Ok(Key_XoreosFileTypeId::FourPc),
            2060 => Ok(Key_XoreosFileTypeId::Ssf),
            2061 => Ok(Key_XoreosFileTypeId::Hak),
            2062 => Ok(Key_XoreosFileTypeId::Nwm),
            2063 => Ok(Key_XoreosFileTypeId::Bik),
            2064 => Ok(Key_XoreosFileTypeId::Ndb),
            2065 => Ok(Key_XoreosFileTypeId::Ptm),
            2066 => Ok(Key_XoreosFileTypeId::Ptt),
            2067 => Ok(Key_XoreosFileTypeId::Ncm),
            2068 => Ok(Key_XoreosFileTypeId::Mfx),
            2069 => Ok(Key_XoreosFileTypeId::Mat),
            2070 => Ok(Key_XoreosFileTypeId::Mdb),
            2071 => Ok(Key_XoreosFileTypeId::Say),
            2072 => Ok(Key_XoreosFileTypeId::Ttf),
            2073 => Ok(Key_XoreosFileTypeId::Ttc),
            2074 => Ok(Key_XoreosFileTypeId::Cut),
            2075 => Ok(Key_XoreosFileTypeId::Ka),
            2076 => Ok(Key_XoreosFileTypeId::Jpg),
            2077 => Ok(Key_XoreosFileTypeId::Ico),
            2078 => Ok(Key_XoreosFileTypeId::Ogg),
            2079 => Ok(Key_XoreosFileTypeId::Spt),
            2080 => Ok(Key_XoreosFileTypeId::Spw),
            2081 => Ok(Key_XoreosFileTypeId::Wfx),
            2082 => Ok(Key_XoreosFileTypeId::Ugm),
            2083 => Ok(Key_XoreosFileTypeId::Qdb),
            2084 => Ok(Key_XoreosFileTypeId::Qst),
            2085 => Ok(Key_XoreosFileTypeId::Npc),
            2086 => Ok(Key_XoreosFileTypeId::Spn),
            2087 => Ok(Key_XoreosFileTypeId::Utx),
            2088 => Ok(Key_XoreosFileTypeId::Mmd),
            2089 => Ok(Key_XoreosFileTypeId::Smm),
            2090 => Ok(Key_XoreosFileTypeId::Uta),
            2091 => Ok(Key_XoreosFileTypeId::Mde),
            2092 => Ok(Key_XoreosFileTypeId::Mdv),
            2093 => Ok(Key_XoreosFileTypeId::Mda),
            2094 => Ok(Key_XoreosFileTypeId::Mba),
            2095 => Ok(Key_XoreosFileTypeId::Oct),
            2096 => Ok(Key_XoreosFileTypeId::Bfx),
            2097 => Ok(Key_XoreosFileTypeId::Pdb),
            2098 => Ok(Key_XoreosFileTypeId::TheWitcherSave),
            2099 => Ok(Key_XoreosFileTypeId::Pvs),
            2100 => Ok(Key_XoreosFileTypeId::Cfx),
            2101 => Ok(Key_XoreosFileTypeId::Luc),
            2103 => Ok(Key_XoreosFileTypeId::Prb),
            2104 => Ok(Key_XoreosFileTypeId::Cam),
            2105 => Ok(Key_XoreosFileTypeId::Vds),
            2106 => Ok(Key_XoreosFileTypeId::Bin),
            2107 => Ok(Key_XoreosFileTypeId::Wob),
            2108 => Ok(Key_XoreosFileTypeId::Api),
            2109 => Ok(Key_XoreosFileTypeId::Properties),
            2110 => Ok(Key_XoreosFileTypeId::Png),
            3000 => Ok(Key_XoreosFileTypeId::Lyt),
            3001 => Ok(Key_XoreosFileTypeId::Vis),
            3002 => Ok(Key_XoreosFileTypeId::Rim),
            3003 => Ok(Key_XoreosFileTypeId::Pth),
            3004 => Ok(Key_XoreosFileTypeId::Lip),
            3005 => Ok(Key_XoreosFileTypeId::Bwm),
            3006 => Ok(Key_XoreosFileTypeId::Txb),
            3007 => Ok(Key_XoreosFileTypeId::Tpc),
            3008 => Ok(Key_XoreosFileTypeId::Mdx),
            3009 => Ok(Key_XoreosFileTypeId::Rsv),
            3010 => Ok(Key_XoreosFileTypeId::Sig),
            3011 => Ok(Key_XoreosFileTypeId::Mab),
            3012 => Ok(Key_XoreosFileTypeId::Qst2),
            3013 => Ok(Key_XoreosFileTypeId::Sto),
            3015 => Ok(Key_XoreosFileTypeId::Hex),
            3016 => Ok(Key_XoreosFileTypeId::Mdx2),
            3017 => Ok(Key_XoreosFileTypeId::Txb2),
            3022 => Ok(Key_XoreosFileTypeId::Fsm),
            3023 => Ok(Key_XoreosFileTypeId::Art),
            3024 => Ok(Key_XoreosFileTypeId::Amp),
            3025 => Ok(Key_XoreosFileTypeId::Cwa),
            3028 => Ok(Key_XoreosFileTypeId::Bip),
            4000 => Ok(Key_XoreosFileTypeId::Mdb2),
            4001 => Ok(Key_XoreosFileTypeId::Mda2),
            4002 => Ok(Key_XoreosFileTypeId::Spt2),
            4003 => Ok(Key_XoreosFileTypeId::Gr2),
            4004 => Ok(Key_XoreosFileTypeId::Fxa),
            4005 => Ok(Key_XoreosFileTypeId::Fxe),
            4007 => Ok(Key_XoreosFileTypeId::Jpg2),
            4008 => Ok(Key_XoreosFileTypeId::Pwc),
            9996 => Ok(Key_XoreosFileTypeId::OneDa),
            9997 => Ok(Key_XoreosFileTypeId::Erf),
            9998 => Ok(Key_XoreosFileTypeId::Bif),
            9999 => Ok(Key_XoreosFileTypeId::Key),
            19000 => Ok(Key_XoreosFileTypeId::Exe),
            19001 => Ok(Key_XoreosFileTypeId::Dbf),
            19002 => Ok(Key_XoreosFileTypeId::Cdx),
            19003 => Ok(Key_XoreosFileTypeId::Fpt),
            20000 => Ok(Key_XoreosFileTypeId::Zip),
            20001 => Ok(Key_XoreosFileTypeId::Fxm),
            20002 => Ok(Key_XoreosFileTypeId::Fxs),
            20003 => Ok(Key_XoreosFileTypeId::Xml),
            20004 => Ok(Key_XoreosFileTypeId::Wlk),
            20005 => Ok(Key_XoreosFileTypeId::Utr),
            20006 => Ok(Key_XoreosFileTypeId::Sef),
            20007 => Ok(Key_XoreosFileTypeId::Pfx),
            20008 => Ok(Key_XoreosFileTypeId::Tfx),
            20009 => Ok(Key_XoreosFileTypeId::Ifx),
            20010 => Ok(Key_XoreosFileTypeId::Lfx),
            20011 => Ok(Key_XoreosFileTypeId::Bbx),
            20012 => Ok(Key_XoreosFileTypeId::Pfb),
            20013 => Ok(Key_XoreosFileTypeId::Upe),
            20014 => Ok(Key_XoreosFileTypeId::Usc),
            20015 => Ok(Key_XoreosFileTypeId::Ult),
            20016 => Ok(Key_XoreosFileTypeId::Fx),
            20017 => Ok(Key_XoreosFileTypeId::Max),
            20018 => Ok(Key_XoreosFileTypeId::Doc),
            20019 => Ok(Key_XoreosFileTypeId::Scc),
            20020 => Ok(Key_XoreosFileTypeId::Wmp),
            20021 => Ok(Key_XoreosFileTypeId::Osc),
            20022 => Ok(Key_XoreosFileTypeId::Trn),
            20023 => Ok(Key_XoreosFileTypeId::Uen),
            20024 => Ok(Key_XoreosFileTypeId::Ros),
            20025 => Ok(Key_XoreosFileTypeId::Rst),
            20026 => Ok(Key_XoreosFileTypeId::Ptx),
            20027 => Ok(Key_XoreosFileTypeId::Ltx),
            20028 => Ok(Key_XoreosFileTypeId::Trx),
            21000 => Ok(Key_XoreosFileTypeId::Nds),
            21001 => Ok(Key_XoreosFileTypeId::Herf),
            21002 => Ok(Key_XoreosFileTypeId::Dict),
            21003 => Ok(Key_XoreosFileTypeId::Small),
            21004 => Ok(Key_XoreosFileTypeId::Cbgt),
            21005 => Ok(Key_XoreosFileTypeId::Cdpth),
            21006 => Ok(Key_XoreosFileTypeId::Emit),
            21007 => Ok(Key_XoreosFileTypeId::Itm),
            21008 => Ok(Key_XoreosFileTypeId::Nanr),
            21009 => Ok(Key_XoreosFileTypeId::Nbfp),
            21010 => Ok(Key_XoreosFileTypeId::Nbfs),
            21011 => Ok(Key_XoreosFileTypeId::Ncer),
            21012 => Ok(Key_XoreosFileTypeId::Ncgr),
            21013 => Ok(Key_XoreosFileTypeId::Nclr),
            21014 => Ok(Key_XoreosFileTypeId::Nftr),
            21015 => Ok(Key_XoreosFileTypeId::Nsbca),
            21016 => Ok(Key_XoreosFileTypeId::Nsbmd),
            21017 => Ok(Key_XoreosFileTypeId::Nsbta),
            21018 => Ok(Key_XoreosFileTypeId::Nsbtp),
            21019 => Ok(Key_XoreosFileTypeId::Nsbtx),
            21020 => Ok(Key_XoreosFileTypeId::Pal),
            21021 => Ok(Key_XoreosFileTypeId::Raw),
            21022 => Ok(Key_XoreosFileTypeId::Sadl),
            21023 => Ok(Key_XoreosFileTypeId::Sdat),
            21024 => Ok(Key_XoreosFileTypeId::Smp),
            21025 => Ok(Key_XoreosFileTypeId::Spl),
            21026 => Ok(Key_XoreosFileTypeId::Vx),
            22000 => Ok(Key_XoreosFileTypeId::Anb),
            22001 => Ok(Key_XoreosFileTypeId::Ani),
            22002 => Ok(Key_XoreosFileTypeId::Cns),
            22003 => Ok(Key_XoreosFileTypeId::Cur),
            22004 => Ok(Key_XoreosFileTypeId::Evt),
            22005 => Ok(Key_XoreosFileTypeId::Fdl),
            22006 => Ok(Key_XoreosFileTypeId::Fxo),
            22007 => Ok(Key_XoreosFileTypeId::Gad),
            22008 => Ok(Key_XoreosFileTypeId::Gda),
            22009 => Ok(Key_XoreosFileTypeId::Gfx),
            22010 => Ok(Key_XoreosFileTypeId::Ldf),
            22011 => Ok(Key_XoreosFileTypeId::Lst),
            22012 => Ok(Key_XoreosFileTypeId::Mal),
            22013 => Ok(Key_XoreosFileTypeId::Mao),
            22014 => Ok(Key_XoreosFileTypeId::Mmh),
            22015 => Ok(Key_XoreosFileTypeId::Mop),
            22016 => Ok(Key_XoreosFileTypeId::Mor),
            22017 => Ok(Key_XoreosFileTypeId::Msh),
            22018 => Ok(Key_XoreosFileTypeId::Mtx),
            22019 => Ok(Key_XoreosFileTypeId::Ncc),
            22020 => Ok(Key_XoreosFileTypeId::Phy),
            22021 => Ok(Key_XoreosFileTypeId::Plo),
            22022 => Ok(Key_XoreosFileTypeId::Stg),
            22023 => Ok(Key_XoreosFileTypeId::Tbi),
            22024 => Ok(Key_XoreosFileTypeId::Tnt),
            22025 => Ok(Key_XoreosFileTypeId::Arl),
            22026 => Ok(Key_XoreosFileTypeId::Fev),
            22027 => Ok(Key_XoreosFileTypeId::Fsb),
            22028 => Ok(Key_XoreosFileTypeId::Opf),
            22029 => Ok(Key_XoreosFileTypeId::Crf),
            22030 => Ok(Key_XoreosFileTypeId::Rimp),
            22031 => Ok(Key_XoreosFileTypeId::Met),
            22032 => Ok(Key_XoreosFileTypeId::Meta),
            22033 => Ok(Key_XoreosFileTypeId::Fxr),
            22034 => Ok(Key_XoreosFileTypeId::Cif),
            22035 => Ok(Key_XoreosFileTypeId::Cub),
            22036 => Ok(Key_XoreosFileTypeId::Dlb),
            22037 => Ok(Key_XoreosFileTypeId::Nsc),
            23000 => Ok(Key_XoreosFileTypeId::Mov),
            23001 => Ok(Key_XoreosFileTypeId::Curs),
            23002 => Ok(Key_XoreosFileTypeId::Pict),
            23003 => Ok(Key_XoreosFileTypeId::Rsrc),
            23004 => Ok(Key_XoreosFileTypeId::Plist),
            24000 => Ok(Key_XoreosFileTypeId::Cre),
            24001 => Ok(Key_XoreosFileTypeId::Pso),
            24002 => Ok(Key_XoreosFileTypeId::Vso),
            24003 => Ok(Key_XoreosFileTypeId::Abc),
            24004 => Ok(Key_XoreosFileTypeId::Sbm),
            24005 => Ok(Key_XoreosFileTypeId::Pvd),
            24006 => Ok(Key_XoreosFileTypeId::Pla),
            24007 => Ok(Key_XoreosFileTypeId::Trg),
            24008 => Ok(Key_XoreosFileTypeId::Pk),
            25000 => Ok(Key_XoreosFileTypeId::Als),
            25001 => Ok(Key_XoreosFileTypeId::Apl),
            25002 => Ok(Key_XoreosFileTypeId::Assembly),
            25003 => Ok(Key_XoreosFileTypeId::Bak),
            25004 => Ok(Key_XoreosFileTypeId::Bnk),
            25005 => Ok(Key_XoreosFileTypeId::Cl),
            25006 => Ok(Key_XoreosFileTypeId::Cnv),
            25007 => Ok(Key_XoreosFileTypeId::Con),
            25008 => Ok(Key_XoreosFileTypeId::Dat),
            25009 => Ok(Key_XoreosFileTypeId::Dx11),
            25010 => Ok(Key_XoreosFileTypeId::Ids),
            25011 => Ok(Key_XoreosFileTypeId::Log),
            25012 => Ok(Key_XoreosFileTypeId::Map),
            25013 => Ok(Key_XoreosFileTypeId::Mml),
            25014 => Ok(Key_XoreosFileTypeId::Mp3),
            25015 => Ok(Key_XoreosFileTypeId::Pck),
            25016 => Ok(Key_XoreosFileTypeId::Rml),
            25017 => Ok(Key_XoreosFileTypeId::S),
            25018 => Ok(Key_XoreosFileTypeId::Sta),
            25019 => Ok(Key_XoreosFileTypeId::Svr),
            25020 => Ok(Key_XoreosFileTypeId::Vlm),
            25021 => Ok(Key_XoreosFileTypeId::Wbd),
            25022 => Ok(Key_XoreosFileTypeId::Xbx),
            25023 => Ok(Key_XoreosFileTypeId::Xls),
            26000 => Ok(Key_XoreosFileTypeId::Bzf),
            27000 => Ok(Key_XoreosFileTypeId::Adv),
            28000 => Ok(Key_XoreosFileTypeId::Json),
            28001 => Ok(Key_XoreosFileTypeId::TlkExpert),
            28002 => Ok(Key_XoreosFileTypeId::TlkMobile),
            28003 => Ok(Key_XoreosFileTypeId::TlkTouch),
            28004 => Ok(Key_XoreosFileTypeId::Otf),
            28005 => Ok(Key_XoreosFileTypeId::Par),
            29000 => Ok(Key_XoreosFileTypeId::Xwb),
            29001 => Ok(Key_XoreosFileTypeId::Xsb),
            30000 => Ok(Key_XoreosFileTypeId::Xds),
            30001 => Ok(Key_XoreosFileTypeId::Wnd),
            40000 => Ok(Key_XoreosFileTypeId::Xeositex),
            _ => Ok(Key_XoreosFileTypeId::Unknown(flag)),
        }
    }
}

impl From<&Key_XoreosFileTypeId> for i64 {
    fn from(v: &Key_XoreosFileTypeId) -> Self {
        match *v {
            Key_XoreosFileTypeId::None => -1,
            Key_XoreosFileTypeId::Res => 0,
            Key_XoreosFileTypeId::Bmp => 1,
            Key_XoreosFileTypeId::Mve => 2,
            Key_XoreosFileTypeId::Tga => 3,
            Key_XoreosFileTypeId::Wav => 4,
            Key_XoreosFileTypeId::Plt => 6,
            Key_XoreosFileTypeId::Ini => 7,
            Key_XoreosFileTypeId::Bmu => 8,
            Key_XoreosFileTypeId::Mpg => 9,
            Key_XoreosFileTypeId::Txt => 10,
            Key_XoreosFileTypeId::Wma => 11,
            Key_XoreosFileTypeId::Wmv => 12,
            Key_XoreosFileTypeId::Xmv => 13,
            Key_XoreosFileTypeId::Plh => 2000,
            Key_XoreosFileTypeId::Tex => 2001,
            Key_XoreosFileTypeId::Mdl => 2002,
            Key_XoreosFileTypeId::Thg => 2003,
            Key_XoreosFileTypeId::Fnt => 2005,
            Key_XoreosFileTypeId::Lua => 2007,
            Key_XoreosFileTypeId::Slt => 2008,
            Key_XoreosFileTypeId::Nss => 2009,
            Key_XoreosFileTypeId::Ncs => 2010,
            Key_XoreosFileTypeId::Mod => 2011,
            Key_XoreosFileTypeId::Are => 2012,
            Key_XoreosFileTypeId::Set => 2013,
            Key_XoreosFileTypeId::Ifo => 2014,
            Key_XoreosFileTypeId::Bic => 2015,
            Key_XoreosFileTypeId::Wok => 2016,
            Key_XoreosFileTypeId::TwoDa => 2017,
            Key_XoreosFileTypeId::Tlk => 2018,
            Key_XoreosFileTypeId::Txi => 2022,
            Key_XoreosFileTypeId::Git => 2023,
            Key_XoreosFileTypeId::Bti => 2024,
            Key_XoreosFileTypeId::Uti => 2025,
            Key_XoreosFileTypeId::Btc => 2026,
            Key_XoreosFileTypeId::Utc => 2027,
            Key_XoreosFileTypeId::Dlg => 2029,
            Key_XoreosFileTypeId::Itp => 2030,
            Key_XoreosFileTypeId::Btt => 2031,
            Key_XoreosFileTypeId::Utt => 2032,
            Key_XoreosFileTypeId::Dds => 2033,
            Key_XoreosFileTypeId::Bts => 2034,
            Key_XoreosFileTypeId::Uts => 2035,
            Key_XoreosFileTypeId::Ltr => 2036,
            Key_XoreosFileTypeId::Gff => 2037,
            Key_XoreosFileTypeId::Fac => 2038,
            Key_XoreosFileTypeId::Bte => 2039,
            Key_XoreosFileTypeId::Ute => 2040,
            Key_XoreosFileTypeId::Btd => 2041,
            Key_XoreosFileTypeId::Utd => 2042,
            Key_XoreosFileTypeId::Btp => 2043,
            Key_XoreosFileTypeId::Utp => 2044,
            Key_XoreosFileTypeId::Dft => 2045,
            Key_XoreosFileTypeId::Gic => 2046,
            Key_XoreosFileTypeId::Gui => 2047,
            Key_XoreosFileTypeId::Css => 2048,
            Key_XoreosFileTypeId::Ccs => 2049,
            Key_XoreosFileTypeId::Btm => 2050,
            Key_XoreosFileTypeId::Utm => 2051,
            Key_XoreosFileTypeId::Dwk => 2052,
            Key_XoreosFileTypeId::Pwk => 2053,
            Key_XoreosFileTypeId::Btg => 2054,
            Key_XoreosFileTypeId::Utg => 2055,
            Key_XoreosFileTypeId::Jrl => 2056,
            Key_XoreosFileTypeId::Sav => 2057,
            Key_XoreosFileTypeId::Utw => 2058,
            Key_XoreosFileTypeId::FourPc => 2059,
            Key_XoreosFileTypeId::Ssf => 2060,
            Key_XoreosFileTypeId::Hak => 2061,
            Key_XoreosFileTypeId::Nwm => 2062,
            Key_XoreosFileTypeId::Bik => 2063,
            Key_XoreosFileTypeId::Ndb => 2064,
            Key_XoreosFileTypeId::Ptm => 2065,
            Key_XoreosFileTypeId::Ptt => 2066,
            Key_XoreosFileTypeId::Ncm => 2067,
            Key_XoreosFileTypeId::Mfx => 2068,
            Key_XoreosFileTypeId::Mat => 2069,
            Key_XoreosFileTypeId::Mdb => 2070,
            Key_XoreosFileTypeId::Say => 2071,
            Key_XoreosFileTypeId::Ttf => 2072,
            Key_XoreosFileTypeId::Ttc => 2073,
            Key_XoreosFileTypeId::Cut => 2074,
            Key_XoreosFileTypeId::Ka => 2075,
            Key_XoreosFileTypeId::Jpg => 2076,
            Key_XoreosFileTypeId::Ico => 2077,
            Key_XoreosFileTypeId::Ogg => 2078,
            Key_XoreosFileTypeId::Spt => 2079,
            Key_XoreosFileTypeId::Spw => 2080,
            Key_XoreosFileTypeId::Wfx => 2081,
            Key_XoreosFileTypeId::Ugm => 2082,
            Key_XoreosFileTypeId::Qdb => 2083,
            Key_XoreosFileTypeId::Qst => 2084,
            Key_XoreosFileTypeId::Npc => 2085,
            Key_XoreosFileTypeId::Spn => 2086,
            Key_XoreosFileTypeId::Utx => 2087,
            Key_XoreosFileTypeId::Mmd => 2088,
            Key_XoreosFileTypeId::Smm => 2089,
            Key_XoreosFileTypeId::Uta => 2090,
            Key_XoreosFileTypeId::Mde => 2091,
            Key_XoreosFileTypeId::Mdv => 2092,
            Key_XoreosFileTypeId::Mda => 2093,
            Key_XoreosFileTypeId::Mba => 2094,
            Key_XoreosFileTypeId::Oct => 2095,
            Key_XoreosFileTypeId::Bfx => 2096,
            Key_XoreosFileTypeId::Pdb => 2097,
            Key_XoreosFileTypeId::TheWitcherSave => 2098,
            Key_XoreosFileTypeId::Pvs => 2099,
            Key_XoreosFileTypeId::Cfx => 2100,
            Key_XoreosFileTypeId::Luc => 2101,
            Key_XoreosFileTypeId::Prb => 2103,
            Key_XoreosFileTypeId::Cam => 2104,
            Key_XoreosFileTypeId::Vds => 2105,
            Key_XoreosFileTypeId::Bin => 2106,
            Key_XoreosFileTypeId::Wob => 2107,
            Key_XoreosFileTypeId::Api => 2108,
            Key_XoreosFileTypeId::Properties => 2109,
            Key_XoreosFileTypeId::Png => 2110,
            Key_XoreosFileTypeId::Lyt => 3000,
            Key_XoreosFileTypeId::Vis => 3001,
            Key_XoreosFileTypeId::Rim => 3002,
            Key_XoreosFileTypeId::Pth => 3003,
            Key_XoreosFileTypeId::Lip => 3004,
            Key_XoreosFileTypeId::Bwm => 3005,
            Key_XoreosFileTypeId::Txb => 3006,
            Key_XoreosFileTypeId::Tpc => 3007,
            Key_XoreosFileTypeId::Mdx => 3008,
            Key_XoreosFileTypeId::Rsv => 3009,
            Key_XoreosFileTypeId::Sig => 3010,
            Key_XoreosFileTypeId::Mab => 3011,
            Key_XoreosFileTypeId::Qst2 => 3012,
            Key_XoreosFileTypeId::Sto => 3013,
            Key_XoreosFileTypeId::Hex => 3015,
            Key_XoreosFileTypeId::Mdx2 => 3016,
            Key_XoreosFileTypeId::Txb2 => 3017,
            Key_XoreosFileTypeId::Fsm => 3022,
            Key_XoreosFileTypeId::Art => 3023,
            Key_XoreosFileTypeId::Amp => 3024,
            Key_XoreosFileTypeId::Cwa => 3025,
            Key_XoreosFileTypeId::Bip => 3028,
            Key_XoreosFileTypeId::Mdb2 => 4000,
            Key_XoreosFileTypeId::Mda2 => 4001,
            Key_XoreosFileTypeId::Spt2 => 4002,
            Key_XoreosFileTypeId::Gr2 => 4003,
            Key_XoreosFileTypeId::Fxa => 4004,
            Key_XoreosFileTypeId::Fxe => 4005,
            Key_XoreosFileTypeId::Jpg2 => 4007,
            Key_XoreosFileTypeId::Pwc => 4008,
            Key_XoreosFileTypeId::OneDa => 9996,
            Key_XoreosFileTypeId::Erf => 9997,
            Key_XoreosFileTypeId::Bif => 9998,
            Key_XoreosFileTypeId::Key => 9999,
            Key_XoreosFileTypeId::Exe => 19000,
            Key_XoreosFileTypeId::Dbf => 19001,
            Key_XoreosFileTypeId::Cdx => 19002,
            Key_XoreosFileTypeId::Fpt => 19003,
            Key_XoreosFileTypeId::Zip => 20000,
            Key_XoreosFileTypeId::Fxm => 20001,
            Key_XoreosFileTypeId::Fxs => 20002,
            Key_XoreosFileTypeId::Xml => 20003,
            Key_XoreosFileTypeId::Wlk => 20004,
            Key_XoreosFileTypeId::Utr => 20005,
            Key_XoreosFileTypeId::Sef => 20006,
            Key_XoreosFileTypeId::Pfx => 20007,
            Key_XoreosFileTypeId::Tfx => 20008,
            Key_XoreosFileTypeId::Ifx => 20009,
            Key_XoreosFileTypeId::Lfx => 20010,
            Key_XoreosFileTypeId::Bbx => 20011,
            Key_XoreosFileTypeId::Pfb => 20012,
            Key_XoreosFileTypeId::Upe => 20013,
            Key_XoreosFileTypeId::Usc => 20014,
            Key_XoreosFileTypeId::Ult => 20015,
            Key_XoreosFileTypeId::Fx => 20016,
            Key_XoreosFileTypeId::Max => 20017,
            Key_XoreosFileTypeId::Doc => 20018,
            Key_XoreosFileTypeId::Scc => 20019,
            Key_XoreosFileTypeId::Wmp => 20020,
            Key_XoreosFileTypeId::Osc => 20021,
            Key_XoreosFileTypeId::Trn => 20022,
            Key_XoreosFileTypeId::Uen => 20023,
            Key_XoreosFileTypeId::Ros => 20024,
            Key_XoreosFileTypeId::Rst => 20025,
            Key_XoreosFileTypeId::Ptx => 20026,
            Key_XoreosFileTypeId::Ltx => 20027,
            Key_XoreosFileTypeId::Trx => 20028,
            Key_XoreosFileTypeId::Nds => 21000,
            Key_XoreosFileTypeId::Herf => 21001,
            Key_XoreosFileTypeId::Dict => 21002,
            Key_XoreosFileTypeId::Small => 21003,
            Key_XoreosFileTypeId::Cbgt => 21004,
            Key_XoreosFileTypeId::Cdpth => 21005,
            Key_XoreosFileTypeId::Emit => 21006,
            Key_XoreosFileTypeId::Itm => 21007,
            Key_XoreosFileTypeId::Nanr => 21008,
            Key_XoreosFileTypeId::Nbfp => 21009,
            Key_XoreosFileTypeId::Nbfs => 21010,
            Key_XoreosFileTypeId::Ncer => 21011,
            Key_XoreosFileTypeId::Ncgr => 21012,
            Key_XoreosFileTypeId::Nclr => 21013,
            Key_XoreosFileTypeId::Nftr => 21014,
            Key_XoreosFileTypeId::Nsbca => 21015,
            Key_XoreosFileTypeId::Nsbmd => 21016,
            Key_XoreosFileTypeId::Nsbta => 21017,
            Key_XoreosFileTypeId::Nsbtp => 21018,
            Key_XoreosFileTypeId::Nsbtx => 21019,
            Key_XoreosFileTypeId::Pal => 21020,
            Key_XoreosFileTypeId::Raw => 21021,
            Key_XoreosFileTypeId::Sadl => 21022,
            Key_XoreosFileTypeId::Sdat => 21023,
            Key_XoreosFileTypeId::Smp => 21024,
            Key_XoreosFileTypeId::Spl => 21025,
            Key_XoreosFileTypeId::Vx => 21026,
            Key_XoreosFileTypeId::Anb => 22000,
            Key_XoreosFileTypeId::Ani => 22001,
            Key_XoreosFileTypeId::Cns => 22002,
            Key_XoreosFileTypeId::Cur => 22003,
            Key_XoreosFileTypeId::Evt => 22004,
            Key_XoreosFileTypeId::Fdl => 22005,
            Key_XoreosFileTypeId::Fxo => 22006,
            Key_XoreosFileTypeId::Gad => 22007,
            Key_XoreosFileTypeId::Gda => 22008,
            Key_XoreosFileTypeId::Gfx => 22009,
            Key_XoreosFileTypeId::Ldf => 22010,
            Key_XoreosFileTypeId::Lst => 22011,
            Key_XoreosFileTypeId::Mal => 22012,
            Key_XoreosFileTypeId::Mao => 22013,
            Key_XoreosFileTypeId::Mmh => 22014,
            Key_XoreosFileTypeId::Mop => 22015,
            Key_XoreosFileTypeId::Mor => 22016,
            Key_XoreosFileTypeId::Msh => 22017,
            Key_XoreosFileTypeId::Mtx => 22018,
            Key_XoreosFileTypeId::Ncc => 22019,
            Key_XoreosFileTypeId::Phy => 22020,
            Key_XoreosFileTypeId::Plo => 22021,
            Key_XoreosFileTypeId::Stg => 22022,
            Key_XoreosFileTypeId::Tbi => 22023,
            Key_XoreosFileTypeId::Tnt => 22024,
            Key_XoreosFileTypeId::Arl => 22025,
            Key_XoreosFileTypeId::Fev => 22026,
            Key_XoreosFileTypeId::Fsb => 22027,
            Key_XoreosFileTypeId::Opf => 22028,
            Key_XoreosFileTypeId::Crf => 22029,
            Key_XoreosFileTypeId::Rimp => 22030,
            Key_XoreosFileTypeId::Met => 22031,
            Key_XoreosFileTypeId::Meta => 22032,
            Key_XoreosFileTypeId::Fxr => 22033,
            Key_XoreosFileTypeId::Cif => 22034,
            Key_XoreosFileTypeId::Cub => 22035,
            Key_XoreosFileTypeId::Dlb => 22036,
            Key_XoreosFileTypeId::Nsc => 22037,
            Key_XoreosFileTypeId::Mov => 23000,
            Key_XoreosFileTypeId::Curs => 23001,
            Key_XoreosFileTypeId::Pict => 23002,
            Key_XoreosFileTypeId::Rsrc => 23003,
            Key_XoreosFileTypeId::Plist => 23004,
            Key_XoreosFileTypeId::Cre => 24000,
            Key_XoreosFileTypeId::Pso => 24001,
            Key_XoreosFileTypeId::Vso => 24002,
            Key_XoreosFileTypeId::Abc => 24003,
            Key_XoreosFileTypeId::Sbm => 24004,
            Key_XoreosFileTypeId::Pvd => 24005,
            Key_XoreosFileTypeId::Pla => 24006,
            Key_XoreosFileTypeId::Trg => 24007,
            Key_XoreosFileTypeId::Pk => 24008,
            Key_XoreosFileTypeId::Als => 25000,
            Key_XoreosFileTypeId::Apl => 25001,
            Key_XoreosFileTypeId::Assembly => 25002,
            Key_XoreosFileTypeId::Bak => 25003,
            Key_XoreosFileTypeId::Bnk => 25004,
            Key_XoreosFileTypeId::Cl => 25005,
            Key_XoreosFileTypeId::Cnv => 25006,
            Key_XoreosFileTypeId::Con => 25007,
            Key_XoreosFileTypeId::Dat => 25008,
            Key_XoreosFileTypeId::Dx11 => 25009,
            Key_XoreosFileTypeId::Ids => 25010,
            Key_XoreosFileTypeId::Log => 25011,
            Key_XoreosFileTypeId::Map => 25012,
            Key_XoreosFileTypeId::Mml => 25013,
            Key_XoreosFileTypeId::Mp3 => 25014,
            Key_XoreosFileTypeId::Pck => 25015,
            Key_XoreosFileTypeId::Rml => 25016,
            Key_XoreosFileTypeId::S => 25017,
            Key_XoreosFileTypeId::Sta => 25018,
            Key_XoreosFileTypeId::Svr => 25019,
            Key_XoreosFileTypeId::Vlm => 25020,
            Key_XoreosFileTypeId::Wbd => 25021,
            Key_XoreosFileTypeId::Xbx => 25022,
            Key_XoreosFileTypeId::Xls => 25023,
            Key_XoreosFileTypeId::Bzf => 26000,
            Key_XoreosFileTypeId::Adv => 27000,
            Key_XoreosFileTypeId::Json => 28000,
            Key_XoreosFileTypeId::TlkExpert => 28001,
            Key_XoreosFileTypeId::TlkMobile => 28002,
            Key_XoreosFileTypeId::TlkTouch => 28003,
            Key_XoreosFileTypeId::Otf => 28004,
            Key_XoreosFileTypeId::Par => 28005,
            Key_XoreosFileTypeId::Xwb => 29000,
            Key_XoreosFileTypeId::Xsb => 29001,
            Key_XoreosFileTypeId::Xds => 30000,
            Key_XoreosFileTypeId::Wnd => 30001,
            Key_XoreosFileTypeId::Xeositex => 40000,
            Key_XoreosFileTypeId::Unknown(v) => v
        }
    }
}

impl Default for Key_XoreosFileTypeId {
    fn default() -> Self { Key_XoreosFileTypeId::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Key_FileEntry {
    pub _root: SharedType<Key>,
    pub _parent: SharedType<Key_FileTable>,
    pub _self: SharedType<Self>,
    file_size: RefCell<u32>,
    filename_offset: RefCell<u32>,
    filename_size: RefCell<u16>,
    drives: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_filename: Cell<bool>,
    filename: RefCell<String>,
}
impl KStruct for Key_FileEntry {
    type Root = Key;
    type Parent = Key_FileTable;

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
        *self_rc.file_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.filename_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.filename_size.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.drives.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Key_FileEntry {

    /**
     * BIF filename (read from filename table at specified offset).
     */
    pub fn filename(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_filename.get() {
            return Ok(self.filename.borrow());
        }
        self.f_filename.set(true);
        let _pos = _io.pos();
        _io.seek(((((*_r.file_table_offset() as i32) + (((*_r.bif_count() as u32) * (12 as u32)) as i32)) as i32) + (*self.filename_offset() as i32)) as usize)?;
        *self.filename.borrow_mut() = bytes_to_str(&_io.read_bytes(*self.filename_size() as usize)?.into(), "ASCII")?;
        _io.seek(_pos)?;
        Ok(self.filename.borrow())
    }
}

/**
 * Size of the BIF file on disk in bytes.
 */
impl Key_FileEntry {
    pub fn file_size(&self) -> Ref<'_, u32> {
        self.file_size.borrow()
    }
}

/**
 * Byte offset into the filename table where this BIF's filename is stored.
 */
impl Key_FileEntry {
    pub fn filename_offset(&self) -> Ref<'_, u32> {
        self.filename_offset.borrow()
    }
}

/**
 * Length of the filename in bytes (including null terminator).
 */
impl Key_FileEntry {
    pub fn filename_size(&self) -> Ref<'_, u16> {
        self.filename_size.borrow()
    }
}

/**
 * Drive flags indicating which media contains the BIF file.
 * Bit flags: 0x0001=HD0, 0x0002=CD1, 0x0004=CD2, 0x0008=CD3, 0x0010=CD4.
 * Modern distributions typically use 0x0001 (HD) for all files.
 */
impl Key_FileEntry {
    pub fn drives(&self) -> Ref<'_, u16> {
        self.drives.borrow()
    }
}
impl Key_FileEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Key_FileTable {
    pub _root: SharedType<Key>,
    pub _parent: SharedType<Key>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Key_FileEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Key_FileTable {
    type Root = Key;
    type Parent = Key;

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
        let l_entries = *_r.bif_count();
        for _i in 0..l_entries {
            let t = Self::read_into::<_, Key_FileEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Key_FileTable {
}

/**
 * Array of BIF file entries.
 */
impl Key_FileTable {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Key_FileEntry>>> {
        self.entries.borrow()
    }
}
impl Key_FileTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Key_FilenameTable {
    pub _root: SharedType<Key>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    filenames: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Key_FilenameTable {
    type Root = Key;
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
        *self_rc.filenames.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "ASCII")?;
        Ok(())
    }
}
impl Key_FilenameTable {
}

/**
 * Null-terminated BIF filenames concatenated together.
 * Each filename is read using the filename_offset and filename_size
 * from the corresponding file_entry.
 */
impl Key_FilenameTable {
    pub fn filenames(&self) -> Ref<'_, String> {
        self.filenames.borrow()
    }
}
impl Key_FilenameTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Key_KeyEntry {
    pub _root: SharedType<Key>,
    pub _parent: SharedType<Key_KeyTable>,
    pub _self: SharedType<Self>,
    resref: RefCell<String>,
    resource_type: RefCell<Key_XoreosFileTypeId>,
    resource_id: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Key_KeyEntry {
    type Root = Key;
    type Parent = Key_KeyTable;

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
        *self_rc.resref.borrow_mut() = bytes_to_str(&_io.read_bytes(16 as usize)?.into(), "ASCII")?;
        *self_rc.resource_type.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.resource_id.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Key_KeyEntry {
}

/**
 * Resource filename (ResRef) without extension.
 * Null-padded, maximum 16 characters.
 * The game uses this name to access the resource.
 */
impl Key_KeyEntry {
    pub fn resref(&self) -> Ref<'_, String> {
        self.resref.borrow()
    }
}

/**
 * Resource type identifier (see ResourceType enum).
 */
impl Key_KeyEntry {
    pub fn resource_type(&self) -> Ref<'_, Key_XoreosFileTypeId> {
        self.resource_type.borrow()
    }
}

/**
 * Encoded resource location.
 * Bits 31-20: BIF index (top 12 bits) - index into file table
 * Bits 19-0: Resource index (bottom 20 bits) - index within the BIF file
 * 
 * Formula: resource_id = (bif_index << 20) | resource_index
 * 
 * Decoding:
 * - bif_index = (resource_id >> 20) & 0xFFF
 * - resource_index = resource_id & 0xFFFFF
 */
impl Key_KeyEntry {
    pub fn resource_id(&self) -> Ref<'_, u32> {
        self.resource_id.borrow()
    }
}
impl Key_KeyEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Key_KeyTable {
    pub _root: SharedType<Key>,
    pub _parent: SharedType<Key>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Key_KeyEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Key_KeyTable {
    type Root = Key;
    type Parent = Key;

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
        let l_entries = *_r.key_count();
        for _i in 0..l_entries {
            let t = Self::read_into::<_, Key_KeyEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Key_KeyTable {
}

/**
 * Array of resource entries.
 */
impl Key_KeyTable {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Key_KeyEntry>>> {
        self.entries.borrow()
    }
}
impl Key_KeyTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
