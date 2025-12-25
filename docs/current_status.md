# Current Status - Comprehensive Audit

**Date:** 2025-01-27  
**Last Updated:** After systematic compilation testing and partial fixes

## Summary

Systematic compilation testing revealed that many GFF formats have compilation errors. Several patterns have been identified and some fixes applied, but many files still need fixes.

## Compilation Status

### ✅ Formats Compiling Successfully (6 GFF formats)
- ARE
- CNV  
- GAM
- JRL
- UTI
- UTW

### ❌ Formats With Errors (16 GFF formats)

#### ID Format Errors (5 formats)
- **DLG**: `error: invalid ID: 'DLG', expected /^[a-z][a-z0-9_]*$/`
- **FAC**: `error: invalid ID: 'FAC', expected /^[a-z][a-z0-9_]*$/`
- **PTH**: `error: invalid ID: 'PTH', expected /^[a-z][a-z0-9_]*$/`
- **UTD**: `error: invalid ID: 'UTD', expected /^[a-z][a-z0-9_]*$/`
- **UTE**: `error: invalid ID: 'UTE', expected /^[a-z][a-z0-9_]*$/`

**Status:** All affected files have lowercase `meta.id` fields. This appears to be a Kaitai Struct compiler bug or version compatibility issue. May need investigation into compiler version or file structure.

#### pos: Syntax Errors (7 formats)
These formats have `pos:` fields in `seq:` blocks, which is not supported in Kaitai Struct 0.11. Need to move to `instances:` blocks.

- **GVT**: `error: unknown key found, expected: ... (seq/1/pos)`
- **IFO**: `error: unknown key found, expected: ... (seq/1/pos)`
- **NFO**: `error: unknown key found, expected: ... (seq/1/pos)`
- **PT**: `error: unknown key found, expected: ... (seq/1/pos)`
- **UTC**: `error: unknown key found, expected: ... (seq/1/pos)` (uses `header` instead of `gff_header`)
- **UTP**: Also has `field_data_section` encoding error
- **UTS**: `error: unknown key found, expected: ... (seq/1/pos)`

**Fix Pattern:** Move all `pos:` fields from `seq:` to `instances:` block after `gff_header`.

#### Enum Operator Errors (2 formats)
These formats use `&&` and `||` instead of `and` and `or`, and use numeric comparisons instead of enum syntax.

- **UTM**: `error: parsing expression 'field_type >= 0 && field_type <= 5 || field_type == 8' failed, did you mean 'and'?`
- **UTT**: `error: parsing expression '(field_type >= 0 && field_type <= 5) || field_type == 8' failed`

**Fix Pattern:** Replace `&&` with `and`, `||` with `or`, and use enum syntax: `field_type == gff_field_type::uint8 or ...`

#### Other Errors

1. **GIT**: `error: unknown key found (seq/1/pos)` - User reverted pos: fix but it still fails
2. **GUI**: `error: expected <block end>, but found '<block mapping start>' (line 284)` - YAML syntax error in doc comment
3. **GVT**: Also has `name_trimmed` rstrip() error
4. **IFO**: Also has `field_data_section` encoding error (`type: str` needs to be `type: u1` with `repeat: expr`)
5. **UTP**: Also has `field_data_section` encoding error (`type: str` needs to be `type: u1` with `repeat: expr`)

## Fix Patterns Identified

### Pattern 1: Move pos: from seq: to instances:

**WRONG:**
```yaml
seq:
  - id: gff_header
    type: gff_header
  - id: label_array
    type: label_array
    pos: gff_header.label_array_offset
```

**CORRECT:**
```yaml
seq:
  - id: gff_header
    type: gff_header

instances:
  label_array:
    type: label_array
    pos: gff_header.label_array_offset
```

### Pattern 2: Fix Enum Operators

**WRONG:**
```yaml
value: field_type >= 0 && field_type <= 5 || field_type == 8
```

**CORRECT:**
```yaml
value: |
  field_type == gff_field_type::uint8 or
  field_type == gff_field_type::int8 or
  field_type == gff_field_type::uint16 or
  field_type == gff_field_type::int16 or
  field_type == gff_field_type::uint32 or
  field_type == gff_field_type::int32 or
  field_type == gff_field_type::single
```

### Pattern 3: Fix field_data_section Encoding

**WRONG:**
```yaml
field_data_section:
  seq:
    - id: data
      type: str
      size: _root.gff_header.field_data_count
```

**CORRECT:**
```yaml
field_data_section:
  seq:
    - id: data
      type: u1
      repeat: expr
      repeat-expr: _root.gff_header.field_data_count
```

### Pattern 4: Remove rstrip() Instances

**WRONG:**
```yaml
instances:
  name_trimmed:
    value: name.rstrip('\x00')
```

**CORRECT:**
```yaml
# TODO: Kaitai Struct 0.11 doesn't support Python-style .rstrip() in all backends
# Application code should trim trailing nulls when needed
```

### Pattern 5: Fix YAML Syntax Errors

**WRONG:**
```yaml
  gui_root:
      Root GUI struct. Contains:
      - Tag (string): GUI identifier/tag name
    seq:
```

**CORRECT:**
```yaml
  gui_root:
    doc: |
      Root GUI struct. Contains:
      - Tag (string): GUI identifier/tag name
    seq:
```

## Files That Need Fixes

1. **GVT.ksy**: Move pos: to instances:, remove name_trimmed rstrip
2. **IFO.ksy**: Move pos: to instances:, fix field_data_section encoding
3. **NFO.ksy**: Move pos: to instances:
4. **PT.ksy**: Move pos: to instances:
5. **UTC.ksy**: Move pos: to instances: (uses `header` not `gff_header`)
6. **UTP.ksy**: Move pos: to instances:, fix field_data_section encoding
7. **UTS.ksy**: Move pos: to instances:
8. **UTM.ksy**: Fix enum operators
9. **UTT.ksy**: Fix enum operators
10. **GUI.ksy**: Fix YAML syntax error (line 284)
11. **GIT.ksy**: Fix pos: syntax (user preference may need different approach)

## ID Format Error Investigation

All affected formats (DLG, FAC, PTH, UTD, UTE) have lowercase `meta.id` fields but compiler reports uppercase. Possible causes:
1. Kaitai Struct compiler bug
2. Version compatibility issue
3. File structure or include issue
4. Cache or build artifact issue

**Investigation needed:** Test with different compiler versions, check for file structure issues, verify meta.id is actually lowercase in YAML.

## Next Steps

1. **Systematically fix pos: syntax** - Apply Pattern 1 to all 7 affected formats
2. **Fix enum operators** - Apply Pattern 2 to UTM and UTT
3. **Fix field_data_section encoding** - Apply Pattern 3 to IFO and UTP
4. **Fix GUI YAML syntax** - Apply Pattern 5
5. **Remove rstrip() instances** - Apply Pattern 4 to GVT
6. **Investigate ID format errors** - May need compiler version update or file structure changes
7. **Re-test all formats** after fixes

## Estimated Time to Complete

- pos: fixes: ~30 minutes (7 files)
- enum operator fixes: ~15 minutes (2 files)
- field_data_section fixes: ~10 minutes (2 files)
- GUI fix: ~5 minutes (1 file)
- rstrip removal: ~5 minutes (1 file)
- ID error investigation: ~30-60 minutes (unknown issue)

**Total:** ~2-3 hours of focused work

---

**Note:** This is a comprehensive status document. Individual fix patterns are documented in `docs/systematic_fixes_needed.md`.

