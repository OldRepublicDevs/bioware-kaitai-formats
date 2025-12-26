"""
Binary reader for BioWare UTM (Store/Merchant Template) File Format.
Auto-generated from utm.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTMBinaryReader(GFFBinaryReader):
    """Binary reader for UTM files."""

    def load(self, target: UTM) -> UTM:
        """Load UTM from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.utm import UTM as KaitaiUTM
        kaitai_obj = KaitaiUTM.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: UTM) -> UTM:
        """Convert Kaitai structure to PyKotor UTM object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare UTM (Store/Merchant Template) File Format.
Auto-generated from utm.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTMBinaryWriter(GFFBinaryWriter):
    """Binary writer for UTM files."""

    def write(self, utm: UTM) -> bytes:
        """Write UTM to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(utm)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, utm: UTM):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "UTM "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
