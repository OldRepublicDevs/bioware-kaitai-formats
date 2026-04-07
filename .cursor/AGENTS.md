# Agent notes (Cursor Cloud / development environment)

This repository is a **Kaitai Struct format library**: `.ksy` definitions under `formats/`, generated parsers under `src/<language>/`, and validation via **Kaitai Struct Compiler 0.11** plus **Python tests** (`pytest`).

## Required tooling (Linux)

1. **Kaitai Struct Compiler 0.11**  
   - Prefer the official package: [kaitai.io download](https://kaitai.io/#download) (e.g. `.deb` on Ubuntu: `kaitai-struct-compiler` provides `ksc` and `kaitai-struct-compiler`).  
   - **Do not rely on `pip install kaitai-struct-compiler`** on many Linux images: PyPI often has no wheel and pip will fail.

2. **Python 3** (3.11+ matches CI; 3.12 works locally) with:
   - `kaitaistruct` (runtime for generated Python)
   - `pytest`
   - `pyyaml`, `jsonschema` (optional helpers for schema checks)

3. **Git submodules** (fixtures / wiki references):
   - Minimum for MDL tests: `git submodule update --init vendor/PyKotor`  
   - Full tree: `git submodule update --init --recursive` (may fail if a nested submodule URL is missing; init top-level vendors individually if needed).

## “Run the app” (there is no long-running server)

Demonstrate the environment by:

```bash
export PATH="$HOME/.local/bin:$PATH"   # if pytest is user-installed
./scripts/generate_code.sh python src/python/kaitai_generated
# or: python3 scripts/compile_all_ksy.py
pytest tests/python/ -v --ignore=tests/python/test_models_from_game_installations.py
```

- **`test_models_from_game_installations.py`**: requires a local KOTOR install + `pykotor` on `PYTHONPATH`; skip in CI sandboxes.  
- **`test_mdl_kaitai_roundtrip.py` / `test_mdlops_compat.py`**: invoke `vendor/MDLOps/mdlops.exe` — **will fail on Linux** (Windows PE binary). The **pure Kaitai parse tests** in `test_mdl_kaitai_parse.py` and `test_mdl_ascii_kaitai_parse.py` should pass.

## Compiler CLI (KSC 0.11)

On Unix, prefer **`--outdir`** (not `-d`) unless you separate operands with `--` (see `kaitai-struct-compiler --help`).  
Generation scripts pass **`-I formats`** so imports resolve from the repo.

## Submodule hygiene

Nested repos under `vendor/PyKotor` can show as “dirty” after failed recursive init. Reset inside that repo only if you need a clean `git status`; do not commit submodule pointer changes unless intentional.
