# Remaining Fixes Summary

**Date:** 2025-01-27  
**Status:** After partial fixes applied

## Progress Made

### ✅ Fixed Successfully
- GIT: pos: syntax (moved to instances:)
- GVT: rstrip() removed, name_trimmed references fixed
- IFO: field_data_section encoding fixed (str → u1 array)
- UTP: field_data_section encoding fixed (str → u1 array)
- UTC: field_data encoding fixed (str → u1 array)
- NFO: valid syntax for file_type fixed

### ❌ Still Need Fixes

#### pos: Syntax (Still in seq: blocks)
These files still have pos: in seq: blocks and need to be moved to instances::
- **UTS**: Lines 59-91 still have pos: in seq:
- **GVT**: May still have pos: in seq: (needs verification after recent fixes)
- **IFO**: May still have pos: in seq: (needs verification)
- **UTP**: May still have pos: in seq: (needs verification)
- **NFO**: May still have pos: in seq: (needs verification)
- **PT**: May still have pos: in seq: (needs verification)
- **UTC**: May still have pos: in seq: (needs verification)

**Pattern to apply:**
```yaml
# BEFORE:
seq:
  - id: gff_header
    type: gff_header
  - id: label_array
    type: label_array
    pos: gff_header.label_array_offset

# AFTER:
seq:
  - id: gff_header
    type: gff_header

instances:
  label_array:
    type: label_array
    pos: gff_header.label_array_offset
```

#### Enum Operators
- **UTM**: Lines 277-280 still have &&/|| operators
- **UTT**: Lines 359-362 still have &&/|| operators

**Pattern:**
```yaml
# BEFORE:
value: field_type >= 0 && field_type <= 5 || field_type == 8

# AFTER:
value: |
  field_type == gff_field_type::uint8 or
  field_type == gff_field_type::int8 or
  field_type == gff_field_type::uint16 or
  field_type == gff_field_type::int16 or
  field_type == gff_field_type::uint32 or
  field_type == gff_field_type::int32 or
  field_type == gff_field_type::single
```

#### GUI YAML Syntax
- **GUI**: Line 280-283 has malformed doc comment

**Fix:**
```yaml
# BEFORE:
  gui_root:
      Root GUI struct. Contains:
      - Tag (string): GUI identifier/tag name
    seq:

# AFTER:
  gui_root:
    doc: |
      Root GUI struct. Contains:
      - Tag (string): GUI identifier/tag name
    seq:
```

#### ID Format Errors (Mysterious)
These formats have lowercase meta.id but compiler reports uppercase:
- DLG
- FAC
- PTH
- UTD
- UTE

**Investigation needed:** This appears to be a compiler bug or version issue. All files have correct lowercase `meta.id` fields.

## Next Steps

1. **Fix UTS pos: syntax** - Move pos: fields to instances:
2. **Fix enum operators in UTM and UTT** - Replace &&/|| with and/or, use enum syntax
3. **Fix GUI YAML syntax** - Fix doc comment format
4. **Re-test all formats** after fixes
5. **Investigate ID format errors** - May need compiler update or file structure change
6. **Generate code** for all compiling formats
7. **Add missing tests**

