import kaitai_struct_nim_runtime
import options

type
  Bif* = ref object of KaitaiStruct
    `fileType`*: string
    `version`*: string
    `varResCount`*: uint32
    `fixedResCount`*: uint32
    `varTableOffset`*: uint32
    `parent`*: KaitaiStruct
    `varResourceTableInst`: Bif_VarResourceTable
    `varResourceTableInstFlag`: bool
  Bif_XoreosFileTypeId* = enum
    none = -1
    res = 0
    bmp = 1
    mve = 2
    tga = 3
    wav = 4
    plt = 6
    ini = 7
    bmu = 8
    mpg = 9
    txt = 10
    wma = 11
    wmv = 12
    xmv = 13
    plh = 2000
    tex = 2001
    mdl = 2002
    thg = 2003
    fnt = 2005
    lua = 2007
    slt = 2008
    nss = 2009
    ncs = 2010
    mod = 2011
    are = 2012
    set = 2013
    ifo = 2014
    bic = 2015
    wok = 2016
    two_da = 2017
    tlk = 2018
    txi = 2022
    git = 2023
    bti = 2024
    uti = 2025
    btc = 2026
    utc = 2027
    dlg = 2029
    itp = 2030
    btt = 2031
    utt = 2032
    dds = 2033
    bts = 2034
    uts = 2035
    ltr = 2036
    gff = 2037
    fac = 2038
    bte = 2039
    ute = 2040
    btd = 2041
    utd = 2042
    btp = 2043
    utp = 2044
    dft = 2045
    gic = 2046
    gui = 2047
    css = 2048
    ccs = 2049
    btm = 2050
    utm = 2051
    dwk = 2052
    pwk = 2053
    btg = 2054
    utg = 2055
    jrl = 2056
    sav = 2057
    utw = 2058
    four_pc = 2059
    ssf = 2060
    hak = 2061
    nwm = 2062
    bik = 2063
    ndb = 2064
    ptm = 2065
    ptt = 2066
    ncm = 2067
    mfx = 2068
    mat = 2069
    mdb = 2070
    say = 2071
    ttf = 2072
    ttc = 2073
    cut = 2074
    ka = 2075
    jpg = 2076
    ico = 2077
    ogg = 2078
    spt = 2079
    spw = 2080
    wfx = 2081
    ugm = 2082
    qdb = 2083
    qst = 2084
    npc = 2085
    spn = 2086
    utx = 2087
    mmd = 2088
    smm = 2089
    uta = 2090
    mde = 2091
    mdv = 2092
    mda = 2093
    mba = 2094
    oct = 2095
    bfx = 2096
    pdb = 2097
    the_witcher_save = 2098
    pvs = 2099
    cfx = 2100
    luc = 2101
    prb = 2103
    cam = 2104
    vds = 2105
    bin = 2106
    wob = 2107
    api = 2108
    properties = 2109
    png = 2110
    lyt = 3000
    vis = 3001
    rim = 3002
    pth = 3003
    lip = 3004
    bwm = 3005
    txb = 3006
    tpc = 3007
    mdx = 3008
    rsv = 3009
    sig = 3010
    mab = 3011
    qst2 = 3012
    sto = 3013
    hex = 3015
    mdx2 = 3016
    txb2 = 3017
    fsm = 3022
    art = 3023
    amp = 3024
    cwa = 3025
    bip = 3028
    mdb2 = 4000
    mda2 = 4001
    spt2 = 4002
    gr2 = 4003
    fxa = 4004
    fxe = 4005
    jpg2 = 4007
    pwc = 4008
    one_da = 9996
    erf = 9997
    bif = 9998
    key = 9999
    exe = 19000
    dbf = 19001
    cdx = 19002
    fpt = 19003
    zip = 20000
    fxm = 20001
    fxs = 20002
    xml = 20003
    wlk = 20004
    utr = 20005
    sef = 20006
    pfx = 20007
    tfx = 20008
    ifx = 20009
    lfx = 20010
    bbx = 20011
    pfb = 20012
    upe = 20013
    usc = 20014
    ult = 20015
    fx = 20016
    max = 20017
    doc = 20018
    scc = 20019
    wmp = 20020
    osc = 20021
    trn = 20022
    uen = 20023
    ros = 20024
    rst = 20025
    ptx = 20026
    ltx = 20027
    trx = 20028
    nds = 21000
    herf = 21001
    dict = 21002
    small = 21003
    cbgt = 21004
    cdpth = 21005
    emit = 21006
    itm = 21007
    nanr = 21008
    nbfp = 21009
    nbfs = 21010
    ncer = 21011
    ncgr = 21012
    nclr = 21013
    nftr = 21014
    nsbca = 21015
    nsbmd = 21016
    nsbta = 21017
    nsbtp = 21018
    nsbtx = 21019
    pal = 21020
    raw = 21021
    sadl = 21022
    sdat = 21023
    smp = 21024
    spl = 21025
    vx = 21026
    anb = 22000
    ani = 22001
    cns = 22002
    cur = 22003
    evt = 22004
    fdl = 22005
    fxo = 22006
    gad = 22007
    gda = 22008
    gfx = 22009
    ldf = 22010
    lst = 22011
    mal = 22012
    mao = 22013
    mmh = 22014
    mop = 22015
    mor = 22016
    msh = 22017
    mtx = 22018
    ncc = 22019
    phy = 22020
    plo = 22021
    stg = 22022
    tbi = 22023
    tnt = 22024
    arl = 22025
    fev = 22026
    fsb = 22027
    opf = 22028
    crf = 22029
    rimp = 22030
    met = 22031
    meta = 22032
    fxr = 22033
    cif = 22034
    cub = 22035
    dlb = 22036
    nsc = 22037
    mov = 23000
    curs = 23001
    pict = 23002
    rsrc = 23003
    plist = 23004
    cre = 24000
    pso = 24001
    vso = 24002
    abc = 24003
    sbm = 24004
    pvd = 24005
    pla = 24006
    trg = 24007
    pk = 24008
    als = 25000
    apl = 25001
    assembly = 25002
    bak = 25003
    bnk = 25004
    cl = 25005
    cnv = 25006
    con = 25007
    dat = 25008
    dx11 = 25009
    ids = 25010
    log = 25011
    map = 25012
    mml = 25013
    mp3 = 25014
    pck = 25015
    rml = 25016
    s = 25017
    sta = 25018
    svr = 25019
    vlm = 25020
    wbd = 25021
    xbx = 25022
    xls = 25023
    bzf = 26000
    adv = 27000
    json = 28000
    tlk_expert = 28001
    tlk_mobile = 28002
    tlk_touch = 28003
    otf = 28004
    par = 28005
    xwb = 29000
    xsb = 29001
    xds = 30000
    wnd = 30001
    xeositex = 40000
  Bif_VarResourceEntry* = ref object of KaitaiStruct
    `resourceId`*: uint32
    `offset`*: uint32
    `fileSize`*: uint32
    `resourceType`*: Bif_XoreosFileTypeId
    `parent`*: Bif_VarResourceTable
    `dataInst`: seq[byte]
    `dataInstFlag`: bool
  Bif_VarResourceTable* = ref object of KaitaiStruct
    `entries`*: seq[Bif_VarResourceEntry]
    `parent`*: Bif

proc read*(_: typedesc[Bif], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bif
proc read*(_: typedesc[Bif_VarResourceEntry], io: KaitaiStream, root: KaitaiStruct, parent: Bif_VarResourceTable): Bif_VarResourceEntry
proc read*(_: typedesc[Bif_VarResourceTable], io: KaitaiStream, root: KaitaiStruct, parent: Bif): Bif_VarResourceTable

proc varResourceTable*(this: Bif): Bif_VarResourceTable
proc data*(this: Bif_VarResourceEntry): seq[byte]


##[
BIF (BioWare Index File) files are archive containers that store game resources.
They work in tandem with KEY files which provide the filename-to-resource mappings.

BIF files contain only resource IDs, types, and data - the actual filenames (ResRefs)
are stored in the KEY file and matched via the resource ID.

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/BIF-File-Format.md
- https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/bif.html
- https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/bifreader.cpp

]##
proc read*(_: typedesc[Bif], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bif =
  template this: untyped = result
  this = new(Bif)
  let root = if root == nil: cast[Bif](this) else: cast[Bif](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  File type signature. Must be "BIFF" for BIF files.
  ]##
  let fileTypeExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.fileType = fileTypeExpr

  ##[
  File format version. Typically "V1  " or "V1.1".
  ]##
  let versionExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.version = versionExpr

  ##[
  Number of variable-size resources in this file.
  ]##
  let varResCountExpr = this.io.readU4le()
  this.varResCount = varResCountExpr

  ##[
  Number of fixed-size resources (always 0 in KotOR, legacy from NWN).
  ]##
  let fixedResCountExpr = this.io.readU4le()
  this.fixedResCount = fixedResCountExpr

  ##[
  Byte offset to the variable resource table from the beginning of the file.
  ]##
  let varTableOffsetExpr = this.io.readU4le()
  this.varTableOffset = varTableOffsetExpr

proc varResourceTable(this: Bif): Bif_VarResourceTable = 

  ##[
  Variable resource table containing entries for each resource.
  ]##
  if this.varResourceTableInstFlag:
    return this.varResourceTableInst
  if this.varResCount > 0:
    let pos = this.io.pos()
    this.io.seek(int(this.varTableOffset))
    let varResourceTableInstExpr = Bif_VarResourceTable.read(this.io, this.root, this)
    this.varResourceTableInst = varResourceTableInstExpr
    this.io.seek(pos)
  this.varResourceTableInstFlag = true
  return this.varResourceTableInst

proc fromFile*(_: typedesc[Bif], filename: string): Bif =
  Bif.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bif_VarResourceEntry], io: KaitaiStream, root: KaitaiStruct, parent: Bif_VarResourceTable): Bif_VarResourceEntry =
  template this: untyped = result
  this = new(Bif_VarResourceEntry)
  let root = if root == nil: cast[Bif](this) else: cast[Bif](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Resource ID (matches KEY file entry).
Encodes BIF index (bits 31-20) and resource index (bits 19-0).
Formula: resource_id = (bif_index << 20) | resource_index

  ]##
  let resourceIdExpr = this.io.readU4le()
  this.resourceId = resourceIdExpr

  ##[
  Byte offset to resource data in file (absolute file offset).
  ]##
  let offsetExpr = this.io.readU4le()
  this.offset = offsetExpr

  ##[
  Uncompressed size of resource data in bytes.
  ]##
  let fileSizeExpr = this.io.readU4le()
  this.fileSize = fileSizeExpr

  ##[
  Resource type identifier (see ResourceType enum).
  ]##
  let resourceTypeExpr = Bif_XoreosFileTypeId(this.io.readU4le())
  this.resourceType = resourceTypeExpr

proc data(this: Bif_VarResourceEntry): seq[byte] = 

  ##[
  Raw binary data for the resource (read at specified offset).
  ]##
  if this.dataInstFlag:
    return this.dataInst
  let pos = this.io.pos()
  this.io.seek(int(this.offset))
  let dataInstExpr = this.io.readBytes(int(this.fileSize))
  this.dataInst = dataInstExpr
  this.io.seek(pos)
  this.dataInstFlag = true
  return this.dataInst

proc fromFile*(_: typedesc[Bif_VarResourceEntry], filename: string): Bif_VarResourceEntry =
  Bif_VarResourceEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bif_VarResourceTable], io: KaitaiStream, root: KaitaiStruct, parent: Bif): Bif_VarResourceTable =
  template this: untyped = result
  this = new(Bif_VarResourceTable)
  let root = if root == nil: cast[Bif](this) else: cast[Bif](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Array of variable resource entries.
  ]##
  for i in 0 ..< int(Bif(this.root).varResCount):
    let it = Bif_VarResourceEntry.read(this.io, this.root, this)
    this.entries.add(it)

proc fromFile*(_: typedesc[Bif_VarResourceTable], filename: string): Bif_VarResourceTable =
  Bif_VarResourceTable.read(newKaitaiFileStream(filename), nil, nil)

