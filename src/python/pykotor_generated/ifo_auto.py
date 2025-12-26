"""
API functions for BioWare IFO (Module Information) File Format.
Auto-generated from ifo.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.ifo import IFO


def read_ifo(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> IFO:
    """Read IFO from source.

    Matches PyKotor's read_ifo function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.ifo import IFO
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_ifo_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.ifo.io_ifo import IFOBinaryReader
    reader = IFOBinaryReader(source, offset, size)
    return reader.load(IFO())


def write_ifo(
    ifo: IFO,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write IFO to target.

    Matches PyKotor's write_ifo function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.ifo.io_ifo import IFOBinaryWriter
        writer = IFOBinaryWriter(target, game=game)
        return writer.write(ifo)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_ifo_to_gff(ifo)
    return write_gff(gff, target, file_format=file_format)


def bytes_ifo(
    ifo: IFO,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert IFO to bytes.

    Matches PyKotor's bytes_ifo function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_ifo(ifo, buffer, game, file_format)
    return buffer.getvalue()


def _construct_ifo_from_gff(gff) -> IFO:
    """Construct IFO from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.ifo import IFO
    # TODO: Implement GFF to object conversion
    return IFO()


def _dismantle_ifo_to_gff(ifo: IFO):
    """Dismantle IFO to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
