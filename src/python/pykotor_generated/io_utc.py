"""
Binary reader for BioWare UTC (Creature Template) File.
Auto-generated from utc.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTCBinaryReader(GFFBinaryReader):
    """Binary reader for UTC files."""

    def load(self, target: UTC) -> UTC:
        """Load UTC from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.utc import UTC as KaitaiUTC
        kaitai_obj = KaitaiUTC.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: UTC) -> UTC:
        """Convert Kaitai structure to PyKotor UTC object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare UTC (Creature Template) File.
Auto-generated from utc.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTCBinaryWriter(GFFBinaryWriter):
    """Binary writer for UTC files."""

    def write(self, utc: UTC) -> bytes:
        """Write UTC to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(utc)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, utc: UTC):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "UTC "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
