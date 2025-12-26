"""
Binary reader for BioWare PT (Party Table) File Format.
Auto-generated from pt.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class PTBinaryReader(GFFBinaryReader):
    """Binary reader for PT files."""

    def load(self, target: PT) -> PT:
        """Load PT from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.pt import PT as KaitaiPT
        kaitai_obj = KaitaiPT.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: PT) -> PT:
        """Convert Kaitai structure to PyKotor PT object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare PT (Party Table) File Format.
Auto-generated from pt.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class PTBinaryWriter(GFFBinaryWriter):
    """Binary writer for PT files."""

    def write(self, pt: PT) -> bytes:
        """Write PT to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(pt)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, pt: PT):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "PT "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
