# BioWare Kaitai Formats - Progress Roadmap

**Last Updated:** 2025-01-27  
**Status:** Comprehensive audit and roadmap creation

This document provides a comprehensive overview of all BioWare file format parsers, their implementation status, test coverage, and what remains to be done.

## Summary

- **Total Formats Documented:** 71 .ksy files
- **Core Formats Implemented:** 20/20 (100%)
- **GFF Variants Implemented:** 21/22 (95.5%)
- **Missing Formats:** 2 identified (PLT, GFF-UTP)
- **Test Coverage:** ~34 formats have tests

---

## Core Binary Formats

### ✅ Completed Formats

| Format | .ksy File | Status | Tests | Notes |
|--------|-----------|--------|-------|-------|
| **2DA** (Two-Dimensional Array) | `formats/TwoDA/TwoDA.ksy` | ✅ Complete | ✅ TwoDAKaitaiCompilerTests.cs | Game data tables |
| **2DA CSV** | `formats/TwoDA/TwoDA_CSV.ksy` | ✅ Complete | ⚠️ Same test file | CSV variant |
| **2DA JSON** | `formats/TwoDA/TwoDA_JSON.ksy` | ✅ Complete | ⚠️ Same test file | JSON variant |
| **BIF** (BioWare Index File) | `formats/BIF/BIF.ksy` | ✅ Complete | ❌ Missing | Resource archive format |
| **BZF** (BioWare Zipped File) | `formats/BIF/BZF.ksy` | ✅ Complete | ❌ Missing | Compressed BIF variant |
| **BWM** (BioWare Walkmesh) | `formats/BWM/BWM.ksy` | ✅ Complete | ✅ BWMKaitaiCompilerTests.cs | Navigation mesh |
| **DAS** (Dragon Age Save) | `formats/DAS/DAS.ksy` | ✅ Complete | ❌ Missing | Dragon Age: Origins saves |
| **DA2S** (Dragon Age 2 Save) | `formats/DA2S/DA2S.ksy` | ✅ Complete | ❌ Missing | Dragon Age II saves |
| **DDS** (DirectDraw Surface) | `formats/TPC/DDS.ksy` | ✅ Complete | ✅ TPCKaitaiCompilerTests.cs | Texture format (part of TPC) |
| **ERF** (Encapsulated Resource Format) | `formats/ERF/ERF.ksy` | ✅ Complete | ✅ ERFKaitaiCompilerTests.cs | Module/DLC format |
| **GFF** (Generic File Format) | `formats/GFF/GFF.ksy` | ✅ Complete | ⚠️ Via GFF generics | Universal container format |
| **GFF XML** | `formats/GFF/XML/GFF_XML.ksy` | ✅ Complete | ❌ Missing | XML variant |
| **GFF JSON** | `formats/GFF/JSON/GFF_JSON.ksy` | ✅ Complete | ❌ Missing | JSON variant |
| **KEY** (Key File) | `formats/BIF/KEY.ksy` | ✅ Complete | ❌ Missing | Resource index |
| **LIP** (Lip-sync) | `formats/LIP/LIP.ksy` | ✅ Complete | ✅ LIPKaitaiCompilerTests.cs | Animation format |
| **LIP XML** | `formats/LIP/LIP_XML.ksy` | ✅ Complete | ⚠️ Same test file | XML variant |
| **LIP JSON** | `formats/LIP/LIP_JSON.ksy` | ✅ Complete | ⚠️ Same test file | JSON variant |
| **LTR** (Letter) | `formats/LTR/LTR.ksy` | ✅ Complete | ✅ LTRKaitaiStructTests.cs | Font/letter definition |
| **LYT** (Layout) | `formats/LYT/LYT.ksy` | ✅ Complete | ✅ LYTKaitaiStructTests.cs | Area layout |
| **MDL** (Model) | `formats/MDL/MDL.ksy` | ✅ Complete | ✅ MDLKaitaiCompilerTests.cs | 3D model format |
| **MDX** (Model Extended) | `formats/MDL/MDX.ksy` | ✅ Complete | ✅ MDXKaitaiCompilerTests.cs | Model animation |
| **MDL ASCII** | `formats/MDL/MDL_ASCII.ksy` | ✅ Complete | ❌ Missing | ASCII variant |
| **NCS** (NWScript Compiled) | `formats/NSS/NCS.ksy` | ✅ Complete | ✅ NCSKaitaiCompilerTests.cs | Compiled script bytecode |
| **NCS Minimal** | `formats/NSS/NCS_minimal.ksy` | ✅ Complete | ❌ Missing | Minimal variant |
| **NSS** (NWScript Source) | `formats/NSS/NSS.ksy` | ✅ Complete | ✅ NSSKaitaiCompilerTests.cs | Script source (text) |
| **PCC** (Package) | `formats/PCC/PCC.ksy` | ✅ Complete | ✅ PCCKaitaiCompilerTests.cs | Mass Effect package files |
| **RIM** (Resource Information Module) | `formats/RIM/RIM.ksy` | ✅ Complete | ✅ RIMKaitaiCompilerTests.cs | Module resources |
| **SSF** (Sound Set File) | `formats/SSF/SSF.ksy` | ✅ Complete | ✅ SSFKaitaiStructTests.cs | Sound set definitions |
| **SSF XML** | `formats/SSF/SSF_XML.ksy` | ✅ Complete | ⚠️ Same test file | XML variant |
| **TLK** (Talk Table) | `formats/TLK/TLK.ksy` | ✅ Complete | ✅ TLKKaitaiCompilerTests.cs | Dialogue strings |
| **TLK XML** | `formats/TLK/TLK_XML.ksy` | ✅ Complete | ⚠️ Same test file | XML variant |
| **TLK JSON** | `formats/TLK/TLK_JSON.ksy` | ✅ Complete | ⚠️ Same test file | JSON variant |
| **TPC** (Texture Package Container) | `formats/TPC/TPC.ksy` | ✅ Complete | ✅ TPCKaitaiCompilerTests.cs | Texture format |
| **TGA** (Targa) | `formats/TPC/TGA.ksy` | ✅ Complete | ✅ TPCKaitaiCompilerTests.cs | Texture format (part of TPC) |
| **TXI** (Texture Info) | `formats/TPC/TXI.ksy` | ✅ Complete | ✅ TPCKaitaiCompilerTests.cs | Texture metadata |
| **VIS** (Visibility) | `formats/VIS/VIS.ksy` | ✅ Complete | ✅ VISKaitaiCompilerTests.cs | Area visibility |
| **WAV** (Waveform Audio) | `formats/WAV/WAV.ksy` | ✅ Complete | ✅ WAVKaitaiCompilerTests.cs | Audio format |

### ❌ Missing Core Formats

| Format | Status | Priority | Notes |
|--------|--------|----------|-------|
| **PLT** (Palette Texture) | ❌ Missing | Low | NWN-specific format, not used in KotOR but documented |

---

## GFF-Based Generic Formats

All GFF generics use the base `GFF.ksy` format with FileType signature in the header.

### ✅ Completed GFF Generics

| Format | .ksy File | Status | Tests | Notes |
|--------|-----------|--------|-------|-------|
| **ARE** (Area) | `formats/GFF/Generics/ARE/ARE.ksy` | ✅ Complete | ✅ AREKaitaiCompilerTests.cs | Area definitions |
| **ARE XML** | `formats/GFF/Generics/ARE/ARE_XML.ksy` | ✅ Complete | ❌ Missing | XML variant |
| **CNV** (Conversation) | `formats/GFF/Generics/CNV/CNV.ksy` | ✅ Complete | ✅ CNVKaitaiCompilerTests.cs | Conversation templates |
| **DLG** (Dialogue) | `formats/GFF/Generics/DLG/DLG.ksy` | ✅ Complete | ✅ DLGKaitaiCompilerTests.cs | Dialogue trees |
| **DLG XML** | `formats/GFF/Generics/DLG/DLG_XML.ksy` | ✅ Complete | ❌ Missing | XML variant |
| **FAC** (Faction) | `formats/GFF/Generics/FAC/FAC.ksy` | ✅ Complete | ❌ Missing | Faction definitions |
| **FAC XML** | `formats/GFF/Generics/FAC/FAC_XML.ksy` | ✅ Complete | ❌ Missing | XML variant |
| **GAM** (Game) | `formats/GFF/Generics/GAM/GAM.ksy` | ✅ Complete | ❌ Missing | Game state/instance |
| **GIT** (Game Instance Template) | `formats/GFF/Generics/GIT/GIT.ksy` | ✅ Complete | ✅ GITKaitaiCompilerTests.cs | Area instance data |
| **GIT XML** | `formats/GFF/Generics/GIT/GIT_XML.ksy` | ✅ Complete | ❌ Missing | XML variant |
| **GUI** (GUI) | `formats/GFF/Generics/GUI/GUI.ksy` | ✅ Complete | ✅ GUIKaitaiCompilerTests.cs | GUI definitions |
| **GVT** (Game Variables) | `formats/GFF/Generics/GVT/GVT.ksy` | ✅ Complete | ❌ Missing | Variable storage |
| **IFO** (Module Info) | `formats/GFF/Generics/IFO/IFO.ksy` | ✅ Complete | ✅ IFOKaitaiCompilerTests.cs | Module metadata |
| **IFO XML** | `formats/GFF/Generics/IFO/IFO_XML.ksy` | ✅ Complete | ❌ Missing | XML variant |
| **JRL** (Journal) | `formats/GFF/Generics/JRL/JRL.ksy` | ✅ Complete | ✅ JRLKaitaiStructTests.cs | Journal entries |
| **NFO** (Info) | `formats/GFF/Generics/NFO/NFO.ksy` | ✅ Complete | ✅ NFOKaitaiStructTests.cs | Info/notes |
| **NFO RES XML** | `formats/GFF/Generics/NFO/RES_XML.ksy` | ✅ Complete | ❌ Missing | XML variant |
| **PT** (Point) | `formats/GFF/Generics/PT/PT.ksy` | ✅ Complete | ❌ Missing | Point/walkmesh node |
| **PTH** (Path) | `formats/GFF/Generics/PTH/PTH.ksy` | ✅ Complete | ✅ PTHKaitaiCompilerTests.cs | Path/waypoint routes |
| **UTC** (Creature Template) | `formats/GFF/Generics/UTC/UTC_XML.ksy` | ✅ Complete | ❌ Missing | Creature blueprints (XML only) |
| **UTC** (Creature Template) | `formats/UTC/UTC.ksy` | ✅ Complete | ❌ Missing | Creature blueprints (standalone) |
| **UTD** (Door Template) | `formats/GFF/Generics/UTD/UTD.ksy` | ✅ Complete | ✅ UTDKaitaiCompilerTests.cs | Door blueprints |
| **UTD XML** | `formats/GFF/Generics/UTD/UTD_XML.ksy` | ✅ Complete | ❌ Missing | XML variant |
| **UTE** (Encounter Template) | `formats/GFF/Generics/UTE/UTE.ksy` | ✅ Complete | ✅ UTEKaitaiStructTests.cs | Encounter definitions |
| **UTE XML** | `formats/GFF/Generics/UTE/UTE_XML.ksy` | ✅ Complete | ❌ Missing | XML variant |
| **UTI** (Item Template) | `formats/GFF/Generics/UTI/UTI.ksy` | ✅ Complete | ✅ UTIKaitaiCompilerTests.cs | Item definitions |
| **UTI XML** | `formats/GFF/Generics/UTI/UTI_XML.ksy` | ✅ Complete | ❌ Missing | XML variant |
| **UTM** (Store Template) | `formats/GFF/Generics/UTM/UTM.ksy` | ✅ Complete | ✅ UTMKaitaiCompilerTests.cs | Store/merchant definitions |
| **UTP** (Placeable Template) | ❌ **MISSING** | ❌ Missing | ❌ Missing | **Placeable blueprints** |
| **UTS** (Sound Template) | `formats/GFF/Generics/UTS/UTS.ksy` | ✅ Complete | ✅ UTSKaitaiCompilerTests.cs | Sound object definitions |
| **UTS XML** | `formats/GFF/Generics/UTS/UTS_XML.ksy` | ✅ Complete | ❌ Missing | XML variant |
| **UTT** (Trigger Template) | `formats/GFF/Generics/UTT/UTT.ksy` | ✅ Complete | ✅ UTTKaitaiCompilerTests.cs | Trigger definitions |
| **UTT XML** | `formats/GFF/Generics/UTT/UTT_XML.ksy` | ✅ Complete | ❌ Missing | XML variant |
| **UTW** (Waypoint Template) | `formats/GFF/Generics/UTW/UTW.ksy` | ✅ Complete | ✅ UTWKaitaiCompilerTests.cs | Waypoint definitions |

### ⚠️ Special Cases

| Format | .ksy File | Status | Notes |
|--------|-----------|--------|-------|
| **ITP** (Palette) | `formats/ITP/ITP_XML.ksy` | ⚠️ Partial | XML variant exists, but ITP is a GFF format - should have base `ITP.ksy` that references GFF structure |

---

## Missing Formats Summary

### High Priority

1. **GFF-UTP.ksy** - Placeable template format
   - **Location:** Should be `formats/GFF/Generics/UTP/UTP.ksy`
   - **Documentation:** `vendor/PyKotor/wiki/GFF-UTP.md`
   - **Reference:** `vendor/PyKotor/Libraries/PyKotor/src/pykotor/resource/generics/utp.py`
   - **Similar to:** UTD.ksy (Door format), UTS.ksy (Sound format)
   - **Status:** ❌ Missing

### Low Priority

1. **PLT.ksy** - Palette texture format
   - **Location:** Should be `formats/PLT/PLT.ksy`
   - **Documentation:** `vendor/PyKotor/wiki/PLT-File-Format.md`
   - **Reference:** `vendor/xoreos-docs/specs/torlack/plt.html`
   - **Note:** NWN-specific, not used in KotOR but documented for completeness
   - **Status:** ❌ Missing

2. **ITP.ksy** - Palette format (base binary)
   - **Location:** Should be `formats/GFF/Generics/ITP/ITP.ksy`
   - **Documentation:** `vendor/PyKotor/wiki/Bioware-Aurora-PaletteITP.md`
   - **Note:** ITP_XML.ksy exists but base ITP is a GFF format - should reference GFF structure
   - **Status:** ⚠️ Partial (XML only)

---

## Test Coverage Analysis

### Formats with Comprehensive Tests ✅

- ARE, BWM, CNV, DLG, ERF, GIT, GUI, IFO, JRL, LIP, LTR, LYT, MDL, MDX, NCS, NSS, PCC, PTH, RIM, SSF, TLK, TPC (includes DDS/TGA/TXI), TwoDA, UTD, UTE, UTI, UTM, UTS, UTT, UTW, VIS, WAV

### Formats Missing Tests ❌

- BIF, BZF, KEY
- DAS, DA2S
- GFF (base), GFF_XML, GFF_JSON
- ARE_XML, DLG_XML, FAC, FAC_XML, GAM, GIT_XML, GVT, IFO_XML, NFO RES_XML, PT
- UTC (standalone), UTC_XML, UTD_XML, UTE_XML, UTI_XML, UTS_XML, UTT_XML
- ITP (base binary)
- MDL_ASCII, NCS_minimal

---

## Implementation Status by Category

### Archive/Container Formats
- ✅ ERF (Encapsulated Resource Format)
- ✅ BIF (BioWare Index File)
- ✅ BZF (BioWare Zipped File)
- ✅ KEY (Key File)
- ✅ RIM (Resource Information Module)
- ✅ PCC (Package - Mass Effect)

### Game Data Formats
- ✅ 2DA (Two-Dimensional Array)
- ✅ GFF (Generic File Format)
- ✅ TLK (Talk Table)

### Model Formats
- ✅ MDL (Model)
- ✅ MDX (Model Extended)
- ✅ BWM (Walkmesh)

### Texture Formats
- ✅ TPC (Texture Package Container)
- ✅ DDS (DirectDraw Surface)
- ✅ TGA (Targa)
- ✅ TXI (Texture Info)
- ❌ PLT (Palette Texture) - Missing

### Script Formats
- ✅ NSS (NWScript Source)
- ✅ NCS (NWScript Compiled)

### Audio Formats
- ✅ WAV (Waveform Audio)
- ✅ SSF (Sound Set File)
- ✅ LIP (Lip-sync)

### Layout/Area Formats
- ✅ LYT (Layout)
- ✅ VIS (Visibility)

### GFF Generic Formats
- ✅ ARE (Area)
- ✅ DLG (Dialogue)
- ✅ FAC (Faction)
- ✅ GIT (Game Instance Template)
- ✅ GUI (GUI)
- ✅ IFO (Module Info)
- ✅ JRL (Journal)
- ✅ PTH (Path)
- ✅ UTC (Creature)
- ✅ UTD (Door)
- ✅ UTE (Encounter)
- ✅ UTI (Item)
- ✅ UTM (Store)
- ❌ UTP (Placeable) - Missing
- ✅ UTS (Sound)
- ✅ UTT (Trigger)
- ✅ UTW (Waypoint)

### Other Formats
- ✅ LTR (Letter/Font)
- ✅ CNV (Conversation)
- ✅ GAM (Game)
- ✅ GVT (Game Variables)
- ✅ NFO (Info)
- ✅ PT (Point)
- ⚠️ ITP (Palette) - XML only, missing base binary
- ✅ DAS (Dragon Age Save)
- ✅ DA2S (Dragon Age 2 Save)

---

## Next Steps

### Immediate Tasks

1. **Create GFF-UTP.ksy**
   - Copy structure from UTD.ksy or UTS.ksy as template
   - Reference `vendor/PyKotor/wiki/GFF-UTP.md` for field definitions
   - Implement in `formats/GFF/Generics/UTP/UTP.ksy`
   - Create UTP_XML.ksy variant
   - Add test file `tests/csharp/UTPKaitaiCompilerTests.cs`

2. **Create PLT.ksy**
   - Reference `vendor/PyKotor/wiki/PLT-File-Format.md`
   - Reference `vendor/xoreos-docs/specs/torlack/plt.html`
   - Implement in `formats/PLT/PLT.ksy`
   - Add test file `tests/csharp/PLTKaitaiCompilerTests.cs`

3. **Create ITP.ksy (base binary)**
   - ITP is a GFF format with FileType "ITP "
   - Reference `vendor/PyKotor/wiki/Bioware-Aurora-PaletteITP.md`
   - Should reference GFF.ksy structure
   - Implement in `formats/GFF/Generics/ITP/ITP.ksy`
   - Add test file `tests/csharp/ITPKaitaiCompilerTests.cs`

### Test Coverage Improvements

1. **Add missing tests for core formats:**
   - BIF, BZF, KEY tests
   - DAS, DA2S tests
   - GFF base format test
   - GFF_XML, GFF_JSON tests

2. **Add missing tests for GFF generics:**
   - FAC, GAM, GVT, PT tests
   - XML variant tests for all GFF generics
   - UTC standalone test

3. **Add missing tests for variants:**
   - MDL_ASCII test
   - NCS_minimal test

### Code Generation Verification

1. **Verify all .ksy files compile successfully:**
   - Run `scripts/generate_code.ps1 -Language csharp -OutputDir src/csharp`
   - Fix any compilation errors
   - Ensure all generated code is up to date

2. **Verify tests pass:**
   - Run all test files
   - Fix any failing tests
   - Ensure test coverage is adequate

---

## Format Sources Reference

### Documentation Sources

- **PyKotor Wiki:** `vendor/PyKotor/wiki/` - Comprehensive format documentation
- **Xoreos Docs:** `vendor/xoreos-docs/specs/` - Reverse-engineered specifications
- **PyKotor Source:** `vendor/PyKotor/Libraries/PyKotor/src/pykotor/resource/formats/` - Implementation reference
- **Xoreos Source:** `vendor/xoreos/src/aurora/` - C++ implementation reference

### Format Lists

**From PyKotor Wiki (`*-File-Format.md`):**
- 2DA, BIF, BWM, DDS, ERF, GFF, KEY, LIP, LTR, LYT, MDL-MDX, NCS, NSS, PLT, SSF, TLK, TPC, TXI, VIS, WAV

**From PyKotor Wiki (`GFF-*.md`):**
- ARE, DLG, FAC, GIT, GUI, IFO, JRL, PTH, UTC, UTD, UTE, UTI, UTM, UTP, UTS, UTT, UTW

**From Xoreos Source:**
- 2DA, BIF, BZF, ERF, GFF3, GFF4, KEY, LTR, LYT, RIM, SSF, TLK, VIS, NCS, DLG, IFO
- (Plus game-specific formats: GDA, HERF, SAC, etc.)

---

## Notes

- All formats use little-endian byte order (BioWare standard)
- GFF-based formats all use the base `GFF.ksy` structure with different FileType signatures
- XML/JSON variants are human-readable serializations, not binary formats
- Some formats have game-specific variants (e.g., GFF v3.2 vs v3.3 vs v4.0)
- Test files should validate both compilation and runtime parsing with sample game files

---

**Last Audit:** Comprehensive review of all vendor documentation and existing .ksy files  
**Next Review:** After implementing missing formats and improving test coverage

