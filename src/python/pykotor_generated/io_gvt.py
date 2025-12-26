"""
Binary reader for BioWare GVT (Global Variables Table) File Format.
Auto-generated from gvt.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class GVTBinaryReader(GFFBinaryReader):
    """Binary reader for GVT files."""

    def load(self, target: GVT) -> GVT:
        """Load GVT from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.gvt import GVT as KaitaiGVT
        kaitai_obj = KaitaiGVT.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: GVT) -> GVT:
        """Convert Kaitai structure to PyKotor GVT object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare GVT (Global Variables Table) File Format.
Auto-generated from gvt.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class GVTBinaryWriter(GFFBinaryWriter):
    """Binary writer for GVT files."""

    def write(self, gvt: GVT) -> bytes:
        """Write GVT to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(gvt)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, gvt: GVT):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "GVT "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
