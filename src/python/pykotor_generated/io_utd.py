"""
Binary reader for BioWare UTD (Door Template) File Format.
Auto-generated from utd.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTDBinaryReader(GFFBinaryReader):
    """Binary reader for UTD files."""

    def load(self, target: UTD) -> UTD:
        """Load UTD from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.utd import UTD as KaitaiUTD
        kaitai_obj = KaitaiUTD.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: UTD) -> UTD:
        """Convert Kaitai structure to PyKotor UTD object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare UTD (Door Template) File Format.
Auto-generated from utd.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTDBinaryWriter(GFFBinaryWriter):
    """Binary writer for UTD files."""

    def write(self, utd: UTD) -> bytes:
        """Write UTD to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(utd)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, utd: UTD):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "UTD "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
