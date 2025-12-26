"""
BioWare NFO (Module Info) File Format data class.
Auto-generated from nfo.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class NFO(GenericBase):
    """NFO (Module Info) files store save game module information for KotOR.

This format inherits the complete GFF structure from gff.ksy.

Note: This is different from IFO files. NFO is used in save games,
while IFO is used in module definitions.


    Auto-generated from nfo.ksy specification.
    """

    BINARY_TYPE = ResourceType.NFO

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from nfo.ksy types/seq sections
        pass
