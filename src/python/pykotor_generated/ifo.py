"""
BioWare IFO (Module Information) File Format data class.
Auto-generated from ifo.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class IFO(GenericBase):
    """IFO (Module Information) files store module metadata including entry points,
starting locations, and module properties.

This format inherits the complete GFF structure from gff.ksy.

IFO Root Struct Fields:
- Mod_ID (ResRef): Module identifier
- Mod_Name (LocalizedString): Module display name
- Mod_Entry_Area (ResRef): Starting area
- Mod_Entry_X, Mod_Entry_Y, Mod_Entry_Z (Float): Starting position
- Mod_Entry_Dir_X, Mod_Entry_Dir_Y (Float): Starting orientation
- Mod_OnHeartbeat, Mod_OnModLoad, Mod_OnModStart (ResRef): Script hooks
- Mod_MinGameVer (String): Minimum game version required

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-IFO.md


    Auto-generated from ifo.ksy specification.
    """

    BINARY_TYPE = ResourceType.IFO

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from ifo.ksy types/seq sections
        pass
