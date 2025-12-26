from __future__ import annotations

import sys
from io import BytesIO
from pathlib import Path

from kaitaistruct import KaitaiStream


def _repo_root() -> Path:
    return Path(__file__).resolve().parents[2]


def _import_kaitai_module(name: str):
    root = _repo_root()
    kaitai_dir = root / "src" / "python" / "kaitai_generated"
    sys.path.insert(0, str(kaitai_dir))
    try:
        return __import__(name)
    finally:
        sys.path.pop(0)


def test_mdl_ascii_kaitai_parses_lines() -> None:
    mdl_ascii = _import_kaitai_module("mdl_ascii")

    ascii_text = (
        "# ASCII MDL\n"
        "filedependancy unknown.tga\n"
        "newmodel test_model\n"
        "\n"
        "setsupermodel test_model NULL\n"
        "classification other\n"
        "classification_unk1 0\n"
        "ignorefog 1\n"
        "compress_quaternions 0\n"
        "\n"
        "beginmodelgeom test_model\n"
        "  node dummy test_model\n"
        "  {\n"
        "    parent -1\n"
        "  }\n"
        "endmodelgeom test_model\n"
        "\n"
        "donemodel test_model\n"
    ).encode("utf-8")

    parsed = mdl_ascii.MdlAscii(KaitaiStream(BytesIO(ascii_text)))
    assert len(parsed.lines) > 0
    assert parsed.lines[0].content.strip() == "# ASCII MDL"
    assert any("newmodel test_model" in line.content for line in parsed.lines)


