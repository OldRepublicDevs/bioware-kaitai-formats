"""
Binary writer for Area (ARE) files.
Auto-generated from are.ksy
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.resource.formats.gff import GFFBinaryWriter

if TYPE_CHECKING:
    from pykotor.resource.type import TARGET_TYPES
    from pykotor.resource.generics.are import ARE


class AREBinaryWriter(GFFBinaryWriter):
    """
    Binary writer for ARE files.
    
    This class provides PyKotor-compatible interface for writing ARE files
    to binary format.
    """
    
    def __init__(
        self,
        target: TARGET_TYPES,
        file_type: str = "ARE ",
        file_version: str = "V3.2",
    ):
        """Initialize ARE binary writer.
        
        Args:
        ----
            target: Target to write to (file path or file-like object)
            file_type: GFF file type signature (default: "ARE ")
            file_version: GFF version (default: "V3.2")
        """
        super().__init__(target, file_type, file_version)
    
    def write(self, are: ARE) -> bytes:
        """Write ARE object to binary format.
        
        Args:
        ----
            are: ARE object to write
            
        Returns:
        -------
            Binary data as bytes
        """
        # Convert PyKotor object to GFF structure
        gff = self._pykotor_to_gff(are)
        
        # Write GFF to binary
        return self._write_gff(gff)
    
    def _pykotor_to_gff(self, are: ARE) -> GFF:
        """Convert PyKotor ARE object to GFF structure.
        
        Args:
        ----
            are: ARE object to convert
            
        Returns:
        -------
            GFF structure
        """
        from pykotor.resource.formats.gff import GFF, GFFStruct
        
        gff = GFF()
        gff.file_type = "ARE "
        gff.file_version = "V3.2"
        
        root = GFFStruct()
        
        # TODO: Auto-generate field serialization based on .ksy metadata
        
        gff.root = root
        return gff
