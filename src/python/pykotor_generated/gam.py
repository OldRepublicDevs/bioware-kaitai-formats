"""
BioWare GAM (Game State) File Format data class.
Auto-generated from gam.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class GAM(GenericBase):
    """GAM (Game State) files are GFF-based format files that store game state information
including party members, global variables, game time, and time played.

This format inherits the complete GFF structure from gff.ksy and adds GAM-specific
validation and documentation.

GAM files are used by:
- Aurora Engine (Neverwinter Nights, Neverwinter Nights 2)
- Infinity Engine (Mass Effect, Dragon Age Origins, Dragon Age 2)

NOTE: Odyssey Engine (Knights of the Old Republic) does NOT use GAM format -
it uses NFO format for save games instead.

GAM Root Struct Fields:
- GameTimeHour, GameTimeMinute, GameTimeSecond, GameTimeMillisecond (Int32): Game time
- TimePlayed (Int32): Total playtime in seconds
- PartyList (List): Party member ResRefs
- GlobalBooleans, GlobalNumbers, GlobalStrings (Lists): Global variable storage

Aurora-specific: ModuleName, CurrentArea, PlayerCharacter
Infinity-specific: GameName, Chapter, JournalEntries

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GAM.md
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md


    Auto-generated from gam.ksy specification.
    """

    BINARY_TYPE = ResourceType.GAM

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from gam.ksy types/seq sections
        pass
