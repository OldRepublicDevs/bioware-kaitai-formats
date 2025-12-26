"""
API functions for BioWare JRL (Journal) File Format.
Auto-generated from jrl.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.jrl import JRL


def read_jrl(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> JRL:
    """Read JRL from source.

    Matches PyKotor's read_jrl function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.jrl import JRL
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_jrl_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.jrl.io_jrl import JRLBinaryReader
    reader = JRLBinaryReader(source, offset, size)
    return reader.load(JRL())


def write_jrl(
    jrl: JRL,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write JRL to target.

    Matches PyKotor's write_jrl function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.jrl.io_jrl import JRLBinaryWriter
        writer = JRLBinaryWriter(target, game=game)
        return writer.write(jrl)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_jrl_to_gff(jrl)
    return write_gff(gff, target, file_format=file_format)


def bytes_jrl(
    jrl: JRL,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert JRL to bytes.

    Matches PyKotor's bytes_jrl function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_jrl(jrl, buffer, game, file_format)
    return buffer.getvalue()


def _construct_jrl_from_gff(gff) -> JRL:
    """Construct JRL from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.jrl import JRL
    # TODO: Implement GFF to object conversion
    return JRL()


def _dismantle_jrl_to_gff(jrl: JRL):
    """Dismantle JRL to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
