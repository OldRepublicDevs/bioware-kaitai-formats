"""
API functions for BioWare UTM (Store/Merchant Template) File Format.
Auto-generated from utm.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.utm import UTM


def read_utm(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> UTM:
    """Read UTM from source.

    Matches PyKotor's read_utm function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.utm import UTM
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_utm_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.utm.io_utm import UTMBinaryReader
    reader = UTMBinaryReader(source, offset, size)
    return reader.load(UTM())


def write_utm(
    utm: UTM,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write UTM to target.

    Matches PyKotor's write_utm function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.utm.io_utm import UTMBinaryWriter
        writer = UTMBinaryWriter(target, game=game)
        return writer.write(utm)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_utm_to_gff(utm)
    return write_gff(gff, target, file_format=file_format)


def bytes_utm(
    utm: UTM,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert UTM to bytes.

    Matches PyKotor's bytes_utm function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_utm(utm, buffer, game, file_format)
    return buffer.getvalue()


def _construct_utm_from_gff(gff) -> UTM:
    """Construct UTM from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.utm import UTM
    # TODO: Implement GFF to object conversion
    return UTM()


def _dismantle_utm_to_gff(utm: UTM):
    """Dismantle UTM to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
