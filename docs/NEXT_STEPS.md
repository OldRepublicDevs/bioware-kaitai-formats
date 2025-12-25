# Next Steps - Comprehensive Audit Follow-Up

**Date:** 2025-01-27  
**Status:** Audit complete, fixes in progress

## Completed Work

✅ **Format Discovery:** All 49 unique formats identified and documented  
✅ **Documentation:** 8 comprehensive documents created  
✅ **Compilation Fixes:** RIM, PCC (partial), FAC (partial)  
✅ **Roadmap:** `docs/progress_roadmap.md` comprehensively updated

## Immediate Priority Fixes

### 1. Fix PCC Compilation Error
**Issue:** `size: (length < 0 ? -length : length) * 2` causes "mapping values are not allowed here"  
**Location:** `formats/PCC/PCC.ksy` line 219  
**Solution:** Kaitai Struct may not support ternary expressions in `size:` fields. Use an instance to calculate the size, then reference it, OR use a different approach (e.g., `size-eos` or calculate size differently).

**Recommended Fix:**
- Calculate size using an instance: `name_size: (length < 0 ? -length : length) * 2`
- Use `size: name_size` (but this won't work as instances can't be used in seq)
- Alternative: Read as raw bytes and parse separately, or use a different structure

**Status:** Needs investigation - ternary expressions in size: may not be supported

### 2. Fix FAC name_trimmed Error
**Issue:** `name_trimmed: name.rstrip('\x00')` causes "don't know how to call method 'rstrip'"  
**Location:** `formats/GFF/Generics/FAC/FAC.ksy` line 174  
**Solution:** Kaitai Struct 0.11 doesn't support Python-style string methods like `.rstrip()` in all backends. Remove the `name_trimmed` instance or handle trimming in application code.

**Recommended Fix:**
- Remove `name_trimmed` instance (as done in UTD)
- Add comment noting that null trimming should be done in application code
- Update any references to use `name` directly

**Status:** Can be fixed by removing the instance (pattern already established in UTD)

### 3. Fix pos: Syntax in GFF Formats
**Issue:** Multiple GFF formats have `pos:` fields in `seq:` blocks, which is not supported in Kaitai Struct 0.11  
**Location:** Multiple files in `formats/GFF/Generics/`  
**Formats needing fix:**
- PTH (`formats/GFF/Generics/PTH/PTH.ksy`)
- UTE (`formats/GFF/Generics/UTE/UTE.ksy`)
- UTS (`formats/GFF/Generics/UTS/UTS.ksy`)
- GIT (`formats/GFF/Generics/GIT/GIT.ksy`)
- Potentially others (needs systematic check)

**Solution:** Move all `pos:` fields from `seq:` to `instances:` block (pattern already established in ARE, DLG, FAC)

**Example Fix Pattern:**
```yaml
# BEFORE (WRONG):
seq:
  - id: label_array
    type: label_array
    pos: gff_header.label_array_offset

# AFTER (CORRECT):
seq:
  - id: gff_header
    type: gff_header

instances:
  label_array:
    type: label_array
    pos: gff_header.label_array_offset
```

**Status:** Pattern established, needs systematic application

### 4. Fix Valid Syntax in DLG and UTD
**Issue:** Unquoted version strings in `valid: any-of` cause parsing errors  
**Location:**
- `formats/GFF/Generics/DLG/DLG.ksy`
- `formats/GFF/Generics/UTD/UTD.ksy`

**Solution:** Change from unquoted list to object notation:
```yaml
# BEFORE (WRONG):
valid:
  any-of:
    - V3.2
    - V3.3

# AFTER (CORRECT):
valid:
  any-of: ["'V3.2'", "'V3.3'"]
```

**Status:** Simple fix, needs application

## High Priority Tasks

### 5. Create ITP.ksy Base Binary Format
**Location:** `formats/GFF/Generics/ITP/ITP.ksy`  
**Template:** Use `formats/GFF/Generics/UTD/UTD.ksy` as base  
**Documentation:** `vendor/PyKotor/wiki/Bioware-Aurora-PaletteITP.md`  
**FileType:** "ITP "  
**Status:** Directory exists, XML variant exists, base binary missing

### 6. Systematic Compilation Testing
**Task:** Test all GFF generic formats for compilation errors  
**Script:** `scripts/test_all_gff_compilation.ps1` (needs PowerShell syntax fix for emoji handling)  
**Process:**
1. Test each format individually
2. Document all compilation errors
3. Fix errors systematically
4. Re-test after fixes

### 7. Standardize Valid Syntax
**Task:** Ensure all GFF formats use consistent `valid:` syntax  
**Pattern:** Use object notation: `valid: { any-of: ["'V3.2'", "'V3.3'"] }`  
**Scope:** All 22 GFF generic formats

## Medium Priority Tasks

### 8. Regenerate Generated Code
**Task:** Regenerate C# code for all successfully compiling formats  
**Script:** `scripts/generate_code.ps1`  
**Prerequisites:** All compilation errors fixed

### 9. Expand Test Coverage
**Current:** 33/49 formats have tests (67%)  
**Missing Tests:**
- Core formats: BIF, BZF, KEY, DAS, DA2S
- Embedded formats: DDS, TGA, TXI (may be tested via TPC)
- GFF generics: FAC, GAM, GVT, PT, UTP, ITP

### 10. Address Naming Convention Warnings
**Formats:** BIF, ERF, RIM  
**Warning:** Use `len_data` or `num_data` instead of `file_size`/`resource_size`  
**Priority:** Low (warnings only, don't prevent compilation)

## Low Priority Tasks

### 11. Create Missing Game-Specific Formats
**Formats:** GDA (Dragon Age), HERF (Heretic), ZIP (standard)  
**Note:** These are not used in KotOR, only needed if supporting other games

### 12. Improve Documentation
- Add more inline documentation to .ksy files
- Expand format descriptions
- Add usage examples

## Recommended Workflow

1. **Quick Wins (15-30 minutes):**
   - Fix FAC `name_trimmed` (remove instance)
   - Fix DLG and UTD `valid:` syntax
   - Fix pos: syntax in PTH, UTE, UTS, GIT

2. **Investigation (30-60 minutes):**
   - Research PCC `size:` expression syntax
   - Test alternatives for PCC name size calculation

3. **Systematic Fixes (2-4 hours):**
   - Fix all remaining pos: syntax issues
   - Standardize all valid: syntax
   - Test all GFF formats systematically

4. **Implementation (1-2 hours):**
   - Create ITP.ksy base binary format
   - Test ITP compilation

5. **Code Generation (30 minutes):**
   - Regenerate all code after fixes
   - Verify generated code structure

6. **Testing (2-4 hours):**
   - Add missing tests
   - Run all tests
   - Fix any runtime issues

## Estimated Time to Completion

- **Immediate fixes:** 1-2 hours
- **Systematic fixes:** 2-4 hours  
- **Implementation:** 1-2 hours
- **Code generation:** 30 minutes
- **Testing:** 2-4 hours

**Total:** 6-12 hours of focused work

---

**Note:** This document should be updated as fixes are completed and new issues are discovered.

