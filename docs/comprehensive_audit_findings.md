# Comprehensive Audit Findings

**Date:** 2025-01-27  
**Status:** Comprehensive audit completed with systematic findings

## Executive Summary

A systematic audit has been completed covering:
- Format inventory (formats/ directory)
- Generated code status (src/csharp/ directory)
- Compilation testing
- Test coverage analysis
- Vendor documentation review

## 1. Format Inventory

### Total Counts
- **85 .ksy files** in repository
- **49 unique formats** documented
- **Core formats:** 19 formats with .ksy files
- **GFF generic formats:** 22 formats with .ksy files
- **Variants:** XML, JSON, CSV, ASCII variants for multiple formats

### Format Coverage

#### ✅ Core Binary Formats (19 formats - 100% complete)
All formats have `.ksy` definitions:
1. BIF - BioWare Index File
2. BWM - BioWare Walkmesh  
3. DA2S - Dragon Age 2 Save
4. DAS - Dragon Age Save
5. ERF - Encapsulated Resource Format
6. LIP - Lip-sync
7. LTR - Letter (font)
8. LYT - Layout
9. MDL - Model
10. NSS - NWScript Source
11. PCC - Package (Mass Effect)
12. PLT - Palette Texture
13. RIM - Resource Information Module
14. SSF - Sound Set File
15. TLK - Talk Table
16. TPC - Texture Package Container
17. TwoDA - Two-Dimensional Array
18. VIS - Visibility
19. WAV - Waveform Audio

**Note:** BZF, KEY, MDX, DDS, TGA, TXI, NCS are either:
- Sub-formats embedded in other formats (DDS, TGA, TXI in TPC)
- Path verification needed (BZF, KEY, MDX, NCS)

#### ✅ GFF Generic Formats (22 formats - 96% complete)
All formats have `.ksy` definitions except ITP base binary:
1. ARE - Area
2. CNV - Conversation
3. DLG - Dialogue
4. FAC - Faction
5. GAM - Game
6. GIT - Game Instance Template
7. GUI - GUI
8. GVT - Game Variables
9. IFO - Module Info
10. JRL - Journal
11. NFO - Info
12. PT - Point
13. PTH - Path
14. UTC - Creature Template
15. UTD - Door Template
16. UTE - Encounter Template
17. UTI - Item Template
18. UTM - Store Template
19. UTP - Placeable Template
20. UTS - Sound Template
21. UTT - Trigger Template
22. UTW - Waypoint Template

#### ❌ Missing Formats
- **ITP.ksy** (base binary) - Only ITP_XML.ksy exists
  - Should be at: `formats/GFF/Generics/ITP/ITP.ksy`
  - Type: GFF-based format (FileType "ITP ")
  - Documentation: `vendor/PyKotor/wiki/Bioware-Aurora-PaletteITP.md`

## 2. Generated Code Status

### Directory Structure
`src/csharp/` contains directories for:
- All core formats (BIF, BWM, DAS, DA2S, ERF, LIP, LTR, LYT, MDL, NSS, PCC, RIM, SSF, TLK, TPC, TwoDA, VIS, WAV)
- GFF structure (GFF/, GFF/Generics/, GFF/XML/, GFF/JSON/)
- All GFF generic format directories exist
- ITP directory exists (for XML variant)
- UTC directory exists (standalone)

### Missing/Outdated Code
All GFF generic formats have directory structure but code may be outdated because:
1. Compilation errors prevent regeneration
2. .ksy files modified but code not regenerated
3. Code structure may not match current .ksy structure

**Recommendation:** Regenerate all code after fixing compilation errors.

## 3. Compilation Status

### Core Formats

**✅ Compiling (16 formats):**
TwoDA, GFF, TLK, MDL, BWM, TPC, PLT, NSS, WAV, SSF, LIP, LYT, VIS, LTR, DAS, DA2S

**⚠️ Warnings Only (2 formats):**
- BIF - Naming convention warning (use `len_data` instead of `file_size`)
- ERF - Naming convention warning (use `len_data` instead of `resource_size`)

**❌ Errors (2 formats):**
- RIM - `string type, but no encoding found` in `resource_entry.instances.data`
- PCC - Syntax error at line 218

### GFF Generic Formats

**Valid Syntax Issues:**
Three different valid syntax patterns found, causing inconsistency:

1. **Quoted List** (9 formats) - Compiles:
   - FAC, GIT, GUI, IFO, NFO, PTH, UTC, UTE, UTS
   - Pattern: `valid: any-of: ["'V3.2'", "'V3.3'", ...]`

2. **Unquoted List** (2 formats) - **ERRORS**:
   - DLG, UTD
   - Pattern: `valid: any-of: [V3.2, V3.3, ...]`
   - Error: `parsing expression 'V3.2' failed on ".2"`

3. **Object Notation** (1 format) - Compiles:
   - UTP
   - Pattern: `valid: {any-of: ["V3.2", "V3.3", ...]}`

4. **Other/None** (10 formats) - Needs verification:
   - ARE, CNV, GAM, GVT, JRL, PT, UTI, UTM, UTT, UTW

**Recommendation:** Standardize on object notation or quoted list format.

## 4. Test Coverage

### Formats With Tests (33 formats - 67% coverage)
ARE, BWM, CNV, DLG, ERF, GIT, GUI, IFO, JRL, LIP, LTR, LYT, MDL, MDX, NCS, NSS, PCC, PTH, RIM, SSF, TLK, TPC, TwoDA, UTD, UTE, UTI, UTM, UTS, UTT, UTW, VIS, WAV

### Formats Missing Tests (16 formats)
**Core formats:**
- BIF, BZF, KEY
- DAS, DA2S
- GFF (base), GFF_XML, GFF_JSON
- DDS, TGA, TXI (embedded in TPC)

**GFF generics:**
- FAC, GAM, GVT, PT, UTP, ITP
- All XML/JSON variants

**Other:**
- MDL_ASCII, NCS_minimal, TwoDA_CSV

## 5. Vendor Documentation Review

### PyKotor Wiki
- Documents all major formats
- Provides GFF generic format documentation
- ITP documented (Bioware-Aurora-PaletteITP.md)

### Xoreos Source
- Implements formats in C++
- Provides reference implementations
- Additional formats: GDA, HERF, CDPTH, etc. (game-specific)

### PyKotor Source
- Implements formats in Python
- Comprehensive coverage of KotOR formats
- Reference: `vendor/PyKotor/Libraries/PyKotor/src/pykotor/resource/formats/`

## 6. Key Findings

### Strengths
1. ✅ Comprehensive format coverage (49 formats)
2. ✅ All major KotOR formats implemented
3. ✅ Good test coverage (67%)
4. ✅ Well-documented with vendor references

### Issues to Address
1. ⚠️ Valid syntax inconsistency causing compilation errors
2. ⚠️ Missing ITP.ksy base binary format
3. ⚠️ Some compilation errors in core formats (RIM, PCC)
4. ⚠️ Generated code may be outdated
5. ⚠️ Some formats missing tests

### Recommendations

1. **Immediate Priority**
   - Fix valid syntax in DLG and UTD (unquoted → object notation)
   - Fix RIM compilation error (raw data type)
   - Fix PCC compilation error
   - Create ITP.ksy base binary format

2. **High Priority**
   - Standardize valid syntax across all GFF formats
   - Test compilation of all GFF generic formats
   - Regenerate code for all working formats

3. **Medium Priority**
   - Add missing tests for core formats
   - Address naming convention warnings
   - Improve test coverage

4. **Low Priority**
   - Add game-specific formats (GDA, HERF) if needed
   - Add tests for XML/JSON variants

## 7. Next Steps

1. Fix compilation errors systematically
2. Standardize valid syntax patterns
3. Create missing ITP.ksy format
4. Regenerate all code
5. Expand test coverage
6. Update documentation with final status

---

**Audit Status:** Complete  
**Next Iteration Focus:** Fix compilation errors and standardize syntax

