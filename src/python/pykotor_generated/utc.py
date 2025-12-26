"""
BioWare UTC (Creature Template) File data class.
Auto-generated from utc.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTC(GenericBase):
    """UTC (Creature Template) files are GFF-based format files that store creature definitions
including stats, appearance, inventory, feats, and script hooks. UTC files are used to
define NPCs, party members, enemies, and the player character in Knights of the Old Republic.

This format inherits the complete GFF structure from gff.ksy and adds UTC-specific
validation and documentation.

UTC Root Struct Fields (Common):
- "TemplateResRef" (ResRef): Blueprint identifier
- "Tag" (String): Unique instance identifier
- "FirstName", "LastName" (LocalizedString): Creature name
- "Appearance_Type" (UInt32): Appearance ID (appearance.2da)
- "PortraitId" (UInt16): Portrait index (portraits.2da)
- "Gender", "Race" (UInt8/UInt16): Character attributes
- "Str", "Dex", "Con", "Int", "Wis", "Cha" (UInt8): Ability scores
- "HitPoints", "MaxHitPoints", "ForcePoints" (Int16): Health/Force stats
- "ClassList" (List): Character classes with levels
- "FeatList" (List): Known feats
- "SkillList" (List): Skill ranks
- "ItemList" (List): Inventory items
- "Equip_ItemList" (List): Equipped items with slots
- Script hooks: "ScriptAttacked", "ScriptDamaged", "ScriptDeath", etc. (ResRef)

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTC.md
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
- https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utc.py
- https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/utc.cpp


    Auto-generated from utc.ksy specification.
    """

    BINARY_TYPE = ResourceType.UTC

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from utc.ksy types/seq sections
        pass
