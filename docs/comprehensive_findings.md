# Comprehensive Format Audit Findings

**Date:** 2025-01-27  
**Status:** Comprehensive audit completed

## Summary

- **Total .ksy files:** 85
- **Formats with .ksy files:** 49 unique formats
- **Formats missing generated code:** UTP, PLT, ITP (base binary)
- **Formats missing from codebase:** GDA, HERF (Dragon Age/Heretic specific, not KotOR)
- **Test files:** 41 test files covering 33 unique formats

## Key Findings

### 1. Missing Formats

#### High Priority (KotOR-related)
1. **ITP.ksy** (base binary)
   - Status: Only ITP_XML.ksy exists
   - Location: Should be `formats/GFF/Generics/ITP/ITP.ksy`
   - Type: GFF-based format (FileType "ITP ")

#### Low Priority (Non-KotOR)
2. **GDA.ksy** (Game Data Archive)
   - Status: Missing
   - Type: Dragon Age-specific format (GFF v4.0 based)
   - Note: Not used in KotOR, may not be needed

3. **HERF.ksy** (Heretic Encapsulated Resource Format)
   - Status: Missing  
   - Type: Heretic-specific ERF variant
   - Note: Not used in KotOR, may not be needed

### 2. Compilation Issues

#### Fixed
- ✅ GFF.ksy: Moved `pos:` fields from `seq:` to `instances:`
- ✅ GFF.ksy: Fixed enum `.value` syntax (use enum directly)

#### Needs Fixing
- ❌ All GFF generic formats: Need to move `pos:` fields from `seq:` to `instances:`
- ❌ PLT.ksy: Invalid ID issue (changed to plt_palette_texture but still has error)
- ❌ UTP.ksy: Needs compilation test after enum fix

### 3. Missing Generated Code

Formats with .ksy files but missing from src/csharp:
- UTP (Placeable) - Has .ksy file, needs compilation fix
- PLT (Palette Texture) - Has .ksy file, needs compilation fix  
- ITP (base binary) - Missing .ksy file

### 4. Missing Tests

**Core Formats:**
- BIF, BZF, KEY
- DAS, DA2S
- GFF (base), GFF_XML, GFF_JSON

**GFF Generics:**
- FAC, GAM, GVT, PT
- All XML variants (ARE_XML, DLG_XML, etc.)
- UTC (standalone)
- ITP (base binary)
- UTP

**Variants:**
- MDL_ASCII
- NCS_minimal

## Format Inventory

### Core Binary Formats (20)
✅ 2DA, BIF, BZF, BWM, DAS, DA2S, DDS, ERF, GFF, KEY, LIP, LTR, LYT, MDL, MDX, NCS, NSS, PCC, RIM, SSF, TLK, TPC, TXI, VIS, WAV

### GFF Generic Formats (22)
✅ ARE, CNV, DLG, FAC, GAM, GIT, GUI, GVT, IFO, JRL, NFO, PT, PTH, UTC, UTD, UTE, UTI, UTM, ✅ UTP (created), UTS, UTT, UTW
⚠️ ITP (XML only, missing base binary)

### Format Variants
- XML variants: Most GFF generics have XML variants
- JSON variants: 2DA, TLK, LIP have JSON variants
- CSV variants: 2DA has CSV variant
- ASCII variants: MDL has ASCII variant
- Minimal variants: NCS has minimal variant

## Vendor Directory Analysis

### PyKotor Wiki Formats
**Core formats:** 2DA, BIF, BWM, DDS, ERF, GFF, KEY, LIP, LTR, LYT, MDL-MDX, NCS, NSS, PLT, SSF, TLK, TPC, TXI, VIS, WAV

**GFF formats:** ARE, DLG, FAC, GIT, GUI, IFO, JRL, PTH, UTC, UTD, UTE, UTI, UTM, UTP, UTS, UTT, UTW

### Xoreos Source Formats
**Aurora formats:** 2DA, BIF, BZF, ERF, GFF3, GFF4, KEY, LTR, LYT, RIM, SSF, TLK, VIS, NCS, DLG, IFO

**Game-specific:** GDA (Dragon Age), HERF (Heretic), SAC (Jade Empire)

### Xoreos Tools Formats
**Archive formats:** ERF, HERF, RIM, BIF, BZF, KEY, GDA, SAC, OBB, ZIP

**Image formats:** TPC, DDS, TGA, TXI, PLT (NWN only), NCGR, NCLR, CBGT, CDPTH, NBFS, SBM, TXB

**Other:** SSF, TLK, 2DA, GFF3, GFF4, TalkTable, NCS, FMOD Event File

## Next Steps

### Immediate Tasks
1. Fix all GFF generic formats to use `instances:` instead of `seq:` for `pos:` fields
2. Fix PLT.ksy compilation error
3. Test UTP.ksy compilation
4. Create ITP.ksy base binary format

### Medium Priority
1. Generate code for UTP, PLT after compilation fixes
2. Add missing tests for core formats
3. Add missing tests for GFF generics

### Low Priority
1. Consider adding GDA/HERF if needed for Dragon Age/Heretic support
2. Add tests for XML/JSON variants
3. Improve test coverage overall

