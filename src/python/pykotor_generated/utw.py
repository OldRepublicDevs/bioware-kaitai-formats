"""
BioWare UTW (Waypoint Template) File Format data class.
Auto-generated from utw.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTW(GenericBase):
    """UTW (Waypoint Template) files define navigation waypoints and spawn points.

This format inherits the complete GFF structure from gff.ksy.

UTW Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Waypoint name
- Appearance (UInt32): Visual appearance (if visible)
- HasMapNote, MapNote (LocalizedString): Map markers
- LinkedTo (String): Connected waypoint tag


    Auto-generated from utw.ksy specification.
    """

    BINARY_TYPE = ResourceType.UTW

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from utw.ksy types/seq sections
        pass
