"""
Binary reader for BioWare CNV (Conversation) File Format.
Auto-generated from cnv.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class CNVBinaryReader(GFFBinaryReader):
    """Binary reader for CNV files."""

    def load(self, target: CNV) -> CNV:
        """Load CNV from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.cnv import CNV as KaitaiCNV
        kaitai_obj = KaitaiCNV.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: CNV) -> CNV:
        """Convert Kaitai structure to PyKotor CNV object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare CNV (Conversation) File Format.
Auto-generated from cnv.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class CNVBinaryWriter(GFFBinaryWriter):
    """Binary writer for CNV files."""

    def write(self, cnv: CNV) -> bytes:
        """Write CNV to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(cnv)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, cnv: CNV):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "CNV "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
