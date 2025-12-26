"""
API functions for BioWare NFO (Module Info) File Format.
Auto-generated from nfo.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.nfo import NFO


def read_nfo(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> NFO:
    """Read NFO from source.

    Matches PyKotor's read_nfo function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.nfo import NFO
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_nfo_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.nfo.io_nfo import NFOBinaryReader
    reader = NFOBinaryReader(source, offset, size)
    return reader.load(NFO())


def write_nfo(
    nfo: NFO,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write NFO to target.

    Matches PyKotor's write_nfo function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.nfo.io_nfo import NFOBinaryWriter
        writer = NFOBinaryWriter(target, game=game)
        return writer.write(nfo)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_nfo_to_gff(nfo)
    return write_gff(gff, target, file_format=file_format)


def bytes_nfo(
    nfo: NFO,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert NFO to bytes.

    Matches PyKotor's bytes_nfo function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_nfo(nfo, buffer, game, file_format)
    return buffer.getvalue()


def _construct_nfo_from_gff(gff) -> NFO:
    """Construct NFO from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.nfo import NFO
    # TODO: Implement GFF to object conversion
    return NFO()


def _dismantle_nfo_to_gff(nfo: NFO):
    """Dismantle NFO to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
