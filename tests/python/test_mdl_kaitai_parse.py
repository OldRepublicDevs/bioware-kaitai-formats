from __future__ import annotations

import sys
from io import BytesIO
from pathlib import Path

import pytest
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


def _mdl_fixture_paths() -> list[Path]:
    root = _repo_root()
    mdl_dir = (
        root
        / "vendor"
        / "PyKotor"
        / "Libraries"
        / "PyKotor"
        / "tests"
        / "test_files"
        / "mdl"
    )
    return sorted(mdl_dir.glob("*.mdl"))


@pytest.mark.parametrize("path", _mdl_fixture_paths(), ids=lambda p: p.name)
def test_mdl_kaitai_parses_all_vendor_mdl_fixtures(path: Path) -> None:
    mdl = _import_kaitai_module("mdl")
    data = path.read_bytes()
    parsed = mdl.Mdl(KaitaiStream(BytesIO(data)))

    assert parsed.file_header.mdl_size > 0
    assert parsed.names_header.name_count == parsed.geometry_header.node_count
    if parsed.geometry_header.root_node_offset > 0:
        assert parsed.root_node is not None


def test_mdl_kaitai_parses_dewback_binary() -> None:
    mdl = _import_kaitai_module("mdl")

    root = _repo_root()
    dewback_path = (
        root
        / "vendor"
        / "PyKotor"
        / "Libraries"
        / "PyKotor"
        / "tests"
        / "test_files"
        / "mdl"
        / "c_dewback.mdl"
    )
    data = dewback_path.read_bytes()

    parsed = mdl.Mdl(KaitaiStream(BytesIO(data)))

    assert parsed.file_header.mdl_size > 0
    assert parsed.file_header.mdx_size > 0
    assert parsed.geometry_header.model_name == "C_Dewback"
    assert parsed.geometry_header.node_count > 0
    assert parsed.names_header.name_count == parsed.geometry_header.node_count

    # Names blob should include the model name as the first string in practice for these fixtures.
    assert parsed.names_data.strings[0] == "C_Dewback"


def test_mdl_kaitai_exposes_root_node() -> None:
    mdl = _import_kaitai_module("mdl")

    root = _repo_root()
    dewback_path = (
        root
        / "vendor"
        / "PyKotor"
        / "Libraries"
        / "PyKotor"
        / "tests"
        / "test_files"
        / "mdl"
        / "c_dewback.mdl"
    )
    data = dewback_path.read_bytes()

    parsed = mdl.Mdl(KaitaiStream(BytesIO(data)))
    root_node = parsed.root_node
    assert root_node is not None
    assert root_node.header is not None
    # Root node is typically a dummy (container) node.
    assert root_node.header.node_type in (mdl.Mdl.NodeTypeValue.dummy, mdl.Mdl.NodeTypeValue.trimesh, mdl.Mdl.NodeTypeValue.skinmesh)


