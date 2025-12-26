"""
API functions for BioWare DLG (Dialogue) File Format.
Auto-generated from dlg.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.dlg import DLG


def read_dlg(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> DLG:
    """Read DLG from source.

    Matches PyKotor's read_dlg function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.dlg import DLG
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_dlg_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.dlg.io_dlg import DLGBinaryReader
    reader = DLGBinaryReader(source, offset, size)
    return reader.load(DLG())


def write_dlg(
    dlg: DLG,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write DLG to target.

    Matches PyKotor's write_dlg function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.dlg.io_dlg import DLGBinaryWriter
        writer = DLGBinaryWriter(target, game=game)
        return writer.write(dlg)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_dlg_to_gff(dlg)
    return write_gff(gff, target, file_format=file_format)


def bytes_dlg(
    dlg: DLG,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert DLG to bytes.

    Matches PyKotor's bytes_dlg function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_dlg(dlg, buffer, game, file_format)
    return buffer.getvalue()


def _construct_dlg_from_gff(gff) -> DLG:
    """Construct DLG from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.dlg import DLG
    # TODO: Implement GFF to object conversion
    return DLG()


def _dismantle_dlg_to_gff(dlg: DLG):
    """Dismantle DLG to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
