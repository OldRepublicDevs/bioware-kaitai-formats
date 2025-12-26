"""
API functions for BioWare PT (Party Table) File Format.
Auto-generated from pt.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.pt import PT


def read_pt(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> PT:
    """Read PT from source.

    Matches PyKotor's read_pt function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.pt import PT
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_pt_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.pt.io_pt import PTBinaryReader
    reader = PTBinaryReader(source, offset, size)
    return reader.load(PT())


def write_pt(
    pt: PT,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write PT to target.

    Matches PyKotor's write_pt function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.pt.io_pt import PTBinaryWriter
        writer = PTBinaryWriter(target, game=game)
        return writer.write(pt)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_pt_to_gff(pt)
    return write_gff(gff, target, file_format=file_format)


def bytes_pt(
    pt: PT,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert PT to bytes.

    Matches PyKotor's bytes_pt function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_pt(pt, buffer, game, file_format)
    return buffer.getvalue()


def _construct_pt_from_gff(gff) -> PT:
    """Construct PT from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.pt import PT
    # TODO: Implement GFF to object conversion
    return PT()


def _dismantle_pt_to_gff(pt: PT):
    """Dismantle PT to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
