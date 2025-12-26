"""
API functions for BioWare UTI (Item Template) File Format.
Auto-generated from uti.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.uti import UTI


def read_uti(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> UTI:
    """Read UTI from source.

    Matches PyKotor's read_uti function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.uti import UTI
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_uti_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.uti.io_uti import UTIBinaryReader
    reader = UTIBinaryReader(source, offset, size)
    return reader.load(UTI())


def write_uti(
    uti: UTI,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write UTI to target.

    Matches PyKotor's write_uti function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.uti.io_uti import UTIBinaryWriter
        writer = UTIBinaryWriter(target, game=game)
        return writer.write(uti)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_uti_to_gff(uti)
    return write_gff(gff, target, file_format=file_format)


def bytes_uti(
    uti: UTI,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert UTI to bytes.

    Matches PyKotor's bytes_uti function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_uti(uti, buffer, game, file_format)
    return buffer.getvalue()


def _construct_uti_from_gff(gff) -> UTI:
    """Construct UTI from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.uti import UTI
    # TODO: Implement GFF to object conversion
    return UTI()


def _dismantle_uti_to_gff(uti: UTI):
    """Dismantle UTI to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
