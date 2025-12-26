"""
BioWare UTS (Sound Template) File Format data class.
Auto-generated from uts.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTS(GenericBase):
    """UTS (Sound Template) files define ambient sound sources and properties.

This format inherits the complete GFF structure from gff.ksy.

UTS Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Sound name
- Sounds (List): Sound file references
- Volume, MaxDistance, MinDistance: Audio properties
- Looping, Random, Positional: Sound behavior


    Auto-generated from uts.ksy specification.
    """

    BINARY_TYPE = ResourceType.UTS

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from uts.ksy types/seq sections
        pass
