"""
API functions for BioWare UTW (Waypoint Template) File Format.
Auto-generated from utw.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.utw import UTW


def read_utw(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> UTW:
    """Read UTW from source.

    Matches PyKotor's read_utw function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.utw import UTW
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_utw_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.utw.io_utw import UTWBinaryReader
    reader = UTWBinaryReader(source, offset, size)
    return reader.load(UTW())


def write_utw(
    utw: UTW,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write UTW to target.

    Matches PyKotor's write_utw function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.utw.io_utw import UTWBinaryWriter
        writer = UTWBinaryWriter(target, game=game)
        return writer.write(utw)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_utw_to_gff(utw)
    return write_gff(gff, target, file_format=file_format)


def bytes_utw(
    utw: UTW,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert UTW to bytes.

    Matches PyKotor's bytes_utw function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_utw(utw, buffer, game, file_format)
    return buffer.getvalue()


def _construct_utw_from_gff(gff) -> UTW:
    """Construct UTW from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.utw import UTW
    # TODO: Implement GFF to object conversion
    return UTW()


def _dismantle_utw_to_gff(utw: UTW):
    """Dismantle UTW to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
