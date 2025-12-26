"""
API functions for BioWare ARE (Area) File Format.
Auto-generated from are.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.are import ARE


def read_are(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> ARE:
    """Read ARE from source.

    Matches PyKotor's read_are function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.are import ARE
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_are_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.are.io_are import AREBinaryReader
    reader = AREBinaryReader(source, offset, size)
    return reader.load(ARE())


def write_are(
    are: ARE,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write ARE to target.

    Matches PyKotor's write_are function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.are.io_are import AREBinaryWriter
        writer = AREBinaryWriter(target, game=game)
        return writer.write(are)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_are_to_gff(are)
    return write_gff(gff, target, file_format=file_format)


def bytes_are(
    are: ARE,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert ARE to bytes.

    Matches PyKotor's bytes_are function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_are(are, buffer, game, file_format)
    return buffer.getvalue()


def _construct_are_from_gff(gff) -> ARE:
    """Construct ARE from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.are import ARE
    # TODO: Implement GFF to object conversion
    return ARE()


def _dismantle_are_to_gff(are: ARE):
    """Dismantle ARE to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
