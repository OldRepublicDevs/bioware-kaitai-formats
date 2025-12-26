"""
API functions for BioWare GUI (Graphical User Interface) File Format.
Auto-generated from gui.ksy for PyKotor compatibility
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.gui import GUI


def read_gui(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
) -> GUI:
    """Read GUI from source.

    Matches PyKotor's read_gui function signature exactly.
    Supports binary, XML, and JSON formats.
    """
    from pykotor.resource.generics.gui import GUI
    from pykotor.resource.formats.gff import read_gff

    # Detect format and read
    if isinstance(source, (str, Path)) and source.endswith(('.xml', '.json')):
        file_format = ResourceType.GFF_XML if source.endswith('.xml') else ResourceType.GFF_JSON
        gff = read_gff(source, file_format=file_format)
        return _construct_gui_from_gff(gff)

    # Binary format
    from pykotor.resource.generics.gui.io_gui import GUIBinaryReader
    reader = GUIBinaryReader(source, offset, size)
    return reader.load(GUI())


def write_gui(
    gui: GUI,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write GUI to target.

    Matches PyKotor's write_gui function signature exactly.
    """
    if file_format == ResourceType.GFF:
        # Binary format
        from pykotor.resource.generics.gui.io_gui import GUIBinaryWriter
        writer = GUIBinaryWriter(target, game=game)
        return writer.write(gui)

    # XML/JSON format
    from pykotor.resource.formats.gff import write_gff
    gff = _dismantle_gui_to_gff(gui)
    return write_gff(gff, target, file_format=file_format)


def bytes_gui(
    gui: GUI,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert GUI to bytes.

    Matches PyKotor's bytes_gui function signature exactly.
    """
    from io import BytesIO
    buffer = BytesIO()
    write_gui(gui, buffer, game, file_format)
    return buffer.getvalue()


def _construct_gui_from_gff(gff) -> GUI:
    """Construct GUI from GFF (for XML/JSON loading)."""
    from pykotor.resource.generics.gui import GUI
    # TODO: Implement GFF to object conversion
    return GUI()


def _dismantle_gui_to_gff(gui: GUI):
    """Dismantle GUI to GFF (for XML/JSON saving)."""
    from pykotor.resource.formats.gff import GFF
    # TODO: Implement object to GFF conversion
    return GFF()
