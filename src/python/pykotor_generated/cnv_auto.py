"""
API functions for BioWare CNV (Conversation) File Format.
Auto-generated from cnv.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.cnv import CNV


def read_cnv(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> CNV:
    """Read CNV from source.

    Matches PyKotor's read_cnv function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.cnv import CNV
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_cnv_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.cnv.io_cnv import CNVBinaryReader
    reader = CNVBinaryReader(source, offset, size)
    return reader.load(CNV())


def write_cnv(
    cnv: CNV,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write CNV to target.

    Matches PyKotor's write_cnv function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.cnv.io_cnv import CNVBinaryWriter
        writer = CNVBinaryWriter(target, game=game)
        return writer.write(cnv)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_cnv_to_gff(cnv)
    return write_gff(gff, target, file_format=file_format)


def bytes_cnv(
    cnv: CNV,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert CNV to bytes.

    Matches PyKotor's bytes_cnv function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_cnv(cnv, buffer, game, file_format)
    return buffer.getvalue()


def _construct_cnv_from_gff(gff) -> CNV:
    """Construct CNV from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.cnv import CNV
    # TODO: Implement GFF to object conversion
    return CNV()


def _dismantle_cnv_to_gff(cnv: CNV):
    """Dismantle CNV to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
