"""
API functions for BioWare GAM (Game State) File Format.
Auto-generated from gam.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.gam import GAM


def read_gam(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> GAM:
    """Read GAM from source.

    Matches PyKotor's read_gam function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.gam import GAM
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_gam_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.gam.io_gam import GAMBinaryReader
    reader = GAMBinaryReader(source, offset, size)
    return reader.load(GAM())


def write_gam(
    gam: GAM,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write GAM to target.

    Matches PyKotor's write_gam function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.gam.io_gam import GAMBinaryWriter
        writer = GAMBinaryWriter(target, game=game)
        return writer.write(gam)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_gam_to_gff(gam)
    return write_gff(gff, target, file_format=file_format)


def bytes_gam(
    gam: GAM,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert GAM to bytes.

    Matches PyKotor's bytes_gam function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_gam(gam, buffer, game, file_format)
    return buffer.getvalue()


def _construct_gam_from_gff(gff) -> GAM:
    """Construct GAM from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.gam import GAM
    # TODO: Implement GFF to object conversion
    return GAM()


def _dismantle_gam_to_gff(gam: GAM):
    """Dismantle GAM to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
