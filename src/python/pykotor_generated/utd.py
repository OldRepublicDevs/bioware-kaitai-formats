"""
BioWare UTD (Door Template) File Format data class.
Auto-generated from utd.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTD(GenericBase):
    """UTD (Door Template) files define door properties, scripts, and behavior.

This format inherits the complete GFF structure from gff.ksy.

UTD Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Door name
- Appearance (UInt32): Door appearance ID
- Locked, KeyRequired, Trap, Faction (various): Door state/behavior
- Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnFailToOpen, etc.


    Auto-generated from utd.ksy specification.
    """

    BINARY_TYPE = ResourceType.UTD

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from utd.ksy types/seq sections
        pass
