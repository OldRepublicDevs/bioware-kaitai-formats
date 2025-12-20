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

# Check if kaitai-struct-compiler is installed
if ! command -v ksc &> /dev/null; then
    echo "Installing Kaitai Struct compiler $KSC_VERSION..." >&2
    pip install "kaitai-struct-compiler==$KSC_VERSION" || {
        echo "Failed to install kaitai-struct-compiler" >&2
        exit 1
    }
else
    INSTALLED_VERSION=$(ksc --version 2>&1 | head -n1 || echo "")
    if [[ "$INSTALLED_VERSION" == *"$KSC_VERSION"* ]]; then
        echo "Kaitai Struct compiler $KSC_VERSION is already installed" >&2
    else
        echo "Installing Kaitai Struct compiler $KSC_VERSION..." >&2
        pip install "kaitai-struct-compiler==$KSC_VERSION" || {
            echo "Failed to install kaitai-struct-compiler" >&2
            exit 1
        }
    fi
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
    RELATIVE_DIR=$(dirname "$RELATIVE_PATH")

    # Calculate output path maintaining directory structure
    if [ "$RELATIVE_DIR" != "." ]; then
        TARGET_DIR="$OUTPUT_DIR/$RELATIVE_DIR"
    else
        TARGET_DIR="$OUTPUT_DIR"
    fi

    mkdir -p "$TARGET_DIR"

    echo "  Processing: $RELATIVE_PATH" >&2

    if ksc -t "$LANGUAGE" -d "$TARGET_DIR" "$ksy_file"; then
        ((SUCCESS_COUNT++))
    else
        echo "  Warning: Failed to generate code for $RELATIVE_PATH" >&2
        ((FAIL_COUNT++))
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

