"""
BioWare JRL (Journal) File Format data class.
Auto-generated from jrl.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class JRL(GenericBase):
    """JRL (Journal) files store quest journal entries and categories.

This format inherits the complete GFF structure from gff.ksy.

JRL Root Struct Fields:
- Categories (List): Journal categories
- Each category contains quest entries with text, states, priorities

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-JRL.md


    Auto-generated from jrl.ksy specification.
    """

    BINARY_TYPE = ResourceType.JRL

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from jrl.ksy types/seq sections
        pass
