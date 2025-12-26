"""
BioWare PT (Party Table) File Format data class.
Auto-generated from pt.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class PT(GenericBase):
    """PT (Party Table) files are GFF-based format files that store party and game state information
for Odyssey Engine games (KotOR and KotOR 2). PT files use the GFF (Generic File Format) binary
structure with file type signature "PT  ".

This format inherits the complete GFF structure from gff.ksy and adds PT-specific
validation and documentation.

PT files are typically named "PARTYTABLE.res" and are stored in savegame.sav ERF archives.
They contain comprehensive party and game state information including:
- Party composition (current members, available NPCs, leader)
- Resources (gold/credits, XP pool, components, chemicals)
- Journal entries with states, dates, and times
- Pazaak cards and side decks for the mini-game
- UI state (last panel, messages, tutorial windows shown)
- AI state (follow mode, AI enabled, solo mode)
- K2-specific: Influence values per companion

PT Root Struct Fields (Common):
- "PT_PCNAME" (String): Player character name
- "PT_GOLD" (Int32): Credits/gold amount
- "PT_XP_POOL" (Int32): Experience points
- "PT_PLAYEDSECONDS" (UInt32): Total playtime in seconds
- "PT_NUM_MEMBERS" (Int32): Party member count
- "PT_CONTROLLED_NPC", "PT_SOLOMODE", "PT_AISTATE", "PT_FOLLOWSTATE" (Int32): AI/party state
- "PT_MEMBERS" (List): Party member ResRefs and leader flags
- "PT_AVAIL_NPCS" (List): Available NPCs for recruitment
- "PT_INFLUENCE" (List): Influence values (KotOR 2 only)
- "PT_PAZAAKCARDS", "PT_PAZSIDELIST" (List): Pazaak card collections
- Journal/message lists: "PT_FB_MSG_LIST", "PT_DLG_MSG_LIST", "PT_COM_MSG_LIST"

Based on swkotor2.exe: SavePartyTable @ 0x0057bd70

References:
- https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/extract/savedata.py
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PT.md
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md


    Auto-generated from pt.ksy specification.
    """

    BINARY_TYPE = ResourceType.PT

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from pt.ksy types/seq sections
        pass
