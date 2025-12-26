"""
BioWare UTE (Encounter Template) File Format data class.
Auto-generated from ute.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTE(GenericBase):
    """UTE (Encounter Template) files define spawn encounters with creature lists and probabilities.

This format inherits the complete GFF structure from gff.ksy.

UTE Root Struct Fields:
- TemplateResRef (ResRef): Blueprint identifier
- Tag (String): Instance identifier
- LocalizedName (LocalizedString): Encounter name
- CreatureList (List): Creatures to spawn with probabilities
- Difficulty, MaxCreatures, RecCreatures, SpawnOption: Spawn behavior
- Script hooks: OnEntered, OnExhausted, OnExit, OnHeartbeat, OnUserDefined


    Auto-generated from ute.ksy specification.
    """

    BINARY_TYPE = ResourceType.UTE

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from ute.ksy types/seq sections
        pass
