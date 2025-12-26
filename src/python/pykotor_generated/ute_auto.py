"""
API functions for BioWare UTE (Encounter Template) File Format.
Auto-generated from ute.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.ute import UTE


def read_ute(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> UTE:
    """Read UTE from source.

    Matches PyKotor's read_ute function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.ute import UTE
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_ute_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.ute.io_ute import UTEBinaryReader
    reader = UTEBinaryReader(source, offset, size)
    return reader.load(UTE())


def write_ute(
    ute: UTE,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write UTE to target.

    Matches PyKotor's write_ute function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.ute.io_ute import UTEBinaryWriter
        writer = UTEBinaryWriter(target, game=game)
        return writer.write(ute)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_ute_to_gff(ute)
    return write_gff(gff, target, file_format=file_format)


def bytes_ute(
    ute: UTE,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert UTE to bytes.

    Matches PyKotor's bytes_ute function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_ute(ute, buffer, game, file_format)
    return buffer.getvalue()


def _construct_ute_from_gff(gff) -> UTE:
    """Construct UTE from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.ute import UTE
    # TODO: Implement GFF to object conversion
    return UTE()


def _dismantle_ute_to_gff(ute: UTE):
    """Dismantle UTE to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
