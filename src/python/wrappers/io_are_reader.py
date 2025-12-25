"""
Binary reader for Area (ARE) files.
Auto-generated from are.ksy
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.resource.formats.gff import GFFBinaryReader
from kaitai_generated.are import ARE as KaitaiARE

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES
    from pykotor.resource.generics.are import ARE


class AREBinaryReader(GFFBinaryReader):
    """
    Binary reader for ARE files using Kaitai Struct parser.
    
    This class wraps the Kaitai-generated parser and provides a PyKotor-compatible
    interface for reading ARE files.
    """
    
    def __init__(
        self,
        source: SOURCE_TYPES,
        offset: int = 0,
        size: int | None = None,
    ):
        """Initialize ARE binary reader.
        
        Args:
        ----
            source: Source to read from (bytes, file path, or file-like object)
            offset: Byte offset to start reading from
            size: Number of bytes to read (None = read all)
        """
        super().__init__(source, offset, size)
        self._kaitai_obj: KaitaiARE | None = None
    
    def load(self, target: ARE) -> ARE:
        """Load ARE data from source into target object.
        
        Args:
        ----
            target: ARE object to populate
            
        Returns:
        -------
            The populated ARE object
        """
        # Parse using Kaitai Struct
        self._kaitai_obj = KaitaiARE.from_bytes(self._data)
        
        # Convert Kaitai structure to PyKotor object
        return self._kaitai_to_pykotor(self._kaitai_obj, target)
    
    def _kaitai_to_pykotor(
        self,
        kaitai_obj: KaitaiARE,
        target: ARE,
    ) -> ARE:
        """Convert Kaitai structure to PyKotor ARE object.
        
        Args:
        ----
            kaitai_obj: Parsed Kaitai structure
            target: Target ARE object to populate
            
        Returns:
        -------
            Populated ARE object
        """
        # Access GFF data through Kaitai parser
        gff = kaitai_obj.gff_data
        root_struct = gff.struct_array.entries[0]
        
        # Extract fields from GFF structure
        # TODO: Auto-generate field extraction based on .ksy metadata
        
        return target
