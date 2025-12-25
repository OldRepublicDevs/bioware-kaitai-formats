# Known Issues

## Position-based Reading (`pos:` key)

Many GFF format files use the `pos:` key for position-based reading of file sections. However, the `pos:` key appears to not be supported in Kaitai Struct 0.11 compiler.

**Affected Files:**
- All GFF format files (GFF.ksy and all GFF generic formats)
- Some other format files that use position-based reading

**Status:** Needs investigation - either:
1. These files were written for an older version of Kaitai Struct
2. Position-based reading needs to be implemented differently in 0.11
3. These files need to be refactored to use a different approach

**Workaround:** These formats may still work if they were compiled with an older version of the compiler, or if the generated code is manually maintained.

**Next Steps:**
- Research correct syntax for position-based reading in Kaitai Struct 0.11
- Consider refactoring to use `_io.seek()` in instances or other approaches
- Test compilation with different compiler versions

