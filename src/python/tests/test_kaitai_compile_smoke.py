from __future__ import annotations

import os
import subprocess
import tempfile
import unittest
from pathlib import Path
from shutil import which

REPO_ROOT = Path(__file__).resolve().parents[3]

def _resolve_ksc() -> str:
    # Prefer environment override for CI / custom installs.
    env_path = os.environ.get("KAITAI_STRUCT_COMPILER")
    if env_path:
        p = Path(env_path)
        if p.exists():
            return str(p)

    # Typical PATH resolution (Windows installer usually provides a .bat).
    for candidate in ("kaitai-struct-compiler", "kaitai-struct-compiler.bat"):
        found = which(candidate)
        if found:
            return found

    # Common Windows installer default.
    common_win = Path(r"C:\Program Files (x86)\kaitai-struct-compiler\bin\kaitai-struct-compiler.bat")
    if common_win.exists():
        return str(common_win)

    raise FileNotFoundError(
        "Could not locate `kaitai-struct-compiler`. "
        "Add it to PATH or set env var `KAITAI_STRUCT_COMPILER` to its full path."
    )


# FIXME: This is a baseline list of known-failing formats under Kaitai Struct Compiler 0.11.
# TODO: Keep this list shrinking: whenever you fix a format, move it to EXPECTED_PASSES.
EXPECTED_FAILURES = {
    Path("formats/BWM/BWM.ksy"),
    Path("formats/DA2S/DA2S.ksy"),
    Path("formats/DAS/DAS.ksy"),
    Path("formats/GFF/Generics/DLG/DLG.ksy"),
    Path("formats/GFF/Generics/FAC/FAC.ksy"),
    Path("formats/GFF/Generics/GIT/GIT.ksy"),
    Path("formats/GFF/Generics/GUI/GUI.ksy"),
    Path("formats/GFF/Generics/GVT/GVT.ksy"),
    Path("formats/GFF/Generics/IFO/IFO.ksy"),
    Path("formats/GFF/Generics/NFO/NFO.ksy"),
    Path("formats/GFF/Generics/PT/PT.ksy"),
    Path("formats/GFF/Generics/PTH/PTH.ksy"),
    Path("formats/GFF/Generics/UTC/UTC.ksy"),
    Path("formats/GFF/Generics/UTD/UTD.ksy"),
    Path("formats/GFF/Generics/UTE/UTE.ksy"),
    Path("formats/GFF/Generics/UTM/UTM.ksy"),
    Path("formats/GFF/Generics/UTP/UTP.ksy"),
    Path("formats/GFF/Generics/UTS/UTS.ksy"),
    Path("formats/GFF/Generics/UTT/UTT.ksy"),
    Path("formats/LYT/LYT.ksy"),
    Path("formats/MDL/MDL_ASCII.ksy"),
    Path("formats/MDL/MDL.ksy"),
    Path("formats/MDL/MDX.ksy"),
    Path("formats/PCC/PCC.ksy"),
    Path("formats/PLT/PLT.ksy"),
    Path("formats/RIM/RIM.ksy"),
    Path("formats/TPC/DDS.ksy"),
    Path("formats/TPC/TGA.ksy"),
    Path("formats/TPC/TPC.ksy"),
    Path("formats/WAV/WAV.ksy"),
}


# A small “known good” set we expect to compile cleanly.
# This guards against PATH / environment regressions and confirms the harness is working.
EXPECTED_PASSES = {
    Path("formats/BIF/KEY.ksy"),
    Path("formats/BIF/BIF.ksy"),
    Path("formats/BIF/BZF.ksy"),
    Path("formats/ERF/ERF.ksy"),
    Path("formats/GFF/GFF.ksy"),
    Path("formats/GFF/Generics/ARE/ARE.ksy"),
    Path("formats/GFF/Generics/CNV/CNV.ksy"),
    Path("formats/SSF/SSF.ksy"),
    Path("formats/TwoDA/TwoDA.ksy"),
}


def _run_ksc(ksy_path: Path) -> subprocess.CompletedProcess[str]:
    ksc = _resolve_ksc()
    with tempfile.TemporaryDirectory(prefix="kaitai_py_") as tmp:
        out_dir = Path(tmp)
        # Always compile a single file per test: easier attribution and faster iteration.
        return subprocess.run(
            [
                ksc,
                "-t",
                "python",
                "-d",
                str(out_dir),
                str(ksy_path),
            ],
            cwd=str(REPO_ROOT),
            text=True,
            capture_output=True,
            check=False,
        )


class KaitaiCompilerSmokeTests(unittest.TestCase):
    def test_expected_passes_compile(self) -> None:
        for rel in sorted(EXPECTED_PASSES):
            with self.subTest(ksy=str(rel)):
                ksy = REPO_ROOT / rel
                self.assertTrue(ksy.exists(), f"Missing file: {rel}")
                proc = _run_ksc(ksy)
                if proc.returncode != 0:
                    self.fail(
                        "\n".join(
                            [
                                f"Expected compile success, got exit code {proc.returncode} for {rel}",
                                "--- stdout ---",
                                proc.stdout,
                                "--- stderr ---",
                                proc.stderr,
                            ]
                        )
                    )

    def test_expected_failures_do_not_compile(self) -> None:
        for rel in sorted(EXPECTED_FAILURES):
            with self.subTest(ksy=str(rel)):
                ksy = REPO_ROOT / rel
                self.assertTrue(ksy.exists(), f"Missing file: {rel}")
                proc = _run_ksc(ksy)
                if proc.returncode == 0:
                    self.fail(
                        "\n".join(
                            [
                                f"Expected compile failure, but compilation succeeded for {rel}",
                                "Remove it from EXPECTED_FAILURES and add it to EXPECTED_PASSES.",
                            ]
                        )
                    )


if __name__ == "__main__":
    unittest.main()
