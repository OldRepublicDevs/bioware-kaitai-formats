"""
BioWare UTP (Placeable Template) File Format data class.
Auto-generated from utp.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTP(GenericBase):
    """UTP (Placeable Template) files define placeable objects (containers, furniture, etc.).

This format inherits the complete GFF structure from gff.ksy.

UTP Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Placeable name
- Appearance (UInt32): Placeable appearance ID
- HasInventory, ItemList (List): Container contents
- Locked, KeyRequired, Trap: Security settings
- Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnHeartbeat, etc.


    Auto-generated from utp.ksy specification.
    """

    BINARY_TYPE = ResourceType.UTP

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from utp.ksy types/seq sections
        pass
