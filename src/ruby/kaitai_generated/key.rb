# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# KEY files serve as the master index for all BIF files in the game.
# They map resource names (ResRefs) and types to specific locations within BIF archives.
# 
# The KEY file contains:
# - BIF file entries (filename, size, location)
# - KEY entries mapping ResRef + ResourceType to Resource ID
# 
# References:
# - https://github.com/OldRepublicDevs/PyKotor/wiki/KEY-File-Format.md
# - https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/key.html
# - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/keyreader.cpp
class Key < Kaitai::Struct::Struct

  XOREOS_FILE_TYPE_ID = {
    -1 => :xoreos_file_type_id_none,
    0 => :xoreos_file_type_id_res,
    1 => :xoreos_file_type_id_bmp,
    2 => :xoreos_file_type_id_mve,
    3 => :xoreos_file_type_id_tga,
    4 => :xoreos_file_type_id_wav,
    6 => :xoreos_file_type_id_plt,
    7 => :xoreos_file_type_id_ini,
    8 => :xoreos_file_type_id_bmu,
    9 => :xoreos_file_type_id_mpg,
    10 => :xoreos_file_type_id_txt,
    11 => :xoreos_file_type_id_wma,
    12 => :xoreos_file_type_id_wmv,
    13 => :xoreos_file_type_id_xmv,
    2000 => :xoreos_file_type_id_plh,
    2001 => :xoreos_file_type_id_tex,
    2002 => :xoreos_file_type_id_mdl,
    2003 => :xoreos_file_type_id_thg,
    2005 => :xoreos_file_type_id_fnt,
    2007 => :xoreos_file_type_id_lua,
    2008 => :xoreos_file_type_id_slt,
    2009 => :xoreos_file_type_id_nss,
    2010 => :xoreos_file_type_id_ncs,
    2011 => :xoreos_file_type_id_mod,
    2012 => :xoreos_file_type_id_are,
    2013 => :xoreos_file_type_id_set,
    2014 => :xoreos_file_type_id_ifo,
    2015 => :xoreos_file_type_id_bic,
    2016 => :xoreos_file_type_id_wok,
    2017 => :xoreos_file_type_id_two_da,
    2018 => :xoreos_file_type_id_tlk,
    2022 => :xoreos_file_type_id_txi,
    2023 => :xoreos_file_type_id_git,
    2024 => :xoreos_file_type_id_bti,
    2025 => :xoreos_file_type_id_uti,
    2026 => :xoreos_file_type_id_btc,
    2027 => :xoreos_file_type_id_utc,
    2029 => :xoreos_file_type_id_dlg,
    2030 => :xoreos_file_type_id_itp,
    2031 => :xoreos_file_type_id_btt,
    2032 => :xoreos_file_type_id_utt,
    2033 => :xoreos_file_type_id_dds,
    2034 => :xoreos_file_type_id_bts,
    2035 => :xoreos_file_type_id_uts,
    2036 => :xoreos_file_type_id_ltr,
    2037 => :xoreos_file_type_id_gff,
    2038 => :xoreos_file_type_id_fac,
    2039 => :xoreos_file_type_id_bte,
    2040 => :xoreos_file_type_id_ute,
    2041 => :xoreos_file_type_id_btd,
    2042 => :xoreos_file_type_id_utd,
    2043 => :xoreos_file_type_id_btp,
    2044 => :xoreos_file_type_id_utp,
    2045 => :xoreos_file_type_id_dft,
    2046 => :xoreos_file_type_id_gic,
    2047 => :xoreos_file_type_id_gui,
    2048 => :xoreos_file_type_id_css,
    2049 => :xoreos_file_type_id_ccs,
    2050 => :xoreos_file_type_id_btm,
    2051 => :xoreos_file_type_id_utm,
    2052 => :xoreos_file_type_id_dwk,
    2053 => :xoreos_file_type_id_pwk,
    2054 => :xoreos_file_type_id_btg,
    2055 => :xoreos_file_type_id_utg,
    2056 => :xoreos_file_type_id_jrl,
    2057 => :xoreos_file_type_id_sav,
    2058 => :xoreos_file_type_id_utw,
    2059 => :xoreos_file_type_id_four_pc,
    2060 => :xoreos_file_type_id_ssf,
    2061 => :xoreos_file_type_id_hak,
    2062 => :xoreos_file_type_id_nwm,
    2063 => :xoreos_file_type_id_bik,
    2064 => :xoreos_file_type_id_ndb,
    2065 => :xoreos_file_type_id_ptm,
    2066 => :xoreos_file_type_id_ptt,
    2067 => :xoreos_file_type_id_ncm,
    2068 => :xoreos_file_type_id_mfx,
    2069 => :xoreos_file_type_id_mat,
    2070 => :xoreos_file_type_id_mdb,
    2071 => :xoreos_file_type_id_say,
    2072 => :xoreos_file_type_id_ttf,
    2073 => :xoreos_file_type_id_ttc,
    2074 => :xoreos_file_type_id_cut,
    2075 => :xoreos_file_type_id_ka,
    2076 => :xoreos_file_type_id_jpg,
    2077 => :xoreos_file_type_id_ico,
    2078 => :xoreos_file_type_id_ogg,
    2079 => :xoreos_file_type_id_spt,
    2080 => :xoreos_file_type_id_spw,
    2081 => :xoreos_file_type_id_wfx,
    2082 => :xoreos_file_type_id_ugm,
    2083 => :xoreos_file_type_id_qdb,
    2084 => :xoreos_file_type_id_qst,
    2085 => :xoreos_file_type_id_npc,
    2086 => :xoreos_file_type_id_spn,
    2087 => :xoreos_file_type_id_utx,
    2088 => :xoreos_file_type_id_mmd,
    2089 => :xoreos_file_type_id_smm,
    2090 => :xoreos_file_type_id_uta,
    2091 => :xoreos_file_type_id_mde,
    2092 => :xoreos_file_type_id_mdv,
    2093 => :xoreos_file_type_id_mda,
    2094 => :xoreos_file_type_id_mba,
    2095 => :xoreos_file_type_id_oct,
    2096 => :xoreos_file_type_id_bfx,
    2097 => :xoreos_file_type_id_pdb,
    2098 => :xoreos_file_type_id_the_witcher_save,
    2099 => :xoreos_file_type_id_pvs,
    2100 => :xoreos_file_type_id_cfx,
    2101 => :xoreos_file_type_id_luc,
    2103 => :xoreos_file_type_id_prb,
    2104 => :xoreos_file_type_id_cam,
    2105 => :xoreos_file_type_id_vds,
    2106 => :xoreos_file_type_id_bin,
    2107 => :xoreos_file_type_id_wob,
    2108 => :xoreos_file_type_id_api,
    2109 => :xoreos_file_type_id_properties,
    2110 => :xoreos_file_type_id_png,
    3000 => :xoreos_file_type_id_lyt,
    3001 => :xoreos_file_type_id_vis,
    3002 => :xoreos_file_type_id_rim,
    3003 => :xoreos_file_type_id_pth,
    3004 => :xoreos_file_type_id_lip,
    3005 => :xoreos_file_type_id_bwm,
    3006 => :xoreos_file_type_id_txb,
    3007 => :xoreos_file_type_id_tpc,
    3008 => :xoreos_file_type_id_mdx,
    3009 => :xoreos_file_type_id_rsv,
    3010 => :xoreos_file_type_id_sig,
    3011 => :xoreos_file_type_id_mab,
    3012 => :xoreos_file_type_id_qst2,
    3013 => :xoreos_file_type_id_sto,
    3015 => :xoreos_file_type_id_hex,
    3016 => :xoreos_file_type_id_mdx2,
    3017 => :xoreos_file_type_id_txb2,
    3022 => :xoreos_file_type_id_fsm,
    3023 => :xoreos_file_type_id_art,
    3024 => :xoreos_file_type_id_amp,
    3025 => :xoreos_file_type_id_cwa,
    3028 => :xoreos_file_type_id_bip,
    4000 => :xoreos_file_type_id_mdb2,
    4001 => :xoreos_file_type_id_mda2,
    4002 => :xoreos_file_type_id_spt2,
    4003 => :xoreos_file_type_id_gr2,
    4004 => :xoreos_file_type_id_fxa,
    4005 => :xoreos_file_type_id_fxe,
    4007 => :xoreos_file_type_id_jpg2,
    4008 => :xoreos_file_type_id_pwc,
    9996 => :xoreos_file_type_id_one_da,
    9997 => :xoreos_file_type_id_erf,
    9998 => :xoreos_file_type_id_bif,
    9999 => :xoreos_file_type_id_key,
    19000 => :xoreos_file_type_id_exe,
    19001 => :xoreos_file_type_id_dbf,
    19002 => :xoreos_file_type_id_cdx,
    19003 => :xoreos_file_type_id_fpt,
    20000 => :xoreos_file_type_id_zip,
    20001 => :xoreos_file_type_id_fxm,
    20002 => :xoreos_file_type_id_fxs,
    20003 => :xoreos_file_type_id_xml,
    20004 => :xoreos_file_type_id_wlk,
    20005 => :xoreos_file_type_id_utr,
    20006 => :xoreos_file_type_id_sef,
    20007 => :xoreos_file_type_id_pfx,
    20008 => :xoreos_file_type_id_tfx,
    20009 => :xoreos_file_type_id_ifx,
    20010 => :xoreos_file_type_id_lfx,
    20011 => :xoreos_file_type_id_bbx,
    20012 => :xoreos_file_type_id_pfb,
    20013 => :xoreos_file_type_id_upe,
    20014 => :xoreos_file_type_id_usc,
    20015 => :xoreos_file_type_id_ult,
    20016 => :xoreos_file_type_id_fx,
    20017 => :xoreos_file_type_id_max,
    20018 => :xoreos_file_type_id_doc,
    20019 => :xoreos_file_type_id_scc,
    20020 => :xoreos_file_type_id_wmp,
    20021 => :xoreos_file_type_id_osc,
    20022 => :xoreos_file_type_id_trn,
    20023 => :xoreos_file_type_id_uen,
    20024 => :xoreos_file_type_id_ros,
    20025 => :xoreos_file_type_id_rst,
    20026 => :xoreos_file_type_id_ptx,
    20027 => :xoreos_file_type_id_ltx,
    20028 => :xoreos_file_type_id_trx,
    21000 => :xoreos_file_type_id_nds,
    21001 => :xoreos_file_type_id_herf,
    21002 => :xoreos_file_type_id_dict,
    21003 => :xoreos_file_type_id_small,
    21004 => :xoreos_file_type_id_cbgt,
    21005 => :xoreos_file_type_id_cdpth,
    21006 => :xoreos_file_type_id_emit,
    21007 => :xoreos_file_type_id_itm,
    21008 => :xoreos_file_type_id_nanr,
    21009 => :xoreos_file_type_id_nbfp,
    21010 => :xoreos_file_type_id_nbfs,
    21011 => :xoreos_file_type_id_ncer,
    21012 => :xoreos_file_type_id_ncgr,
    21013 => :xoreos_file_type_id_nclr,
    21014 => :xoreos_file_type_id_nftr,
    21015 => :xoreos_file_type_id_nsbca,
    21016 => :xoreos_file_type_id_nsbmd,
    21017 => :xoreos_file_type_id_nsbta,
    21018 => :xoreos_file_type_id_nsbtp,
    21019 => :xoreos_file_type_id_nsbtx,
    21020 => :xoreos_file_type_id_pal,
    21021 => :xoreos_file_type_id_raw,
    21022 => :xoreos_file_type_id_sadl,
    21023 => :xoreos_file_type_id_sdat,
    21024 => :xoreos_file_type_id_smp,
    21025 => :xoreos_file_type_id_spl,
    21026 => :xoreos_file_type_id_vx,
    22000 => :xoreos_file_type_id_anb,
    22001 => :xoreos_file_type_id_ani,
    22002 => :xoreos_file_type_id_cns,
    22003 => :xoreos_file_type_id_cur,
    22004 => :xoreos_file_type_id_evt,
    22005 => :xoreos_file_type_id_fdl,
    22006 => :xoreos_file_type_id_fxo,
    22007 => :xoreos_file_type_id_gad,
    22008 => :xoreos_file_type_id_gda,
    22009 => :xoreos_file_type_id_gfx,
    22010 => :xoreos_file_type_id_ldf,
    22011 => :xoreos_file_type_id_lst,
    22012 => :xoreos_file_type_id_mal,
    22013 => :xoreos_file_type_id_mao,
    22014 => :xoreos_file_type_id_mmh,
    22015 => :xoreos_file_type_id_mop,
    22016 => :xoreos_file_type_id_mor,
    22017 => :xoreos_file_type_id_msh,
    22018 => :xoreos_file_type_id_mtx,
    22019 => :xoreos_file_type_id_ncc,
    22020 => :xoreos_file_type_id_phy,
    22021 => :xoreos_file_type_id_plo,
    22022 => :xoreos_file_type_id_stg,
    22023 => :xoreos_file_type_id_tbi,
    22024 => :xoreos_file_type_id_tnt,
    22025 => :xoreos_file_type_id_arl,
    22026 => :xoreos_file_type_id_fev,
    22027 => :xoreos_file_type_id_fsb,
    22028 => :xoreos_file_type_id_opf,
    22029 => :xoreos_file_type_id_crf,
    22030 => :xoreos_file_type_id_rimp,
    22031 => :xoreos_file_type_id_met,
    22032 => :xoreos_file_type_id_meta,
    22033 => :xoreos_file_type_id_fxr,
    22034 => :xoreos_file_type_id_cif,
    22035 => :xoreos_file_type_id_cub,
    22036 => :xoreos_file_type_id_dlb,
    22037 => :xoreos_file_type_id_nsc,
    23000 => :xoreos_file_type_id_mov,
    23001 => :xoreos_file_type_id_curs,
    23002 => :xoreos_file_type_id_pict,
    23003 => :xoreos_file_type_id_rsrc,
    23004 => :xoreos_file_type_id_plist,
    24000 => :xoreos_file_type_id_cre,
    24001 => :xoreos_file_type_id_pso,
    24002 => :xoreos_file_type_id_vso,
    24003 => :xoreos_file_type_id_abc,
    24004 => :xoreos_file_type_id_sbm,
    24005 => :xoreos_file_type_id_pvd,
    24006 => :xoreos_file_type_id_pla,
    24007 => :xoreos_file_type_id_trg,
    24008 => :xoreos_file_type_id_pk,
    25000 => :xoreos_file_type_id_als,
    25001 => :xoreos_file_type_id_apl,
    25002 => :xoreos_file_type_id_assembly,
    25003 => :xoreos_file_type_id_bak,
    25004 => :xoreos_file_type_id_bnk,
    25005 => :xoreos_file_type_id_cl,
    25006 => :xoreos_file_type_id_cnv,
    25007 => :xoreos_file_type_id_con,
    25008 => :xoreos_file_type_id_dat,
    25009 => :xoreos_file_type_id_dx11,
    25010 => :xoreos_file_type_id_ids,
    25011 => :xoreos_file_type_id_log,
    25012 => :xoreos_file_type_id_map,
    25013 => :xoreos_file_type_id_mml,
    25014 => :xoreos_file_type_id_mp3,
    25015 => :xoreos_file_type_id_pck,
    25016 => :xoreos_file_type_id_rml,
    25017 => :xoreos_file_type_id_s,
    25018 => :xoreos_file_type_id_sta,
    25019 => :xoreos_file_type_id_svr,
    25020 => :xoreos_file_type_id_vlm,
    25021 => :xoreos_file_type_id_wbd,
    25022 => :xoreos_file_type_id_xbx,
    25023 => :xoreos_file_type_id_xls,
    26000 => :xoreos_file_type_id_bzf,
    27000 => :xoreos_file_type_id_adv,
    28000 => :xoreos_file_type_id_json,
    28001 => :xoreos_file_type_id_tlk_expert,
    28002 => :xoreos_file_type_id_tlk_mobile,
    28003 => :xoreos_file_type_id_tlk_touch,
    28004 => :xoreos_file_type_id_otf,
    28005 => :xoreos_file_type_id_par,
    29000 => :xoreos_file_type_id_xwb,
    29001 => :xoreos_file_type_id_xsb,
    30000 => :xoreos_file_type_id_xds,
    30001 => :xoreos_file_type_id_wnd,
    40000 => :xoreos_file_type_id_xeositex,
  }
  I__XOREOS_FILE_TYPE_ID = XOREOS_FILE_TYPE_ID.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @file_type = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
    raise Kaitai::Struct::ValidationNotEqualError.new("KEY ", @file_type, @_io, "/seq/0") if not @file_type == "KEY "
    @file_version = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
    raise Kaitai::Struct::ValidationNotAnyOfError.new(@file_version, @_io, "/seq/1") if not  ((@file_version == "V1  ") || (@file_version == "V1.1")) 
    @bif_count = @_io.read_u4le
    @key_count = @_io.read_u4le
    @file_table_offset = @_io.read_u4le
    @key_table_offset = @_io.read_u4le
    @build_year = @_io.read_u4le
    @build_day = @_io.read_u4le
    @reserved = @_io.read_bytes(32)
    self
  end
  class FileEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_size = @_io.read_u4le
      @filename_offset = @_io.read_u4le
      @filename_size = @_io.read_u2le
      @drives = @_io.read_u2le
      self
    end

    ##
    # BIF filename (read from filename table at specified offset).
    def filename
      return @filename unless @filename.nil?
      _pos = @_io.pos
      @_io.seek((_root.file_table_offset + _root.bif_count * 12) + filename_offset)
      @filename = (@_io.read_bytes(filename_size)).force_encoding("ASCII").encode('UTF-8')
      @_io.seek(_pos)
      @filename
    end

    ##
    # Size of the BIF file on disk in bytes.
    attr_reader :file_size

    ##
    # Byte offset into the filename table where this BIF's filename is stored.
    attr_reader :filename_offset

    ##
    # Length of the filename in bytes (including null terminator).
    attr_reader :filename_size

    ##
    # Drive flags indicating which media contains the BIF file.
    # Bit flags: 0x0001=HD0, 0x0002=CD1, 0x0004=CD2, 0x0008=CD3, 0x0010=CD4.
    # Modern distributions typically use 0x0001 (HD) for all files.
    attr_reader :drives
  end
  class FileTable < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      (_root.bif_count).times { |i|
        @entries << FileEntry.new(@_io, self, @_root)
      }
      self
    end

    ##
    # Array of BIF file entries.
    attr_reader :entries
  end
  class FilenameTable < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @filenames = (@_io.read_bytes_full).force_encoding("ASCII").encode('UTF-8')
      self
    end

    ##
    # Null-terminated BIF filenames concatenated together.
    # Each filename is read using the filename_offset and filename_size
    # from the corresponding file_entry.
    attr_reader :filenames
  end
  class KeyEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @resref = (@_io.read_bytes(16)).force_encoding("ASCII").encode('UTF-8')
      @resource_type = Kaitai::Struct::Stream::resolve_enum(Key::XOREOS_FILE_TYPE_ID, @_io.read_u2le)
      @resource_id = @_io.read_u4le
      self
    end

    ##
    # Resource filename (ResRef) without extension.
    # Null-padded, maximum 16 characters.
    # The game uses this name to access the resource.
    attr_reader :resref

    ##
    # Resource type identifier (see ResourceType enum).
    attr_reader :resource_type

    ##
    # Encoded resource location.
    # Bits 31-20: BIF index (top 12 bits) - index into file table
    # Bits 19-0: Resource index (bottom 20 bits) - index within the BIF file
    # 
    # Formula: resource_id = (bif_index << 20) | resource_index
    # 
    # Decoding:
    # - bif_index = (resource_id >> 20) & 0xFFF
    # - resource_index = resource_id & 0xFFFFF
    attr_reader :resource_id
  end
  class KeyTable < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      (_root.key_count).times { |i|
        @entries << KeyEntry.new(@_io, self, @_root)
      }
      self
    end

    ##
    # Array of resource entries.
    attr_reader :entries
  end

  ##
  # File table containing BIF file entries.
  def file_table
    return @file_table unless @file_table.nil?
    if bif_count > 0
      _pos = @_io.pos
      @_io.seek(file_table_offset)
      @file_table = FileTable.new(@_io, self, @_root)
      @_io.seek(_pos)
    end
    @file_table
  end

  ##
  # KEY table containing resource entries.
  def key_table
    return @key_table unless @key_table.nil?
    if key_count > 0
      _pos = @_io.pos
      @_io.seek(key_table_offset)
      @key_table = KeyTable.new(@_io, self, @_root)
      @_io.seek(_pos)
    end
    @key_table
  end

  ##
  # File type signature. Must be "KEY " (space-padded).
  attr_reader :file_type

  ##
  # File format version. Typically "V1  " or "V1.1".
  attr_reader :file_version

  ##
  # Number of BIF files referenced by this KEY file.
  attr_reader :bif_count

  ##
  # Number of resource entries in the KEY table.
  attr_reader :key_count

  ##
  # Byte offset to the file table from the beginning of the file.
  attr_reader :file_table_offset

  ##
  # Byte offset to the KEY table from the beginning of the file.
  attr_reader :key_table_offset

  ##
  # Build year (years since 1900).
  attr_reader :build_year

  ##
  # Build day (days since January 1).
  attr_reader :build_day

  ##
  # Reserved padding (usually zeros).
  attr_reader :reserved
end
