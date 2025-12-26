"""
Binary reader for BioWare UTI (Item Template) File Format.
Auto-generated from uti.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTIBinaryReader(GFFBinaryReader):
    """Binary reader for UTI files."""

    def load(self, target: UTI) -> UTI:
        """Load UTI from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.uti import UTI as KaitaiUTI
        kaitai_obj = KaitaiUTI.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: UTI) -> UTI:
        """Convert Kaitai structure to PyKotor UTI object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare UTI (Item Template) File Format.
Auto-generated from uti.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTIBinaryWriter(GFFBinaryWriter):
    """Binary writer for UTI files."""

    def write(self, uti: UTI) -> bytes:
        """Write UTI to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(uti)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, uti: UTI):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "UTI "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
