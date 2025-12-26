"""
BioWare GUI (Graphical User Interface) File Format data class.
Auto-generated from gui.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class GUI(GenericBase):
    """GUI (Graphical User Interface) files define UI layouts, controls, and properties.

This format inherits the complete GFF structure from gff.ksy.

GUI Root Struct Fields:
- CONTROLS (List): UI control elements (buttons, labels, listboxes, etc.)
- Each control contains:
  - CONTROLTYPE (Int32): Control type (button=4, label=5, listbox=9, etc.)
  - TAG (String): Control identifier
  - X, Y, WIDTH, HEIGHT (Int32): Position and size
  - TEXT (Struct): Text properties with STRREF, color, alignment
  - BORDER (Struct): Border properties
  - EXTENT (Struct): Dimensions
  - Various control-specific fields

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GUI.md


    Auto-generated from gui.ksy specification.
    """

    BINARY_TYPE = ResourceType.GUI

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from gui.ksy types/seq sections
        pass
