"""
BioWare GIT (Game Instance Template) File Format data class.
Auto-generated from git.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class GIT(GenericBase):
    """GIT (Game Instance Template) files store dynamic area instance data including
placed creatures, placeables, doors, triggers, waypoints, sounds, stores, and encounters.

This format inherits the complete GFF structure from gff.ksy.

GIT Root Struct Fields:
- CreatureList (List): Placed creatures with positions, orientations
- DoorList (List): Placed doors with states, scripts
- PlaceableList (List): Placed placeables (chests, etc.)
- TriggerList (List): Trigger zones
- WaypointList (List): Navigation waypoints
- SoundList (List): Ambient sounds
- StoreList (List): Merchant shops
- EncounterList (List): Spawn encounters
- CameraList (List): Camera points

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GIT.md


    Auto-generated from git.ksy specification.
    """

    BINARY_TYPE = ResourceType.GIT

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from git.ksy types/seq sections
        pass
