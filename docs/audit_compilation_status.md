# Format Compilation Status

**Date:** 2025-01-27  
**Status:** Systematic compilation testing in progress

## Core Formats Compilation Status

### ✅ Compiling Successfully (16 formats)
- TwoDA - ✅ OK
- GFF - ✅ OK (warnings only)
- TLK - ✅ OK
- MDL - ✅ OK
- BWM - ✅ OK
- TPC - ✅ OK
- PLT - ✅ OK
- NSS - ✅ OK
- WAV - ✅ OK
- SSF - ✅ OK
- LIP - ✅ OK
- LYT - ✅ OK
- VIS - ✅ OK
- LTR - ✅ OK
- DAS - ✅ OK
- DA2S - ✅ OK

### ⚠️ Compilation Errors/Warnings (4 formats)
- **BIF** - Warning: naming convention (use `len_data` instead of `file_size`)
- **ERF** - Warning: naming convention (use `len_data` instead of `resource_size`)
- **RIM** - Error: `string type, but no encoding found` in `resource_entry.instances.data`
- **PCC** - Error: Syntax error at line 218

### ❓ Not Tested Yet
- BZF - .ksy path needs verification
- KEY - .ksy path needs verification
- MDX - .ksy path needs verification
- DDS - Embedded in TPC
- TGA - Embedded in TPC
- TXI - Embedded in TPC
- NCS - Path needs verification

## GFF Generic Formats Compilation Status

### Valid Syntax Patterns Found

Three different valid syntax patterns are in use:

1. **Quoted List Format** (used by: FAC, GIT, GUI, IFO, NFO, PTH, UTC, UTE, UTS)
   ```yaml
   valid:
     any-of:
       - "'V3.2'"
       - "'V3.3'"
   ```

2. **Unquoted List Format** (used by: DLG, UTD) - **CAUSES ERRORS**
   ```yaml
   valid:
     any-of:
       - V3.2
       - V3.3
   ```
   ⚠️ This format causes: `error: parsing expression 'V3.2' failed on ".2"`

3. **Object Notation** (used by: UTP)
   ```yaml
   valid: {any-of: ["V3.2", "V3.3", "V4.0", "V4.1"]}
   ```

4. **Other/None** (used by: ARE, CNV, GAM, GVT, JRL, PT, UTI, UTM, UTT, UTW)
   - May use single value, different syntax, or no valid clause

### Compilation Test Results

#### ✅ Formats Compiling (or only warnings)
- **GFF** - Base format (warnings only)
- **ARE** - Warnings only (naming conventions)
- **CNV** - Status unknown (needs testing)
- **UTP** - Uses object notation (should compile)

#### ❌ Formats With Errors (unquoted valid syntax)
- **DLG** - Unquoted valid values
- **UTD** - Unquoted valid values (user reverted fix, causes error)

#### ⚠️ Formats Needing Verification
- FAC, GAM, GIT, GUI, GVT, IFO, JRL, NFO, PT, PTH, UTC, UTE, UTI, UTM, UTS, UTT, UTW

## Missing Formats

### High Priority
- **ITP.ksy** (base binary) - Only ITP_XML.ksy exists

### Low Priority
- GDA.ksy - Dragon Age specific
- HERF.ksy - Game-specific variant

## Missing Generated Code

All GFF generic formats have directory structure in `src/csharp/GFF/Generics/` but code may be outdated due to:
1. Compilation errors preventing generation
2. Changes to .ksy files not yet regenerated

Formats needing code regeneration:
- All 22 GFF generic formats
- PLT (if not yet generated)

## Recommended Actions

1. **Fix Valid Syntax Consistency**
   - Standardize on either quoted list or object notation
   - Fix unquoted formats (DLG, UTD) that cause errors

2. **Fix Core Format Errors**
   - RIM: Fix `string type, but no encoding found`
   - PCC: Fix syntax error at line 218
   - BIF, ERF: Address naming warnings (low priority)

3. **Test All GFF Formats**
   - Systematic compilation testing
   - Fix errors as found

4. **Generate Code**
   - Regenerate for all successfully compiling formats
   - Verify generated code structure matches formats/

5. **Create Missing Formats**
   - ITP.ksy base binary format

