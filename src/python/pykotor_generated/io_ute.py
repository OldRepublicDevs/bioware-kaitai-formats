"""
Binary reader for BioWare UTE (Encounter Template) File Format.
Auto-generated from ute.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTEBinaryReader(GFFBinaryReader):
    """Binary reader for UTE files."""

    def load(self, target: UTE) -> UTE:
        """Load UTE from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.ute import UTE as KaitaiUTE
        kaitai_obj = KaitaiUTE.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: UTE) -> UTE:
        """Convert Kaitai structure to PyKotor UTE object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare UTE (Encounter Template) File Format.
Auto-generated from ute.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTEBinaryWriter(GFFBinaryWriter):
    """Binary writer for UTE files."""

    def write(self, ute: UTE) -> bytes:
        """Write UTE to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(ute)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, ute: UTE):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "UTE "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
