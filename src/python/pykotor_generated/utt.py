"""
BioWare UTT (Trigger Template) File Format data class.
Auto-generated from utt.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTT(GenericBase):
    """UTT (Trigger Template) files define trigger zones and their properties.

This format inherits the complete GFF structure from gff.ksy.

UTT Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Trigger name
- Geometry (List): Trigger zone vertices
- TriggerType, Cursor, Faction: Trigger behavior
- Script hooks: OnClick, OnDisarm, OnHeartbeat, OnTrapTriggered, OnUserDefined


    Auto-generated from utt.ksy specification.
    """

    BINARY_TYPE = ResourceType.UTT

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from utt.ksy types/seq sections
        pass
