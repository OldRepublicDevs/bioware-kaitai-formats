"""
BioWare FAC (Faction) File Format data class.
Auto-generated from fac.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class FAC(GenericBase):
    """FAC (Faction) files are GFF-based format files that store faction relationships,
reputation values, and faction metadata.

This format inherits the complete GFF structure from gff.ksy and adds FAC-specific
validation and documentation.

FAC Root Struct Fields:
- FactionName (String): Faction identifier
- FactionParentID (UInt16): Parent faction ID
- FactionGlobal (UInt16): Global faction flag
- RepList (List): Reputation values with other factions
  - FactionID (UInt32): Target faction ID
  - FactionRep (UInt32): Reputation value (0-100)

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-FAC.md
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
- https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/fac.py


    Auto-generated from fac.ksy specification.
    """

    BINARY_TYPE = ResourceType.FAC

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from fac.ksy types/seq sections
        pass
