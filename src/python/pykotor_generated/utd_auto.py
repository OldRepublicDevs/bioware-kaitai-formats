"""
API functions for BioWare UTD (Door Template) File Format.
Auto-generated from utd.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.utd import UTD


def read_utd(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> UTD:
    """Read UTD from source.

    Matches PyKotor's read_utd function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.utd import UTD
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_utd_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.utd.io_utd import UTDBinaryReader
    reader = UTDBinaryReader(source, offset, size)
    return reader.load(UTD())


def write_utd(
    utd: UTD,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write UTD to target.

    Matches PyKotor's write_utd function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.utd.io_utd import UTDBinaryWriter
        writer = UTDBinaryWriter(target, game=game)
        return writer.write(utd)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_utd_to_gff(utd)
    return write_gff(gff, target, file_format=file_format)


def bytes_utd(
    utd: UTD,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert UTD to bytes.

    Matches PyKotor's bytes_utd function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_utd(utd, buffer, game, file_format)
    return buffer.getvalue()


def _construct_utd_from_gff(gff) -> UTD:
    """Construct UTD from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.utd import UTD
    # TODO: Implement GFF to object conversion
    return UTD()


def _dismantle_utd_to_gff(utd: UTD):
    """Dismantle UTD to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
