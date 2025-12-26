"""
BioWare DLG (Dialogue) File Format data class.
Auto-generated from dlg.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class DLG(GenericBase):
    """DLG (Dialogue) files are GFF-based format files that store conversation trees with entries, replies,
links, and conversation metadata for Odyssey and Aurora engines.

This format inherits the complete GFF structure from gff.ksy and adds DLG-specific
validation and documentation.

DLG files contain:
- Root struct with conversation metadata (NumWords, Skippable, ConversationType, etc.)
- EntryList: Array of dialogue entries (NPC lines)
- ReplyList: Array of reply options (player responses)
- StartingList: Array of entry points into conversation tree
- StuntList: Array of cutscene/animation sequences

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-DLG.md
- https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/dlg/


    Auto-generated from dlg.ksy specification.
    """

    BINARY_TYPE = ResourceType.DLG

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from dlg.ksy types/seq sections
        pass
