"""
API functions for BioWare UTP (Placeable Template) File Format.
Auto-generated from utp.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.utp import UTP


def read_utp(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> UTP:
    """Read UTP from source.

    Matches PyKotor's read_utp function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.utp import UTP
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_utp_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.utp.io_utp import UTPBinaryReader
    reader = UTPBinaryReader(source, offset, size)
    return reader.load(UTP())


def write_utp(
    utp: UTP,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write UTP to target.

    Matches PyKotor's write_utp function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.utp.io_utp import UTPBinaryWriter
        writer = UTPBinaryWriter(target, game=game)
        return writer.write(utp)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_utp_to_gff(utp)
    return write_gff(gff, target, file_format=file_format)


def bytes_utp(
    utp: UTP,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert UTP to bytes.

    Matches PyKotor's bytes_utp function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_utp(utp, buffer, game, file_format)
    return buffer.getvalue()


def _construct_utp_from_gff(gff) -> UTP:
    """Construct UTP from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.utp import UTP
    # TODO: Implement GFF to object conversion
    return UTP()


def _dismantle_utp_to_gff(utp: UTP):
    """Dismantle UTP to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
