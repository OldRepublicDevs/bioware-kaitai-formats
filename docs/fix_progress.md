# GFF Format Fix Progress

**Date:** 2025-01-27

## Fixed Formats (Compile Successfully)

1. ✅ **GFF.ksy** - Base GFF format (already correct)
2. ✅ **ARE.ksy** - Already uses instances: correctly
3. ✅ **UTD.ksy** - Fixed pos: and enum syntax
4. ✅ **CNV.ksy** - Fixed pos: syntax
5. ✅ **DLG.ksy** - Fixed pos: and valid expression syntax

## Still Need Fixing

### High Priority (pos: in seq: needs moving to instances:)
- FAC.ksy
- GIT.ksy  
- GUI.ksy
- GVT.ksy
- IFO.ksy
- NFO.ksy
- PT.ksy
- PTH.ksy
- UTE.ksy
- UTP.ksy
- UTS.ksy

### Need Verification (may already be fixed)
- UTC.ksy
- UTI.ksy
- UTM.ksy
- UTT.ksy
- UTW.ksy
- GAM.ksy
- JRL.ksy

## Fix Pattern

All GFF generic formats need:

1. **Move pos: fields from seq: to instances:**
```yaml
# BEFORE (WRONG)
seq:
  - id: gff_header
    type: gff_header
  - id: label_array
    type: label_array
    pos: gff_header.label_array_offset

# AFTER (CORRECT)
seq:
  - id: gff_header
    type: gff_header

instances:
  label_array:
    type: label_array
    pos: gff_header.label_array_offset
```

2. **Fix field_data type name:**
   - Change `field_data_section` to `field_data` in instances:
   - If `field_data_section` type exists, change `type: str` to just `size:` (raw data)

3. **Fix enum syntax in instances:**
   - Change `field_type.value == X` to `field_type == gff_field_type::x`
   - Change `&&` to `and`, `||` to `or`
   - Use multi-line `value: |` for complex expressions

4. **Fix valid expression syntax:**
   - Change list format to object: `valid: {any-of: ["V3.2", "V3.3", "V4.0", "V4.1"]}`

