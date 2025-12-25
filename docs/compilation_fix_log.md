# Compilation Fix Log

**Date:** 2025-01-27

## Fixed Compilation Errors

### ✅ ARE.ksy
- **Issue**: `valid: any-of` syntax error with unquoted string values
- **Fix**: Changed to `valid: any-of: ["V3.2", "V3.3", "V4.0", "V4.1"]` (object notation)

### ✅ CNV.ksy
- **Issue**: `valid: any-of` syntax error with unquoted string values  
- **Fix**: Changed to `valid: any-of: ["V3.2", "V3.3", "V4.0", "V4.1"]` (object notation)

### ✅ UTD.ksy
- **Issue**: `valid: any-of` syntax error with unquoted string values
- **Fix**: Changed to `valid: any-of: ["V3.2", "V3.3", "V4.0", "V4.1"]` (object notation)

### ✅ ERF.ksy
- **Issue**: `string type, but no encoding found` in `resource_entry.instances.data`
- **Fix**: Changed `type: str` to raw data (removed type, kept `size:` only)

### ✅ TwoDA.ksy
- **Issue**: Enum expression syntax error - `&&` operator not recognized
- **Fix**: Changed `&&` to `and`, `||` to `or` (Kaitai Struct uses `and`/`or` not `&&`/`||`)

## Pattern for Fixes

### Valid Expression Syntax
```yaml
# WRONG (unquoted values cause parsing errors)
valid:
  any-of:
    - V3.2
    - V3.3

# CORRECT (object notation with quoted strings)
valid:
  any-of: ["V3.2", "V3.3", "V4.0", "V4.1"]
```

### Enum Expression Operators
```yaml
# WRONG (C-style operators)
value: magic == "2DA " && version == "V2.b" && newline == 0x0A

# CORRECT (Kaitai Struct operators)
value: magic == "2DA " and version == "V2.b" and newline == 0x0A
```

### Raw Data (no encoding needed)
```yaml
# WRONG (string type requires encoding)
instances:
  data:
    type: str
    size: file_size

# CORRECT (raw data, no type/encoding)
instances:
  data:
    size: file_size
```

## Remaining Issues to Fix

### GFF Generic Formats
All GFF generic formats need to check:
1. `valid: any-of` syntax (use object notation with quoted strings)
2. Enum expressions (use `and`/`or` not `&&`/`||`)
3. `pos:` fields must be in `instances:` not `seq:`
4. Raw data fields should not have `type: str` without encoding

### Formats to Check
- FAC, GIT, GUI, GVT, IFO, NFO, PT, PTH, UTE, UTP, UTS
- UTC, UTI, UTM, UTT, UTW
- GAM, JRL

