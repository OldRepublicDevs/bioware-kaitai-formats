"""
Binary reader for BioWare UTS (Sound Template) File Format.
Auto-generated from uts.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTSBinaryReader(GFFBinaryReader):
    """Binary reader for UTS files."""

    def load(self, target: UTS) -> UTS:
        """Load UTS from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.uts import UTS as KaitaiUTS
        kaitai_obj = KaitaiUTS.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: UTS) -> UTS:
        """Convert Kaitai structure to PyKotor UTS object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare UTS (Sound Template) File Format.
Auto-generated from uts.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTSBinaryWriter(GFFBinaryWriter):
    """Binary writer for UTS files."""

    def write(self, uts: UTS) -> bytes:
        """Write UTS to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(uts)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, uts: UTS):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "UTS "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
