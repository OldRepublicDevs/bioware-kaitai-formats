"""
Binary reader for BioWare UTP (Placeable Template) File Format.
Auto-generated from utp.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTPBinaryReader(GFFBinaryReader):
    """Binary reader for UTP files."""

    def load(self, target: UTP) -> UTP:
        """Load UTP from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.utp import UTP as KaitaiUTP
        kaitai_obj = KaitaiUTP.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: UTP) -> UTP:
        """Convert Kaitai structure to PyKotor UTP object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare UTP (Placeable Template) File Format.
Auto-generated from utp.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTPBinaryWriter(GFFBinaryWriter):
    """Binary writer for UTP files."""

    def write(self, utp: UTP) -> bytes:
        """Write UTP to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(utp)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, utp: UTP):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "UTP "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
