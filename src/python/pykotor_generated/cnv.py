"""
BioWare CNV (Conversation) File Format data class.
Auto-generated from cnv.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class CNV(GenericBase):
    """CNV (Conversation) files are GFF-based format files that store conversation trees with entries, replies,
links, and conversation metadata. CNV files use the GFF (Generic File Format) binary structure
with file type signature "CNV ".

This format inherits the complete GFF structure from gff.ksy and adds CNV-specific
validation and documentation.

CNV files are used by Eclipse Engine games (Dragon Age Origins, Dragon Age 2, Mass Effect, Mass Effect 2).
They are similar to DLG files used by Odyssey and Aurora engines but adapted for Eclipse's conversation system.

CNV Root Struct Fields:
- NumWords (Int32): Word count for conversation
- Skippable (UInt8): Whether conversation can be skipped
- ConversationType (Int32): Conversation type identifier
- EntryList (List): NPC dialogue lines (CNVEntry structs)
- ReplyList (List): Player response options (CNVReply structs)
- StartingList (List): Entry points (CNVLink structs)
- StuntList (List): Special animations (CNVStunt structs)

Each Entry/Reply contains:
- Text (LocalizedString): Dialogue text
- Script (ResRef): Conditional/action scripts
- Camera settings, animations, links to other nodes

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-CNV.md
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md


    Auto-generated from cnv.ksy specification.
    """

    BINARY_TYPE = ResourceType.CNV

    def __init__(self):
        super().__init__()
        # TODO: Auto-generate fields from .ksy spec
        # Fields extracted from cnv.ksy types/seq sections
        pass
