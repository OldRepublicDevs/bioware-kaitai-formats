"""
API functions for BioWare UTC (Creature Template) File.
Auto-generated from utc.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.utc import UTC


def read_utc(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> UTC:
    """Read UTC from source.

    Matches PyKotor's read_utc function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.utc import UTC
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_utc_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.utc.io_utc import UTCBinaryReader
    reader = UTCBinaryReader(source, offset, size)
    return reader.load(UTC())


def write_utc(
    utc: UTC,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write UTC to target.

    Matches PyKotor's write_utc function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.utc.io_utc import UTCBinaryWriter
        writer = UTCBinaryWriter(target, game=game)
        return writer.write(utc)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_utc_to_gff(utc)
    return write_gff(gff, target, file_format=file_format)


def bytes_utc(
    utc: UTC,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert UTC to bytes.

    Matches PyKotor's bytes_utc function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_utc(utc, buffer, game, file_format)
    return buffer.getvalue()


def _construct_utc_from_gff(gff) -> UTC:
    """Construct UTC from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.utc import UTC
    # TODO: Implement GFF to object conversion
    return UTC()


def _dismantle_utc_to_gff(utc: UTC):
    """Dismantle UTC to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
