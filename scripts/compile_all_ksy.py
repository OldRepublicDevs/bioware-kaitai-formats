#!/usr/bin/env python3
"""Compile all .ksy files to Python and report results."""

from __future__ import annotations

import subprocess
import sys
from pathlib import Path
from typing import Dict, Tuple

def compile_ksy(ksy_file: Path, output_dir: Path) -> Tuple[bool, str]:
    """Compile a single .ksy file to Python.
    
    Returns:
        (success, output) tuple
    """
    cmd = [
        "kaitai-struct-compiler",
        "-t", "python",
        "-d", str(output_dir),
        str(ksy_file)
    ]
    
    try:
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=30
        )
        output = result.stdout + result.stderr
        success = result.returncode == 0
        return (success, output)
    except Exception as e:
        return (False, str(e))

def main():
    """Compile all .ksy files and report results."""
    formats_dir = Path("formats")
    output_dir = Path("src/python/kaitai_generated")
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Find all .ksy files
    ksy_files = sorted(formats_dir.rglob("*.ksy"))
    
    results: Dict[str, Tuple[bool, str]] = {}
    
    print(f"Found {len(ksy_files)} .ksy files")
    print("=" * 80)
    
    for ksy_file in ksy_files:
        rel_path = ksy_file.relative_to(formats_dir)
        print(f"Compiling: {rel_path}...", end=" ")
        
        success, output = compile_ksy(ksy_file, output_dir)
        results[str(rel_path)] = (success, output)
        
        if success:
            if output.strip():
                print("OK (with warnings)")
            else:
                print("OK")
        else:
            print("FAILED")
    
    # Print summary
    print("=" * 80)
    successes = sum(1 for s, _ in results.values() if s)
    failures = len(results) - successes
    
    print(f"\nSummary: {successes} succeeded, {failures} failed")
    
    # Print failures
    if failures > 0:
        print("\n" + "=" * 80)
        print("FAILURES:")
        print("=" * 80)
        for file, (success, output) in results.items():
            if not success:
                print(f"\n{file}:")
                print(output)
    
    # Print warnings
    warnings = [(f, o) for f, (s, o) in results.items() if s and o.strip()]
    if warnings:
        print("\n" + "=" * 80)
        print("WARNINGS:")
        print("=" * 80)
        for file, output in warnings:
            print(f"\n{file}:")
            print(output)
    
    return 0 if failures == 0 else 1

if __name__ == "__main__":
    sys.exit(main())

