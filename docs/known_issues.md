# Known Issues

## Position-based Reading (`pos:` key)

The `pos:` key is valid in Kaitai Struct, but only in `instances:` blocks, not in `seq:` blocks.

**Fix:** Move position-based fields from `seq:` to `instances:` blocks.

**Example:**
```yaml
# WRONG (in seq:)
seq:
  - id: label_array
    type: label_array
    pos: header.label_offset

# CORRECT (in instances:)
seq:
  - id: header
    type: gff_header

instances:
  label_array:
    type: label_array
    pos: header.label_offset
```

**Status:** ✅ Fixed in GFF.ksy - needs to be applied to all GFF generic format files

