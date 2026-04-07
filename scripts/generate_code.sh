#!/bin/bash
# Helper script to generate Kaitai Struct code for a specific language
# Usage: ./scripts/generate_code.sh python generated/python

set -euo pipefail

LANGUAGE="${1:-}"
OUTPUT_DIR="${2:-}"
KSC_VERSION="${3:-0.11}"
FORMATS_DIR="${4:-formats}"

if [ -z "$LANGUAGE" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Usage: $0 <language> <output_dir> [ksc_version] [formats_dir]"
    echo "Language must be one of: python, javascript, java, go, rust, cpp_stl, csharp, ruby, php, lua, perl, nim, swift"
    exit 1
fi

echo "Generating $LANGUAGE code from Kaitai Struct definitions..." >&2

# Prefer kaitai-struct-compiler (e.g. .deb on Linux). KSC 0.11 on Unix-like shells
# requires --outdir instead of -d unless arguments are separated with -- (see ksc --help).
KSC_BIN=""
if command -v kaitai-struct-compiler &> /dev/null; then
    KSC_BIN="kaitai-struct-compiler"
elif command -v ksc &> /dev/null; then
    KSC_BIN="ksc"
fi

if [ -z "$KSC_BIN" ]; then
    echo "Installing Kaitai Struct compiler $KSC_VERSION via pip..." >&2
    pip install "kaitai-struct-compiler==$KSC_VERSION" || {
        echo "Failed to install kaitai-struct-compiler (pip has no wheel for this platform; install the .deb/.zip from https://kaitai.io/#download )" >&2
        exit 1
    }
    KSC_BIN="kaitai-struct-compiler"
fi

INSTALLED_VERSION=$("$KSC_BIN" --version 2>&1 | head -n1 || echo "")
if [[ "$INSTALLED_VERSION" != *"$KSC_VERSION"* ]]; then
    echo "Warning: expected Kaitai Struct compiler $KSC_VERSION, found: $INSTALLED_VERSION" >&2
fi

# Find all .ksy files
KSY_FILES=$(find "$FORMATS_DIR" -name "*.ksy" -type f | sort)

if [ -z "$KSY_FILES" ]; then
    echo "No .ksy files found in $FORMATS_DIR" >&2
    exit 1
fi

KSY_COUNT=$(echo "$KSY_FILES" | wc -l)
echo "Found $KSY_COUNT .ksy files" >&2

# Create output directory
mkdir -p "$OUTPUT_DIR"

SUCCESS_COUNT=0
FAIL_COUNT=0

FORMATS_BASE=$(cd "$FORMATS_DIR" && pwd)

while IFS= read -r ksy_file; do
    # Calculate relative path from formats directory
    RELATIVE_PATH="${ksy_file#$FORMATS_BASE/}"

    mkdir -p "$OUTPUT_DIR"

    echo "  Processing: $RELATIVE_PATH" >&2

    # -I formats: resolve imports (e.g. gff -> bioware_common) from repo root
    if "$KSC_BIN" -t "$LANGUAGE" --outdir "$OUTPUT_DIR" -I "$FORMATS_DIR" "$ksy_file"; then
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo "  Warning: Failed to generate code for $RELATIVE_PATH" >&2
        FAIL_COUNT=$((FAIL_COUNT + 1))
    fi
done <<< "$KSY_FILES"

echo "" >&2
echo "Generation complete:" >&2
echo "  Success: $SUCCESS_COUNT" >&2
if [ $FAIL_COUNT -gt 0 ]; then
    echo "  Failed: $FAIL_COUNT" >&2
    exit 1
else
    echo "  Failed: $FAIL_COUNT" >&2
fi

