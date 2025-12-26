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
 * BIF (BioWare Index File) files are archive containers that store game resources.
 * They work in tandem with KEY files which provide the filename-to-resource mappings.
 * 
 * BIF files contain only resource IDs, types, and data - the actual filenames (ResRefs)
 * are stored in the KEY file and matched via the resource ID.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/BIF-File-Format.md
 * - https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/bif.html
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/bifreader.cpp
 */

#[derive(Default, Debug, Clone)]
pub struct Bif {
    pub _root: SharedType<Bif>,
    pub _parent: SharedType<Bif>,
    pub _self: SharedType<Self>,
    file_type: RefCell<String>,
    version: RefCell<String>,
    var_res_count: RefCell<u32>,
    fixed_res_count: RefCell<u32>,
    var_table_offset: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_var_resource_table: Cell<bool>,
    var_resource_table: RefCell<OptRc<Bif_VarResourceTable>>,
}
impl KStruct for Bif {
    type Root = Bif;
    type Parent = Bif;

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
        if !(*self_rc.file_type() == "BIFF".to_string()) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        if !( ((*self_rc.version() == "V1  ".to_string()) || (*self_rc.version() == "V1.1".to_string())) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/seq/1".to_string() }));
        }
        *self_rc.var_res_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.fixed_res_count.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.fixed_res_count() as u32) == (0 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/3".to_string() }));
        }
        *self_rc.var_table_offset.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Bif {

    /**
     * Variable resource table containing entries for each resource.
     */
    pub fn var_resource_table(
        &self
    ) -> KResult<Ref<'_, OptRc<Bif_VarResourceTable>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_var_resource_table.get() {
            return Ok(self.var_resource_table.borrow());
        }
        if ((*self.var_res_count() as u32) > (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.var_table_offset() as usize)?;
            let t = Self::read_into::<_, Bif_VarResourceTable>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.var_resource_table.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.var_resource_table.borrow())
    }
}

/**
 * File type signature. Must be "BIFF" for BIF files.
 */
impl Bif {
    pub fn file_type(&self) -> Ref<'_, String> {
        self.file_type.borrow()
    }
}

/**
 * File format version. Typically "V1  " or "V1.1".
 */
impl Bif {
    pub fn version(&self) -> Ref<'_, String> {
        self.version.borrow()
    }
}

/**
 * Number of variable-size resources in this file.
 */
impl Bif {
    pub fn var_res_count(&self) -> Ref<'_, u32> {
        self.var_res_count.borrow()
    }
}

/**
 * Number of fixed-size resources (always 0 in KotOR, legacy from NWN).
 */
impl Bif {
    pub fn fixed_res_count(&self) -> Ref<'_, u32> {
        self.fixed_res_count.borrow()
    }
}

/**
 * Byte offset to the variable resource table from the beginning of the file.
 */
impl Bif {
    pub fn var_table_offset(&self) -> Ref<'_, u32> {
        self.var_table_offset.borrow()
    }
}
impl Bif {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Bif_XoreosFileTypeId {
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

impl TryFrom<i64> for Bif_XoreosFileTypeId {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Bif_XoreosFileTypeId> {
        match flag {
            -1 => Ok(Bif_XoreosFileTypeId::None),
            0 => Ok(Bif_XoreosFileTypeId::Res),
            1 => Ok(Bif_XoreosFileTypeId::Bmp),
            2 => Ok(Bif_XoreosFileTypeId::Mve),
            3 => Ok(Bif_XoreosFileTypeId::Tga),
            4 => Ok(Bif_XoreosFileTypeId::Wav),
            6 => Ok(Bif_XoreosFileTypeId::Plt),
            7 => Ok(Bif_XoreosFileTypeId::Ini),
            8 => Ok(Bif_XoreosFileTypeId::Bmu),
            9 => Ok(Bif_XoreosFileTypeId::Mpg),
            10 => Ok(Bif_XoreosFileTypeId::Txt),
            11 => Ok(Bif_XoreosFileTypeId::Wma),
            12 => Ok(Bif_XoreosFileTypeId::Wmv),
            13 => Ok(Bif_XoreosFileTypeId::Xmv),
            2000 => Ok(Bif_XoreosFileTypeId::Plh),
            2001 => Ok(Bif_XoreosFileTypeId::Tex),
            2002 => Ok(Bif_XoreosFileTypeId::Mdl),
            2003 => Ok(Bif_XoreosFileTypeId::Thg),
            2005 => Ok(Bif_XoreosFileTypeId::Fnt),
            2007 => Ok(Bif_XoreosFileTypeId::Lua),
            2008 => Ok(Bif_XoreosFileTypeId::Slt),
            2009 => Ok(Bif_XoreosFileTypeId::Nss),
            2010 => Ok(Bif_XoreosFileTypeId::Ncs),
            2011 => Ok(Bif_XoreosFileTypeId::Mod),
            2012 => Ok(Bif_XoreosFileTypeId::Are),
            2013 => Ok(Bif_XoreosFileTypeId::Set),
            2014 => Ok(Bif_XoreosFileTypeId::Ifo),
            2015 => Ok(Bif_XoreosFileTypeId::Bic),
            2016 => Ok(Bif_XoreosFileTypeId::Wok),
            2017 => Ok(Bif_XoreosFileTypeId::TwoDa),
            2018 => Ok(Bif_XoreosFileTypeId::Tlk),
            2022 => Ok(Bif_XoreosFileTypeId::Txi),
            2023 => Ok(Bif_XoreosFileTypeId::Git),
            2024 => Ok(Bif_XoreosFileTypeId::Bti),
            2025 => Ok(Bif_XoreosFileTypeId::Uti),
            2026 => Ok(Bif_XoreosFileTypeId::Btc),
            2027 => Ok(Bif_XoreosFileTypeId::Utc),
            2029 => Ok(Bif_XoreosFileTypeId::Dlg),
            2030 => Ok(Bif_XoreosFileTypeId::Itp),
            2031 => Ok(Bif_XoreosFileTypeId::Btt),
            2032 => Ok(Bif_XoreosFileTypeId::Utt),
            2033 => Ok(Bif_XoreosFileTypeId::Dds),
            2034 => Ok(Bif_XoreosFileTypeId::Bts),
            2035 => Ok(Bif_XoreosFileTypeId::Uts),
            2036 => Ok(Bif_XoreosFileTypeId::Ltr),
            2037 => Ok(Bif_XoreosFileTypeId::Gff),
            2038 => Ok(Bif_XoreosFileTypeId::Fac),
            2039 => Ok(Bif_XoreosFileTypeId::Bte),
            2040 => Ok(Bif_XoreosFileTypeId::Ute),
            2041 => Ok(Bif_XoreosFileTypeId::Btd),
            2042 => Ok(Bif_XoreosFileTypeId::Utd),
            2043 => Ok(Bif_XoreosFileTypeId::Btp),
            2044 => Ok(Bif_XoreosFileTypeId::Utp),
            2045 => Ok(Bif_XoreosFileTypeId::Dft),
            2046 => Ok(Bif_XoreosFileTypeId::Gic),
            2047 => Ok(Bif_XoreosFileTypeId::Gui),
            2048 => Ok(Bif_XoreosFileTypeId::Css),
            2049 => Ok(Bif_XoreosFileTypeId::Ccs),
            2050 => Ok(Bif_XoreosFileTypeId::Btm),
            2051 => Ok(Bif_XoreosFileTypeId::Utm),
            2052 => Ok(Bif_XoreosFileTypeId::Dwk),
            2053 => Ok(Bif_XoreosFileTypeId::Pwk),
            2054 => Ok(Bif_XoreosFileTypeId::Btg),
            2055 => Ok(Bif_XoreosFileTypeId::Utg),
            2056 => Ok(Bif_XoreosFileTypeId::Jrl),
            2057 => Ok(Bif_XoreosFileTypeId::Sav),
            2058 => Ok(Bif_XoreosFileTypeId::Utw),
            2059 => Ok(Bif_XoreosFileTypeId::FourPc),
            2060 => Ok(Bif_XoreosFileTypeId::Ssf),
            2061 => Ok(Bif_XoreosFileTypeId::Hak),
            2062 => Ok(Bif_XoreosFileTypeId::Nwm),
            2063 => Ok(Bif_XoreosFileTypeId::Bik),
            2064 => Ok(Bif_XoreosFileTypeId::Ndb),
            2065 => Ok(Bif_XoreosFileTypeId::Ptm),
            2066 => Ok(Bif_XoreosFileTypeId::Ptt),
            2067 => Ok(Bif_XoreosFileTypeId::Ncm),
            2068 => Ok(Bif_XoreosFileTypeId::Mfx),
            2069 => Ok(Bif_XoreosFileTypeId::Mat),
            2070 => Ok(Bif_XoreosFileTypeId::Mdb),
            2071 => Ok(Bif_XoreosFileTypeId::Say),
            2072 => Ok(Bif_XoreosFileTypeId::Ttf),
            2073 => Ok(Bif_XoreosFileTypeId::Ttc),
            2074 => Ok(Bif_XoreosFileTypeId::Cut),
            2075 => Ok(Bif_XoreosFileTypeId::Ka),
            2076 => Ok(Bif_XoreosFileTypeId::Jpg),
            2077 => Ok(Bif_XoreosFileTypeId::Ico),
            2078 => Ok(Bif_XoreosFileTypeId::Ogg),
            2079 => Ok(Bif_XoreosFileTypeId::Spt),
            2080 => Ok(Bif_XoreosFileTypeId::Spw),
            2081 => Ok(Bif_XoreosFileTypeId::Wfx),
            2082 => Ok(Bif_XoreosFileTypeId::Ugm),
            2083 => Ok(Bif_XoreosFileTypeId::Qdb),
            2084 => Ok(Bif_XoreosFileTypeId::Qst),
            2085 => Ok(Bif_XoreosFileTypeId::Npc),
            2086 => Ok(Bif_XoreosFileTypeId::Spn),
            2087 => Ok(Bif_XoreosFileTypeId::Utx),
            2088 => Ok(Bif_XoreosFileTypeId::Mmd),
            2089 => Ok(Bif_XoreosFileTypeId::Smm),
            2090 => Ok(Bif_XoreosFileTypeId::Uta),
            2091 => Ok(Bif_XoreosFileTypeId::Mde),
            2092 => Ok(Bif_XoreosFileTypeId::Mdv),
            2093 => Ok(Bif_XoreosFileTypeId::Mda),
            2094 => Ok(Bif_XoreosFileTypeId::Mba),
            2095 => Ok(Bif_XoreosFileTypeId::Oct),
            2096 => Ok(Bif_XoreosFileTypeId::Bfx),
            2097 => Ok(Bif_XoreosFileTypeId::Pdb),
            2098 => Ok(Bif_XoreosFileTypeId::TheWitcherSave),
            2099 => Ok(Bif_XoreosFileTypeId::Pvs),
            2100 => Ok(Bif_XoreosFileTypeId::Cfx),
            2101 => Ok(Bif_XoreosFileTypeId::Luc),
            2103 => Ok(Bif_XoreosFileTypeId::Prb),
            2104 => Ok(Bif_XoreosFileTypeId::Cam),
            2105 => Ok(Bif_XoreosFileTypeId::Vds),
            2106 => Ok(Bif_XoreosFileTypeId::Bin),
            2107 => Ok(Bif_XoreosFileTypeId::Wob),
            2108 => Ok(Bif_XoreosFileTypeId::Api),
            2109 => Ok(Bif_XoreosFileTypeId::Properties),
            2110 => Ok(Bif_XoreosFileTypeId::Png),
            3000 => Ok(Bif_XoreosFileTypeId::Lyt),
            3001 => Ok(Bif_XoreosFileTypeId::Vis),
            3002 => Ok(Bif_XoreosFileTypeId::Rim),
            3003 => Ok(Bif_XoreosFileTypeId::Pth),
            3004 => Ok(Bif_XoreosFileTypeId::Lip),
            3005 => Ok(Bif_XoreosFileTypeId::Bwm),
            3006 => Ok(Bif_XoreosFileTypeId::Txb),
            3007 => Ok(Bif_XoreosFileTypeId::Tpc),
            3008 => Ok(Bif_XoreosFileTypeId::Mdx),
            3009 => Ok(Bif_XoreosFileTypeId::Rsv),
            3010 => Ok(Bif_XoreosFileTypeId::Sig),
            3011 => Ok(Bif_XoreosFileTypeId::Mab),
            3012 => Ok(Bif_XoreosFileTypeId::Qst2),
            3013 => Ok(Bif_XoreosFileTypeId::Sto),
            3015 => Ok(Bif_XoreosFileTypeId::Hex),
            3016 => Ok(Bif_XoreosFileTypeId::Mdx2),
            3017 => Ok(Bif_XoreosFileTypeId::Txb2),
            3022 => Ok(Bif_XoreosFileTypeId::Fsm),
            3023 => Ok(Bif_XoreosFileTypeId::Art),
            3024 => Ok(Bif_XoreosFileTypeId::Amp),
            3025 => Ok(Bif_XoreosFileTypeId::Cwa),
            3028 => Ok(Bif_XoreosFileTypeId::Bip),
            4000 => Ok(Bif_XoreosFileTypeId::Mdb2),
            4001 => Ok(Bif_XoreosFileTypeId::Mda2),
            4002 => Ok(Bif_XoreosFileTypeId::Spt2),
            4003 => Ok(Bif_XoreosFileTypeId::Gr2),
            4004 => Ok(Bif_XoreosFileTypeId::Fxa),
            4005 => Ok(Bif_XoreosFileTypeId::Fxe),
            4007 => Ok(Bif_XoreosFileTypeId::Jpg2),
            4008 => Ok(Bif_XoreosFileTypeId::Pwc),
            9996 => Ok(Bif_XoreosFileTypeId::OneDa),
            9997 => Ok(Bif_XoreosFileTypeId::Erf),
            9998 => Ok(Bif_XoreosFileTypeId::Bif),
            9999 => Ok(Bif_XoreosFileTypeId::Key),
            19000 => Ok(Bif_XoreosFileTypeId::Exe),
            19001 => Ok(Bif_XoreosFileTypeId::Dbf),
            19002 => Ok(Bif_XoreosFileTypeId::Cdx),
            19003 => Ok(Bif_XoreosFileTypeId::Fpt),
            20000 => Ok(Bif_XoreosFileTypeId::Zip),
            20001 => Ok(Bif_XoreosFileTypeId::Fxm),
            20002 => Ok(Bif_XoreosFileTypeId::Fxs),
            20003 => Ok(Bif_XoreosFileTypeId::Xml),
            20004 => Ok(Bif_XoreosFileTypeId::Wlk),
            20005 => Ok(Bif_XoreosFileTypeId::Utr),
            20006 => Ok(Bif_XoreosFileTypeId::Sef),
            20007 => Ok(Bif_XoreosFileTypeId::Pfx),
            20008 => Ok(Bif_XoreosFileTypeId::Tfx),
            20009 => Ok(Bif_XoreosFileTypeId::Ifx),
            20010 => Ok(Bif_XoreosFileTypeId::Lfx),
            20011 => Ok(Bif_XoreosFileTypeId::Bbx),
            20012 => Ok(Bif_XoreosFileTypeId::Pfb),
            20013 => Ok(Bif_XoreosFileTypeId::Upe),
            20014 => Ok(Bif_XoreosFileTypeId::Usc),
            20015 => Ok(Bif_XoreosFileTypeId::Ult),
            20016 => Ok(Bif_XoreosFileTypeId::Fx),
            20017 => Ok(Bif_XoreosFileTypeId::Max),
            20018 => Ok(Bif_XoreosFileTypeId::Doc),
            20019 => Ok(Bif_XoreosFileTypeId::Scc),
            20020 => Ok(Bif_XoreosFileTypeId::Wmp),
            20021 => Ok(Bif_XoreosFileTypeId::Osc),
            20022 => Ok(Bif_XoreosFileTypeId::Trn),
            20023 => Ok(Bif_XoreosFileTypeId::Uen),
            20024 => Ok(Bif_XoreosFileTypeId::Ros),
            20025 => Ok(Bif_XoreosFileTypeId::Rst),
            20026 => Ok(Bif_XoreosFileTypeId::Ptx),
            20027 => Ok(Bif_XoreosFileTypeId::Ltx),
            20028 => Ok(Bif_XoreosFileTypeId::Trx),
            21000 => Ok(Bif_XoreosFileTypeId::Nds),
            21001 => Ok(Bif_XoreosFileTypeId::Herf),
            21002 => Ok(Bif_XoreosFileTypeId::Dict),
            21003 => Ok(Bif_XoreosFileTypeId::Small),
            21004 => Ok(Bif_XoreosFileTypeId::Cbgt),
            21005 => Ok(Bif_XoreosFileTypeId::Cdpth),
            21006 => Ok(Bif_XoreosFileTypeId::Emit),
            21007 => Ok(Bif_XoreosFileTypeId::Itm),
            21008 => Ok(Bif_XoreosFileTypeId::Nanr),
            21009 => Ok(Bif_XoreosFileTypeId::Nbfp),
            21010 => Ok(Bif_XoreosFileTypeId::Nbfs),
            21011 => Ok(Bif_XoreosFileTypeId::Ncer),
            21012 => Ok(Bif_XoreosFileTypeId::Ncgr),
            21013 => Ok(Bif_XoreosFileTypeId::Nclr),
            21014 => Ok(Bif_XoreosFileTypeId::Nftr),
            21015 => Ok(Bif_XoreosFileTypeId::Nsbca),
            21016 => Ok(Bif_XoreosFileTypeId::Nsbmd),
            21017 => Ok(Bif_XoreosFileTypeId::Nsbta),
            21018 => Ok(Bif_XoreosFileTypeId::Nsbtp),
            21019 => Ok(Bif_XoreosFileTypeId::Nsbtx),
            21020 => Ok(Bif_XoreosFileTypeId::Pal),
            21021 => Ok(Bif_XoreosFileTypeId::Raw),
            21022 => Ok(Bif_XoreosFileTypeId::Sadl),
            21023 => Ok(Bif_XoreosFileTypeId::Sdat),
            21024 => Ok(Bif_XoreosFileTypeId::Smp),
            21025 => Ok(Bif_XoreosFileTypeId::Spl),
            21026 => Ok(Bif_XoreosFileTypeId::Vx),
            22000 => Ok(Bif_XoreosFileTypeId::Anb),
            22001 => Ok(Bif_XoreosFileTypeId::Ani),
            22002 => Ok(Bif_XoreosFileTypeId::Cns),
            22003 => Ok(Bif_XoreosFileTypeId::Cur),
            22004 => Ok(Bif_XoreosFileTypeId::Evt),
            22005 => Ok(Bif_XoreosFileTypeId::Fdl),
            22006 => Ok(Bif_XoreosFileTypeId::Fxo),
            22007 => Ok(Bif_XoreosFileTypeId::Gad),
            22008 => Ok(Bif_XoreosFileTypeId::Gda),
            22009 => Ok(Bif_XoreosFileTypeId::Gfx),
            22010 => Ok(Bif_XoreosFileTypeId::Ldf),
            22011 => Ok(Bif_XoreosFileTypeId::Lst),
            22012 => Ok(Bif_XoreosFileTypeId::Mal),
            22013 => Ok(Bif_XoreosFileTypeId::Mao),
            22014 => Ok(Bif_XoreosFileTypeId::Mmh),
            22015 => Ok(Bif_XoreosFileTypeId::Mop),
            22016 => Ok(Bif_XoreosFileTypeId::Mor),
            22017 => Ok(Bif_XoreosFileTypeId::Msh),
            22018 => Ok(Bif_XoreosFileTypeId::Mtx),
            22019 => Ok(Bif_XoreosFileTypeId::Ncc),
            22020 => Ok(Bif_XoreosFileTypeId::Phy),
            22021 => Ok(Bif_XoreosFileTypeId::Plo),
            22022 => Ok(Bif_XoreosFileTypeId::Stg),
            22023 => Ok(Bif_XoreosFileTypeId::Tbi),
            22024 => Ok(Bif_XoreosFileTypeId::Tnt),
            22025 => Ok(Bif_XoreosFileTypeId::Arl),
            22026 => Ok(Bif_XoreosFileTypeId::Fev),
            22027 => Ok(Bif_XoreosFileTypeId::Fsb),
            22028 => Ok(Bif_XoreosFileTypeId::Opf),
            22029 => Ok(Bif_XoreosFileTypeId::Crf),
            22030 => Ok(Bif_XoreosFileTypeId::Rimp),
            22031 => Ok(Bif_XoreosFileTypeId::Met),
            22032 => Ok(Bif_XoreosFileTypeId::Meta),
            22033 => Ok(Bif_XoreosFileTypeId::Fxr),
            22034 => Ok(Bif_XoreosFileTypeId::Cif),
            22035 => Ok(Bif_XoreosFileTypeId::Cub),
            22036 => Ok(Bif_XoreosFileTypeId::Dlb),
            22037 => Ok(Bif_XoreosFileTypeId::Nsc),
            23000 => Ok(Bif_XoreosFileTypeId::Mov),
            23001 => Ok(Bif_XoreosFileTypeId::Curs),
            23002 => Ok(Bif_XoreosFileTypeId::Pict),
            23003 => Ok(Bif_XoreosFileTypeId::Rsrc),
            23004 => Ok(Bif_XoreosFileTypeId::Plist),
            24000 => Ok(Bif_XoreosFileTypeId::Cre),
            24001 => Ok(Bif_XoreosFileTypeId::Pso),
            24002 => Ok(Bif_XoreosFileTypeId::Vso),
            24003 => Ok(Bif_XoreosFileTypeId::Abc),
            24004 => Ok(Bif_XoreosFileTypeId::Sbm),
            24005 => Ok(Bif_XoreosFileTypeId::Pvd),
            24006 => Ok(Bif_XoreosFileTypeId::Pla),
            24007 => Ok(Bif_XoreosFileTypeId::Trg),
            24008 => Ok(Bif_XoreosFileTypeId::Pk),
            25000 => Ok(Bif_XoreosFileTypeId::Als),
            25001 => Ok(Bif_XoreosFileTypeId::Apl),
            25002 => Ok(Bif_XoreosFileTypeId::Assembly),
            25003 => Ok(Bif_XoreosFileTypeId::Bak),
            25004 => Ok(Bif_XoreosFileTypeId::Bnk),
            25005 => Ok(Bif_XoreosFileTypeId::Cl),
            25006 => Ok(Bif_XoreosFileTypeId::Cnv),
            25007 => Ok(Bif_XoreosFileTypeId::Con),
            25008 => Ok(Bif_XoreosFileTypeId::Dat),
            25009 => Ok(Bif_XoreosFileTypeId::Dx11),
            25010 => Ok(Bif_XoreosFileTypeId::Ids),
            25011 => Ok(Bif_XoreosFileTypeId::Log),
            25012 => Ok(Bif_XoreosFileTypeId::Map),
            25013 => Ok(Bif_XoreosFileTypeId::Mml),
            25014 => Ok(Bif_XoreosFileTypeId::Mp3),
            25015 => Ok(Bif_XoreosFileTypeId::Pck),
            25016 => Ok(Bif_XoreosFileTypeId::Rml),
            25017 => Ok(Bif_XoreosFileTypeId::S),
            25018 => Ok(Bif_XoreosFileTypeId::Sta),
            25019 => Ok(Bif_XoreosFileTypeId::Svr),
            25020 => Ok(Bif_XoreosFileTypeId::Vlm),
            25021 => Ok(Bif_XoreosFileTypeId::Wbd),
            25022 => Ok(Bif_XoreosFileTypeId::Xbx),
            25023 => Ok(Bif_XoreosFileTypeId::Xls),
            26000 => Ok(Bif_XoreosFileTypeId::Bzf),
            27000 => Ok(Bif_XoreosFileTypeId::Adv),
            28000 => Ok(Bif_XoreosFileTypeId::Json),
            28001 => Ok(Bif_XoreosFileTypeId::TlkExpert),
            28002 => Ok(Bif_XoreosFileTypeId::TlkMobile),
            28003 => Ok(Bif_XoreosFileTypeId::TlkTouch),
            28004 => Ok(Bif_XoreosFileTypeId::Otf),
            28005 => Ok(Bif_XoreosFileTypeId::Par),
            29000 => Ok(Bif_XoreosFileTypeId::Xwb),
            29001 => Ok(Bif_XoreosFileTypeId::Xsb),
            30000 => Ok(Bif_XoreosFileTypeId::Xds),
            30001 => Ok(Bif_XoreosFileTypeId::Wnd),
            40000 => Ok(Bif_XoreosFileTypeId::Xeositex),
            _ => Ok(Bif_XoreosFileTypeId::Unknown(flag)),
        }
    }
}

impl From<&Bif_XoreosFileTypeId> for i64 {
    fn from(v: &Bif_XoreosFileTypeId) -> Self {
        match *v {
            Bif_XoreosFileTypeId::None => -1,
            Bif_XoreosFileTypeId::Res => 0,
            Bif_XoreosFileTypeId::Bmp => 1,
            Bif_XoreosFileTypeId::Mve => 2,
            Bif_XoreosFileTypeId::Tga => 3,
            Bif_XoreosFileTypeId::Wav => 4,
            Bif_XoreosFileTypeId::Plt => 6,
            Bif_XoreosFileTypeId::Ini => 7,
            Bif_XoreosFileTypeId::Bmu => 8,
            Bif_XoreosFileTypeId::Mpg => 9,
            Bif_XoreosFileTypeId::Txt => 10,
            Bif_XoreosFileTypeId::Wma => 11,
            Bif_XoreosFileTypeId::Wmv => 12,
            Bif_XoreosFileTypeId::Xmv => 13,
            Bif_XoreosFileTypeId::Plh => 2000,
            Bif_XoreosFileTypeId::Tex => 2001,
            Bif_XoreosFileTypeId::Mdl => 2002,
            Bif_XoreosFileTypeId::Thg => 2003,
            Bif_XoreosFileTypeId::Fnt => 2005,
            Bif_XoreosFileTypeId::Lua => 2007,
            Bif_XoreosFileTypeId::Slt => 2008,
            Bif_XoreosFileTypeId::Nss => 2009,
            Bif_XoreosFileTypeId::Ncs => 2010,
            Bif_XoreosFileTypeId::Mod => 2011,
            Bif_XoreosFileTypeId::Are => 2012,
            Bif_XoreosFileTypeId::Set => 2013,
            Bif_XoreosFileTypeId::Ifo => 2014,
            Bif_XoreosFileTypeId::Bic => 2015,
            Bif_XoreosFileTypeId::Wok => 2016,
            Bif_XoreosFileTypeId::TwoDa => 2017,
            Bif_XoreosFileTypeId::Tlk => 2018,
            Bif_XoreosFileTypeId::Txi => 2022,
            Bif_XoreosFileTypeId::Git => 2023,
            Bif_XoreosFileTypeId::Bti => 2024,
            Bif_XoreosFileTypeId::Uti => 2025,
            Bif_XoreosFileTypeId::Btc => 2026,
            Bif_XoreosFileTypeId::Utc => 2027,
            Bif_XoreosFileTypeId::Dlg => 2029,
            Bif_XoreosFileTypeId::Itp => 2030,
            Bif_XoreosFileTypeId::Btt => 2031,
            Bif_XoreosFileTypeId::Utt => 2032,
            Bif_XoreosFileTypeId::Dds => 2033,
            Bif_XoreosFileTypeId::Bts => 2034,
            Bif_XoreosFileTypeId::Uts => 2035,
            Bif_XoreosFileTypeId::Ltr => 2036,
            Bif_XoreosFileTypeId::Gff => 2037,
            Bif_XoreosFileTypeId::Fac => 2038,
            Bif_XoreosFileTypeId::Bte => 2039,
            Bif_XoreosFileTypeId::Ute => 2040,
            Bif_XoreosFileTypeId::Btd => 2041,
            Bif_XoreosFileTypeId::Utd => 2042,
            Bif_XoreosFileTypeId::Btp => 2043,
            Bif_XoreosFileTypeId::Utp => 2044,
            Bif_XoreosFileTypeId::Dft => 2045,
            Bif_XoreosFileTypeId::Gic => 2046,
            Bif_XoreosFileTypeId::Gui => 2047,
            Bif_XoreosFileTypeId::Css => 2048,
            Bif_XoreosFileTypeId::Ccs => 2049,
            Bif_XoreosFileTypeId::Btm => 2050,
            Bif_XoreosFileTypeId::Utm => 2051,
            Bif_XoreosFileTypeId::Dwk => 2052,
            Bif_XoreosFileTypeId::Pwk => 2053,
            Bif_XoreosFileTypeId::Btg => 2054,
            Bif_XoreosFileTypeId::Utg => 2055,
            Bif_XoreosFileTypeId::Jrl => 2056,
            Bif_XoreosFileTypeId::Sav => 2057,
            Bif_XoreosFileTypeId::Utw => 2058,
            Bif_XoreosFileTypeId::FourPc => 2059,
            Bif_XoreosFileTypeId::Ssf => 2060,
            Bif_XoreosFileTypeId::Hak => 2061,
            Bif_XoreosFileTypeId::Nwm => 2062,
            Bif_XoreosFileTypeId::Bik => 2063,
            Bif_XoreosFileTypeId::Ndb => 2064,
            Bif_XoreosFileTypeId::Ptm => 2065,
            Bif_XoreosFileTypeId::Ptt => 2066,
            Bif_XoreosFileTypeId::Ncm => 2067,
            Bif_XoreosFileTypeId::Mfx => 2068,
            Bif_XoreosFileTypeId::Mat => 2069,
            Bif_XoreosFileTypeId::Mdb => 2070,
            Bif_XoreosFileTypeId::Say => 2071,
            Bif_XoreosFileTypeId::Ttf => 2072,
            Bif_XoreosFileTypeId::Ttc => 2073,
            Bif_XoreosFileTypeId::Cut => 2074,
            Bif_XoreosFileTypeId::Ka => 2075,
            Bif_XoreosFileTypeId::Jpg => 2076,
            Bif_XoreosFileTypeId::Ico => 2077,
            Bif_XoreosFileTypeId::Ogg => 2078,
            Bif_XoreosFileTypeId::Spt => 2079,
            Bif_XoreosFileTypeId::Spw => 2080,
            Bif_XoreosFileTypeId::Wfx => 2081,
            Bif_XoreosFileTypeId::Ugm => 2082,
            Bif_XoreosFileTypeId::Qdb => 2083,
            Bif_XoreosFileTypeId::Qst => 2084,
            Bif_XoreosFileTypeId::Npc => 2085,
            Bif_XoreosFileTypeId::Spn => 2086,
            Bif_XoreosFileTypeId::Utx => 2087,
            Bif_XoreosFileTypeId::Mmd => 2088,
            Bif_XoreosFileTypeId::Smm => 2089,
            Bif_XoreosFileTypeId::Uta => 2090,
            Bif_XoreosFileTypeId::Mde => 2091,
            Bif_XoreosFileTypeId::Mdv => 2092,
            Bif_XoreosFileTypeId::Mda => 2093,
            Bif_XoreosFileTypeId::Mba => 2094,
            Bif_XoreosFileTypeId::Oct => 2095,
            Bif_XoreosFileTypeId::Bfx => 2096,
            Bif_XoreosFileTypeId::Pdb => 2097,
            Bif_XoreosFileTypeId::TheWitcherSave => 2098,
            Bif_XoreosFileTypeId::Pvs => 2099,
            Bif_XoreosFileTypeId::Cfx => 2100,
            Bif_XoreosFileTypeId::Luc => 2101,
            Bif_XoreosFileTypeId::Prb => 2103,
            Bif_XoreosFileTypeId::Cam => 2104,
            Bif_XoreosFileTypeId::Vds => 2105,
            Bif_XoreosFileTypeId::Bin => 2106,
            Bif_XoreosFileTypeId::Wob => 2107,
            Bif_XoreosFileTypeId::Api => 2108,
            Bif_XoreosFileTypeId::Properties => 2109,
            Bif_XoreosFileTypeId::Png => 2110,
            Bif_XoreosFileTypeId::Lyt => 3000,
            Bif_XoreosFileTypeId::Vis => 3001,
            Bif_XoreosFileTypeId::Rim => 3002,
            Bif_XoreosFileTypeId::Pth => 3003,
            Bif_XoreosFileTypeId::Lip => 3004,
            Bif_XoreosFileTypeId::Bwm => 3005,
            Bif_XoreosFileTypeId::Txb => 3006,
            Bif_XoreosFileTypeId::Tpc => 3007,
            Bif_XoreosFileTypeId::Mdx => 3008,
            Bif_XoreosFileTypeId::Rsv => 3009,
            Bif_XoreosFileTypeId::Sig => 3010,
            Bif_XoreosFileTypeId::Mab => 3011,
            Bif_XoreosFileTypeId::Qst2 => 3012,
            Bif_XoreosFileTypeId::Sto => 3013,
            Bif_XoreosFileTypeId::Hex => 3015,
            Bif_XoreosFileTypeId::Mdx2 => 3016,
            Bif_XoreosFileTypeId::Txb2 => 3017,
            Bif_XoreosFileTypeId::Fsm => 3022,
            Bif_XoreosFileTypeId::Art => 3023,
            Bif_XoreosFileTypeId::Amp => 3024,
            Bif_XoreosFileTypeId::Cwa => 3025,
            Bif_XoreosFileTypeId::Bip => 3028,
            Bif_XoreosFileTypeId::Mdb2 => 4000,
            Bif_XoreosFileTypeId::Mda2 => 4001,
            Bif_XoreosFileTypeId::Spt2 => 4002,
            Bif_XoreosFileTypeId::Gr2 => 4003,
            Bif_XoreosFileTypeId::Fxa => 4004,
            Bif_XoreosFileTypeId::Fxe => 4005,
            Bif_XoreosFileTypeId::Jpg2 => 4007,
            Bif_XoreosFileTypeId::Pwc => 4008,
            Bif_XoreosFileTypeId::OneDa => 9996,
            Bif_XoreosFileTypeId::Erf => 9997,
            Bif_XoreosFileTypeId::Bif => 9998,
            Bif_XoreosFileTypeId::Key => 9999,
            Bif_XoreosFileTypeId::Exe => 19000,
            Bif_XoreosFileTypeId::Dbf => 19001,
            Bif_XoreosFileTypeId::Cdx => 19002,
            Bif_XoreosFileTypeId::Fpt => 19003,
            Bif_XoreosFileTypeId::Zip => 20000,
            Bif_XoreosFileTypeId::Fxm => 20001,
            Bif_XoreosFileTypeId::Fxs => 20002,
            Bif_XoreosFileTypeId::Xml => 20003,
            Bif_XoreosFileTypeId::Wlk => 20004,
            Bif_XoreosFileTypeId::Utr => 20005,
            Bif_XoreosFileTypeId::Sef => 20006,
            Bif_XoreosFileTypeId::Pfx => 20007,
            Bif_XoreosFileTypeId::Tfx => 20008,
            Bif_XoreosFileTypeId::Ifx => 20009,
            Bif_XoreosFileTypeId::Lfx => 20010,
            Bif_XoreosFileTypeId::Bbx => 20011,
            Bif_XoreosFileTypeId::Pfb => 20012,
            Bif_XoreosFileTypeId::Upe => 20013,
            Bif_XoreosFileTypeId::Usc => 20014,
            Bif_XoreosFileTypeId::Ult => 20015,
            Bif_XoreosFileTypeId::Fx => 20016,
            Bif_XoreosFileTypeId::Max => 20017,
            Bif_XoreosFileTypeId::Doc => 20018,
            Bif_XoreosFileTypeId::Scc => 20019,
            Bif_XoreosFileTypeId::Wmp => 20020,
            Bif_XoreosFileTypeId::Osc => 20021,
            Bif_XoreosFileTypeId::Trn => 20022,
            Bif_XoreosFileTypeId::Uen => 20023,
            Bif_XoreosFileTypeId::Ros => 20024,
            Bif_XoreosFileTypeId::Rst => 20025,
            Bif_XoreosFileTypeId::Ptx => 20026,
            Bif_XoreosFileTypeId::Ltx => 20027,
            Bif_XoreosFileTypeId::Trx => 20028,
            Bif_XoreosFileTypeId::Nds => 21000,
            Bif_XoreosFileTypeId::Herf => 21001,
            Bif_XoreosFileTypeId::Dict => 21002,
            Bif_XoreosFileTypeId::Small => 21003,
            Bif_XoreosFileTypeId::Cbgt => 21004,
            Bif_XoreosFileTypeId::Cdpth => 21005,
            Bif_XoreosFileTypeId::Emit => 21006,
            Bif_XoreosFileTypeId::Itm => 21007,
            Bif_XoreosFileTypeId::Nanr => 21008,
            Bif_XoreosFileTypeId::Nbfp => 21009,
            Bif_XoreosFileTypeId::Nbfs => 21010,
            Bif_XoreosFileTypeId::Ncer => 21011,
            Bif_XoreosFileTypeId::Ncgr => 21012,
            Bif_XoreosFileTypeId::Nclr => 21013,
            Bif_XoreosFileTypeId::Nftr => 21014,
            Bif_XoreosFileTypeId::Nsbca => 21015,
            Bif_XoreosFileTypeId::Nsbmd => 21016,
            Bif_XoreosFileTypeId::Nsbta => 21017,
            Bif_XoreosFileTypeId::Nsbtp => 21018,
            Bif_XoreosFileTypeId::Nsbtx => 21019,
            Bif_XoreosFileTypeId::Pal => 21020,
            Bif_XoreosFileTypeId::Raw => 21021,
            Bif_XoreosFileTypeId::Sadl => 21022,
            Bif_XoreosFileTypeId::Sdat => 21023,
            Bif_XoreosFileTypeId::Smp => 21024,
            Bif_XoreosFileTypeId::Spl => 21025,
            Bif_XoreosFileTypeId::Vx => 21026,
            Bif_XoreosFileTypeId::Anb => 22000,
            Bif_XoreosFileTypeId::Ani => 22001,
            Bif_XoreosFileTypeId::Cns => 22002,
            Bif_XoreosFileTypeId::Cur => 22003,
            Bif_XoreosFileTypeId::Evt => 22004,
            Bif_XoreosFileTypeId::Fdl => 22005,
            Bif_XoreosFileTypeId::Fxo => 22006,
            Bif_XoreosFileTypeId::Gad => 22007,
            Bif_XoreosFileTypeId::Gda => 22008,
            Bif_XoreosFileTypeId::Gfx => 22009,
            Bif_XoreosFileTypeId::Ldf => 22010,
            Bif_XoreosFileTypeId::Lst => 22011,
            Bif_XoreosFileTypeId::Mal => 22012,
            Bif_XoreosFileTypeId::Mao => 22013,
            Bif_XoreosFileTypeId::Mmh => 22014,
            Bif_XoreosFileTypeId::Mop => 22015,
            Bif_XoreosFileTypeId::Mor => 22016,
            Bif_XoreosFileTypeId::Msh => 22017,
            Bif_XoreosFileTypeId::Mtx => 22018,
            Bif_XoreosFileTypeId::Ncc => 22019,
            Bif_XoreosFileTypeId::Phy => 22020,
            Bif_XoreosFileTypeId::Plo => 22021,
            Bif_XoreosFileTypeId::Stg => 22022,
            Bif_XoreosFileTypeId::Tbi => 22023,
            Bif_XoreosFileTypeId::Tnt => 22024,
            Bif_XoreosFileTypeId::Arl => 22025,
            Bif_XoreosFileTypeId::Fev => 22026,
            Bif_XoreosFileTypeId::Fsb => 22027,
            Bif_XoreosFileTypeId::Opf => 22028,
            Bif_XoreosFileTypeId::Crf => 22029,
            Bif_XoreosFileTypeId::Rimp => 22030,
            Bif_XoreosFileTypeId::Met => 22031,
            Bif_XoreosFileTypeId::Meta => 22032,
            Bif_XoreosFileTypeId::Fxr => 22033,
            Bif_XoreosFileTypeId::Cif => 22034,
            Bif_XoreosFileTypeId::Cub => 22035,
            Bif_XoreosFileTypeId::Dlb => 22036,
            Bif_XoreosFileTypeId::Nsc => 22037,
            Bif_XoreosFileTypeId::Mov => 23000,
            Bif_XoreosFileTypeId::Curs => 23001,
            Bif_XoreosFileTypeId::Pict => 23002,
            Bif_XoreosFileTypeId::Rsrc => 23003,
            Bif_XoreosFileTypeId::Plist => 23004,
            Bif_XoreosFileTypeId::Cre => 24000,
            Bif_XoreosFileTypeId::Pso => 24001,
            Bif_XoreosFileTypeId::Vso => 24002,
            Bif_XoreosFileTypeId::Abc => 24003,
            Bif_XoreosFileTypeId::Sbm => 24004,
            Bif_XoreosFileTypeId::Pvd => 24005,
            Bif_XoreosFileTypeId::Pla => 24006,
            Bif_XoreosFileTypeId::Trg => 24007,
            Bif_XoreosFileTypeId::Pk => 24008,
            Bif_XoreosFileTypeId::Als => 25000,
            Bif_XoreosFileTypeId::Apl => 25001,
            Bif_XoreosFileTypeId::Assembly => 25002,
            Bif_XoreosFileTypeId::Bak => 25003,
            Bif_XoreosFileTypeId::Bnk => 25004,
            Bif_XoreosFileTypeId::Cl => 25005,
            Bif_XoreosFileTypeId::Cnv => 25006,
            Bif_XoreosFileTypeId::Con => 25007,
            Bif_XoreosFileTypeId::Dat => 25008,
            Bif_XoreosFileTypeId::Dx11 => 25009,
            Bif_XoreosFileTypeId::Ids => 25010,
            Bif_XoreosFileTypeId::Log => 25011,
            Bif_XoreosFileTypeId::Map => 25012,
            Bif_XoreosFileTypeId::Mml => 25013,
            Bif_XoreosFileTypeId::Mp3 => 25014,
            Bif_XoreosFileTypeId::Pck => 25015,
            Bif_XoreosFileTypeId::Rml => 25016,
            Bif_XoreosFileTypeId::S => 25017,
            Bif_XoreosFileTypeId::Sta => 25018,
            Bif_XoreosFileTypeId::Svr => 25019,
            Bif_XoreosFileTypeId::Vlm => 25020,
            Bif_XoreosFileTypeId::Wbd => 25021,
            Bif_XoreosFileTypeId::Xbx => 25022,
            Bif_XoreosFileTypeId::Xls => 25023,
            Bif_XoreosFileTypeId::Bzf => 26000,
            Bif_XoreosFileTypeId::Adv => 27000,
            Bif_XoreosFileTypeId::Json => 28000,
            Bif_XoreosFileTypeId::TlkExpert => 28001,
            Bif_XoreosFileTypeId::TlkMobile => 28002,
            Bif_XoreosFileTypeId::TlkTouch => 28003,
            Bif_XoreosFileTypeId::Otf => 28004,
            Bif_XoreosFileTypeId::Par => 28005,
            Bif_XoreosFileTypeId::Xwb => 29000,
            Bif_XoreosFileTypeId::Xsb => 29001,
            Bif_XoreosFileTypeId::Xds => 30000,
            Bif_XoreosFileTypeId::Wnd => 30001,
            Bif_XoreosFileTypeId::Xeositex => 40000,
            Bif_XoreosFileTypeId::Unknown(v) => v
        }
    }
}

impl Default for Bif_XoreosFileTypeId {
    fn default() -> Self { Bif_XoreosFileTypeId::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Bif_VarResourceEntry {
    pub _root: SharedType<Bif>,
    pub _parent: SharedType<Bif_VarResourceTable>,
    pub _self: SharedType<Self>,
    resource_id: RefCell<u32>,
    offset: RefCell<u32>,
    file_size: RefCell<u32>,
    resource_type: RefCell<Bif_XoreosFileTypeId>,
    _io: RefCell<BytesReader>,
    f_data: Cell<bool>,
    data: RefCell<Vec<u8>>,
}
impl KStruct for Bif_VarResourceEntry {
    type Root = Bif;
    type Parent = Bif_VarResourceTable;

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
        *self_rc.resource_id.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.file_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.resource_type.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        Ok(())
    }
}
impl Bif_VarResourceEntry {

    /**
     * Raw binary data for the resource (read at specified offset).
     */
    pub fn data(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        let _pos = _io.pos();
        _io.seek(*self.offset() as usize)?;
        *self.data.borrow_mut() = _io.read_bytes(*self.file_size() as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.data.borrow())
    }
}

/**
 * Resource ID (matches KEY file entry).
 * Encodes BIF index (bits 31-20) and resource index (bits 19-0).
 * Formula: resource_id = (bif_index << 20) | resource_index
 */
impl Bif_VarResourceEntry {
    pub fn resource_id(&self) -> Ref<'_, u32> {
        self.resource_id.borrow()
    }
}

/**
 * Byte offset to resource data in file (absolute file offset).
 */
impl Bif_VarResourceEntry {
    pub fn offset(&self) -> Ref<'_, u32> {
        self.offset.borrow()
    }
}

/**
 * Uncompressed size of resource data in bytes.
 */
impl Bif_VarResourceEntry {
    pub fn file_size(&self) -> Ref<'_, u32> {
        self.file_size.borrow()
    }
}

/**
 * Resource type identifier (see ResourceType enum).
 */
impl Bif_VarResourceEntry {
    pub fn resource_type(&self) -> Ref<'_, Bif_XoreosFileTypeId> {
        self.resource_type.borrow()
    }
}
impl Bif_VarResourceEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Bif_VarResourceTable {
    pub _root: SharedType<Bif>,
    pub _parent: SharedType<Bif>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Bif_VarResourceEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Bif_VarResourceTable {
    type Root = Bif;
    type Parent = Bif;

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
        let l_entries = *_r.var_res_count();
        for _i in 0..l_entries {
            let t = Self::read_into::<_, Bif_VarResourceEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Bif_VarResourceTable {
}

/**
 * Array of variable resource entries.
 */
impl Bif_VarResourceTable {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Bif_VarResourceEntry>>> {
        self.entries.borrow()
    }
}
impl Bif_VarResourceTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
