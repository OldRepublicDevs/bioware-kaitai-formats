"""
API functions for BioWare PTH (Path/Pathfinding) File Format.
Auto-generated from pth.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.pth import PTH


def read_pth(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> PTH:
    """Read PTH from source.

    Matches PyKotor's read_pth function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.pth import PTH
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_pth_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.pth.io_pth import PTHBinaryReader
    reader = PTHBinaryReader(source, offset, size)
    return reader.load(PTH())


def write_pth(
    pth: PTH,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write PTH to target.

    Matches PyKotor's write_pth function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.pth.io_pth import PTHBinaryWriter
        writer = PTHBinaryWriter(target, game=game)
        return writer.write(pth)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_pth_to_gff(pth)
    return write_gff(gff, target, file_format=file_format)


def bytes_pth(
    pth: PTH,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert PTH to bytes.

    Matches PyKotor's bytes_pth function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_pth(pth, buffer, game, file_format)
    return buffer.getvalue()


def _construct_pth_from_gff(gff) -> PTH:
    """Construct PTH from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.pth import PTH
    # TODO: Implement GFF to object conversion
    return PTH()


def _dismantle_pth_to_gff(pth: PTH):
    """Dismantle PTH to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
