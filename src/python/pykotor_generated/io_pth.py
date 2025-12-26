"""
Binary reader for BioWare PTH (Path/Pathfinding) File Format.
Auto-generated from pth.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class PTHBinaryReader(GFFBinaryReader):
    """Binary reader for PTH files."""

    def load(self, target: PTH) -> PTH:
        """Load PTH from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.pth import PTH as KaitaiPTH
        kaitai_obj = KaitaiPTH.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: PTH) -> PTH:
        """Convert Kaitai structure to PyKotor PTH object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare PTH (Path/Pathfinding) File Format.
Auto-generated from pth.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class PTHBinaryWriter(GFFBinaryWriter):
    """Binary writer for PTH files."""

    def write(self, pth: PTH) -> bytes:
        """Write PTH to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(pth)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, pth: PTH):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "PTH "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
