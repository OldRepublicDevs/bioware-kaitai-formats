# Systematic Fixes Needed for GFF Formats

**Date:** 2025-01-27  
**Status:** After systematic compilation testing

## Compilation Test Results

### ✅ Formats Compiling (6 formats)
- ARE
- CNV  
- GAM
- JRL
- UTI
- UTW

### ❌ Formats With Errors (16 formats)

#### ID Format Errors (2 formats)
- **DLG**: `error: invalid ID: 'DLG', expected /^[a-z][a-z0-9_]*$/`
- **FAC**: `error: invalid ID: 'FAC', expected /^[a-z][a-z0-9_]*$/`

**Investigation Needed:** The meta.id fields should be lowercase. Check if there's something in the file structure causing this.

#### pos: Syntax Errors (8 formats)
Formats with `pos:` in `seq:` that need to be moved to `instances:`:
- **GVT**: `/seq/1/pos:`
- **IFO**: `/seq/1/pos:`
- **NFO**: `/seq/1/pos:`
- **PT**: `/seq/1/pos:`
- **UTC**: `/seq/1/pos:`
- **UTP**: `/seq/1/pos:`
- **UTS**: `/seq/1/pos:`

**Note:** GIT was reverted by user to use `pos:` in `seq:`, suggesting this might be supported in their version, or they prefer this approach. However, compilation errors suggest it's not supported for these other formats.

#### Enum Operator Errors (2 formats)
Formats using `&&` and `||` instead of `and` and `or`:
- **UTM**: `/types/field_entry/instances/is_simple_type/value:`
- **UTT**: `/types/field_entry/instances/is_simple_type/value:`

**Fix Pattern:** Replace `&&` with `and`, `||` with `or`, and change `field_type.value == X` to `field_type == gff_field_type::x`

#### Other Errors (4 formats)
- **GIT**: Ternary operator (FIXED - added quotes)
- **GUI**: Error at line 284 (needs investigation)
- **PTH**: field_data_section encoding (FIXED - changed to u1 array)
- **UTE**: field_data_section encoding (FIXED - changed to u1 array)
- **UTD**: Valid syntax (FIXED - quoted format)

## Fix Patterns

### Pattern 1: Move pos: from seq: to instances:

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

### Pattern 2: Fix Enum Operators

```yaml
# BEFORE (WRONG):
value: field_type.value >= 0 && field_type.value <= 5 || field_type.value == 8

# AFTER (CORRECT):
value: |
  field_type == gff_field_type::uint8 or
  field_type == gff_field_type::int8 or
  field_type == gff_field_type::uint16 or
  field_type == gff_field_type::int16 or
  field_type == gff_field_type::uint32 or
  field_type == gff_field_type::int32 or
  field_type == gff_field_type::single
```

### Pattern 3: Fix Valid Syntax

```yaml
# BEFORE (WRONG):
valid:
  any-of:
    - V3.2
    - V3.3

# AFTER (CORRECT):
valid:
  any-of: ["'V3.2'", "'V3.3'", "'V4.0'", "'V4.1'"]
```

### Pattern 4: Fix field_data_section Encoding

```yaml
# BEFORE (WRONG):
field_data_section:
  seq:
    - id: data
      type: str
      size: _root.gff_header.field_data_count

# AFTER (CORRECT):
field_data_section:
  seq:
    - id: data
      type: u1
      repeat: expr
      repeat-expr: _root.gff_header.field_data_count
```

### Pattern 5: Fix Ternary Operators in Value Expressions

```yaml
# BEFORE (WRONG):
value: string_ref == 0xFFFFFFFF ? -1 : string_ref

# AFTER (CORRECT):
value: 'string_ref == 0xFFFFFFFF ? -1 : string_ref'
```

## Remaining Work

1. **Fix pos: syntax** in GVT, IFO, NFO, PT, UTC, UTP, UTS (7 formats)
2. **Fix enum operators** in UTM, UTT (2 formats)
3. **Investigate ID errors** in DLG, FAC (2 formats)
4. **Investigate GUI error** at line 284 (1 format)
5. **Re-test all formats** after fixes

