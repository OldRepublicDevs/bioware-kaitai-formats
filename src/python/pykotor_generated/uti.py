"""
BioWare UTI (Item Template) File Format data class.
Auto-generated from uti.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTI(GenericBase):
    """UTI (Item Template) files define item properties, stats, and behavior.

This format inherits the complete GFF structure from gff.ksy.

UTI Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Item name
- Description (LocalizedString): Item description
- BaseItem (Int32): Base item type (baseitems.2da)
- Cost, StackSize, Charges: Item economics
- ModelVariation, TextureVar, BodyVariation: Item appearance
- PropertiesList (List): Item properties (damage, attack bonus, etc.)


    Auto-generated from uti.ksy specification.
    """

    BINARY_TYPE = ResourceType.UTI

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from uti.ksy types/seq sections
        pass
