"""
Binary reader for BioWare UTW (Waypoint Template) File Format.
Auto-generated from utw.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTWBinaryReader(GFFBinaryReader):
    """Binary reader for UTW files."""

    def load(self, target: UTW) -> UTW:
        """Load UTW from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.utw import UTW as KaitaiUTW
        kaitai_obj = KaitaiUTW.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: UTW) -> UTW:
        """Convert Kaitai structure to PyKotor UTW object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare UTW (Waypoint Template) File Format.
Auto-generated from utw.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTWBinaryWriter(GFFBinaryWriter):
    """Binary writer for UTW files."""

    def write(self, utw: UTW) -> bytes:
        """Write UTW to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(utw)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, utw: UTW):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "UTW "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
