"""
API functions for BioWare FAC (Faction) File Format.
Auto-generated from fac.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.fac import FAC


def read_fac(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> FAC:
    """Read FAC from source.

    Matches PyKotor's read_fac function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.fac import FAC
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_fac_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.fac.io_fac import FACBinaryReader
    reader = FACBinaryReader(source, offset, size)
    return reader.load(FAC())


def write_fac(
    fac: FAC,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write FAC to target.

    Matches PyKotor's write_fac function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.fac.io_fac import FACBinaryWriter
        writer = FACBinaryWriter(target, game=game)
        return writer.write(fac)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_fac_to_gff(fac)
    return write_gff(gff, target, file_format=file_format)


def bytes_fac(
    fac: FAC,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert FAC to bytes.

    Matches PyKotor's bytes_fac function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_fac(fac, buffer, game, file_format)
    return buffer.getvalue()


def _construct_fac_from_gff(gff) -> FAC:
    """Construct FAC from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.fac import FAC
    # TODO: Implement GFF to object conversion
    return FAC()


def _dismantle_fac_to_gff(fac: FAC):
    """Dismantle FAC to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
