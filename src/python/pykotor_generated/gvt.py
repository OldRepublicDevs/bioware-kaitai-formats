"""
BioWare GVT (Global Variables Table) File Format data class.
Auto-generated from gvt.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class GVT(GenericBase):
    """GVT (Global Variables Table) files store global game variables.

This format inherits the complete GFF structure from gff.ksy.

GVT Root Struct Fields:
- ValNumber, ValBoolean, ValString lists for different variable types


    Auto-generated from gvt.ksy specification.
    """

    BINARY_TYPE = ResourceType.GVT

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from gvt.ksy types/seq sections
        pass
