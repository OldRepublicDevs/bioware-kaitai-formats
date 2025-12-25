# Kaitai Struct Compilation Status & Next Steps

## Current Status (as of commit 4aa7643)

### ✅ Completed
1. **Refactored all GFF generics** - Removed duplication, all inherit from GFF.ksy
2. **Created BioWare_Common.ksy** - Shared types (LocalizedString, ResRef, Vector3, etc.)
3. **Fixed 57 .ksy files** - Successfully compiling to Python
4. **Fixed boolean operators** - Replaced `&&`/`||` with `and`/`or`
5. **Fixed XML variant imports** - Corrected path case sensitivity
6. **Generated Python parsers** - 57 working Kaitai-generated Python modules

### ❌ Remaining Issues (31 files)

**XML Variants (23 files)** - Path resolution issues
- All `*_XML.ksy` files in GFF/Generics failing with path not found
- Issue: Kaitai compiler can't resolve `../../GFF/GFF.ksy` on Windows

**Format-Specific Errors (8 files)**:
1. **BWM.ksy** - Expression parsing (string methods not supported)
2. **DA2S.ksy** - Ternary operator not supported
3. **DAS.ksy** - String method `.rstrip()` not supported  
4. **LYT.ksy** - String method `.find()` not supported
5. **MDL_ASCII.ksy** - Missing size/terminator specification
6. **MDL.ksy** - Invalid `pos:` key in seq
7. **PCC.ksy** - YAML syntax error
8. **TGA.ksy** - Ternary operator in repeat-expr
9. **TPC.ksy** - Invalid `size:` key usage

## Critical Understanding: Kaitai Struct Limitations

### What Kaitai CAN Do ✅
- Generate **parsers (readers)** for 12+ languages
- Parse binary formats into data structures
- Support complex format specifications
- Lazy parsing for efficiency

### What Kaitai CANNOT Do ❌
- Generate **writers/serializers**
- Generate high-level object models (like PyKotor classes)
- Generate test suites
- Support Python string methods (`.rstrip()`, `.find()`, etc.)
- Support ternary operators (`x if condition else y`)

## Next Steps to Complete

### Phase 1: Fix Remaining .ksy Errors (PRIORITY)

**1. Fix XML Variant Imports**
```yaml
# Current (failing):
imports:
  - ../../GFF/GFF
  
# Try absolute imports or different path format
imports:
  - /GFF/GFF
# OR remove imports entirely if not needed
```

**2. Remove Unsupported Features**
- Replace ternary operators with switch-on
- Remove string method calls
- Fix invalid YAML syntax

**3. Simplify Complex Formats**
- Mark unsupported features with TODO comments
- Create simplified versions that compile
- Document limitations

### Phase 2: Generate Parsers for All Languages

Once all .ksy files compile:

```powershell
# Generate for all supported languages
$languages = @("python", "csharp", "java", "javascript", "go", "rust", "cpp_stl", "ruby", "php", "lua", "perl", "nim", "swift")

foreach ($lang in $languages) {
    kaitai-struct-compiler -t $lang -d "src/$lang" formats/**/*.ksy
}
```

### Phase 3: Create Test Infrastructure

Since Kaitai doesn't generate tests, create test framework:

**Python Test Template** (`src/python/tests/test_kaitai_parsers.py`):
```python
"""Test that Kaitai parsers produce same output as PyKotor."""

import unittest
from pathlib import Path

# Import Kaitai-generated parsers
from kaitai_generated import are, utc, gff

# Import PyKotor for comparison
from pykotor.resource.generics import are as pykotor_are
from pykotor.resource.formats.gff import read_gff


class TestKaitaiParsers(unittest.TestCase):
    """Verify Kaitai parsers match PyKotor output."""
    
    def test_are_parser_matches_pykotor(self):
        """Test ARE parser produces same structure as PyKotor."""
        test_file = Path("test_files/test.are")
        
        # Parse with Kaitai
        kaitai_result = are.Are.from_file(str(test_file))
        
        # Parse with PyKotor
        pykotor_result = pykotor_are.read_are(test_file)
        
        # Compare structures
        self.assertEqual(
            kaitai_result.gff_data.header.file_type,
            "ARE "
        )
        # Add more comparisons...
```

### Phase 4: Document Kaitai vs PyKotor Differences

Create mapping document showing:
- What Kaitai parsers provide
- What PyKotor provides that Kaitai doesn't
- How to bridge the gap

## Recommended Approach Going Forward

### Option A: Kaitai for Reading, Manual Writers (RECOMMENDED)

**Pros:**
- Leverages Kaitai's strengths (parsing)
- Multi-language support automatically
- Well-tested parser generation

**Cons:**
- Must manually implement writers per language
- No high-level object models
- Tests must be written manually

**Implementation:**
1. Fix all .ksy files
2. Generate parsers for all languages
3. Create wrapper classes that use Kaitai parsers
4. Manually implement writers (or use PyKotor writers)
5. Create comprehensive test suite

### Option B: Pure PyKotor with Language Bindings

**Pros:**
- PyKotor already has everything (readers, writers, tests)
- Proven, battle-tested code
- High-level object models

**Cons:**
- Python-only natively
- Language bindings add complexity
- Performance overhead for cross-language calls

**Implementation:**
1. Keep PyKotor as-is
2. Create C# bindings via Python.NET
3. Create Go bindings via gRPC
4. etc.

### Option C: Custom Code Generator from .ksy

**Pros:**
- Full control over generated code
- Can generate readers AND writers
- Can match PyKotor architecture exactly

**Cons:**
- Massive undertaking (months of work)
- Must maintain custom generator
- Reinventing the wheel

**Implementation:**
1. Build code generator that reads .ksy
2. Generate PyKotor-style classes
3. Generate readers and writers
4. Generate tests
5. Support multiple languages

## Immediate Action Items

1. **Fix remaining 31 .ksy compilation errors**
   - Focus on XML variants path issues
   - Remove unsupported features
   - Simplify complex formats

2. **Generate Python parsers for all working formats**
   - Run compilation script
   - Verify generated code
   - Test with sample files

3. **Create comparison tests**
   - Parse same files with Kaitai and PyKotor
   - Compare outputs
   - Document differences

4. **Make decision on approach**
   - Pure Kaitai (readers only)
   - Hybrid (Kaitai + PyKotor)
   - Custom generator
   - Pure PyKotor with bindings

## Files Created This Session

- `scripts/compile_all_ksy.ps1` - Batch compilation script
- `scripts/fix_all_ksy_errors.ps1` - Automated error fixing
- `scripts/fix_xml_variants.py` - XML variant standardization
- `docs/kaitai_architecture.md` - Architecture documentation
- `src/python/kaitai_generated/*.py` - 57 generated Python parsers

## Success Metrics

- ✅ 57/88 .ksy files compiling (65%)
- ✅ All GFF binary formats working
- ✅ Core formats (BIF, ERF, RIM, TLK, SSF) working
- ⏳ XML variants need fixing
- ⏳ Complex formats (MDL, TPC) need simplification

## Conclusion

We've made significant progress refactoring and fixing .ksy files. The Kaitai Struct compiler is working for most formats. The remaining issues are:

1. **Path resolution for XML variants** - Solvable
2. **Unsupported language features** - Must remove or work around
3. **Complex formats** - May need simplification

The fundamental limitation remains: **Kaitai only generates parsers, not writers**. Any solution requiring writers must either:
- Use PyKotor's existing writers
- Manually implement writers per language
- Build a custom code generator

**Recommendation**: Fix remaining .ksy errors, generate parsers for all languages, create test suite comparing Kaitai output to PyKotor, then decide on writer strategy.

