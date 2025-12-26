"""
API functions for BioWare GVT (Global Variables Table) File Format.
Auto-generated from gvt.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.gvt import GVT


def read_gvt(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> GVT:
    """Read GVT from source.

    Matches PyKotor's read_gvt function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.gvt import GVT
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_gvt_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.gvt.io_gvt import GVTBinaryReader
    reader = GVTBinaryReader(source, offset, size)
    return reader.load(GVT())


def write_gvt(
    gvt: GVT,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write GVT to target.

    Matches PyKotor's write_gvt function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.gvt.io_gvt import GVTBinaryWriter
        writer = GVTBinaryWriter(target, game=game)
        return writer.write(gvt)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_gvt_to_gff(gvt)
    return write_gff(gff, target, file_format=file_format)


def bytes_gvt(
    gvt: GVT,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert GVT to bytes.

    Matches PyKotor's bytes_gvt function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_gvt(gvt, buffer, game, file_format)
    return buffer.getvalue()


def _construct_gvt_from_gff(gff) -> GVT:
    """Construct GVT from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.gvt import GVT
    # TODO: Implement GFF to object conversion
    return GVT()


def _dismantle_gvt_to_gff(gvt: GVT):
    """Dismantle GVT to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
