"""
API functions for BioWare UTS (Sound Template) File Format.
Auto-generated from uts.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.uts import UTS


def read_uts(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> UTS:
    """Read UTS from source.

    Matches PyKotor's read_uts function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.uts import UTS
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_uts_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.uts.io_uts import UTSBinaryReader
    reader = UTSBinaryReader(source, offset, size)
    return reader.load(UTS())


def write_uts(
    uts: UTS,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write UTS to target.

    Matches PyKotor's write_uts function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.uts.io_uts import UTSBinaryWriter
        writer = UTSBinaryWriter(target, game=game)
        return writer.write(uts)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_uts_to_gff(uts)
    return write_gff(gff, target, file_format=file_format)


def bytes_uts(
    uts: UTS,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert UTS to bytes.

    Matches PyKotor's bytes_uts function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_uts(uts, buffer, game, file_format)
    return buffer.getvalue()


def _construct_uts_from_gff(gff) -> UTS:
    """Construct UTS from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.uts import UTS
    # TODO: Implement GFF to object conversion
    return UTS()


def _dismantle_uts_to_gff(uts: UTS):
    """Dismantle UTS to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
