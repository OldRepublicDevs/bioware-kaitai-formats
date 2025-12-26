"""
Binary reader for BioWare ARE (Area) File Format.
Auto-generated from are.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class AREBinaryReader(GFFBinaryReader):
    """Binary reader for ARE files."""

    def load(self, target: ARE) -> ARE:
        """Load ARE from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.are import ARE as KaitaiARE
        kaitai_obj = KaitaiARE.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: ARE) -> ARE:
        """Convert Kaitai structure to PyKotor ARE object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare ARE (Area) File Format.
Auto-generated from are.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class AREBinaryWriter(GFFBinaryWriter):
    """Binary writer for ARE files."""

    def write(self, are: ARE) -> bytes:
        """Write ARE to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(are)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, are: ARE):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "ARE "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
