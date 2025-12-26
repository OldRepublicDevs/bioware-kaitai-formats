"""
Binary reader for BioWare NFO (Module Info) File Format.
Auto-generated from nfo.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class NFOBinaryReader(GFFBinaryReader):
    """Binary reader for NFO files."""

    def load(self, target: NFO) -> NFO:
        """Load NFO from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.nfo import NFO as KaitaiNFO
        kaitai_obj = KaitaiNFO.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: NFO) -> NFO:
        """Convert Kaitai structure to PyKotor NFO object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare NFO (Module Info) File Format.
Auto-generated from nfo.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class NFOBinaryWriter(GFFBinaryWriter):
    """Binary writer for NFO files."""

    def write(self, nfo: NFO) -> bytes:
        """Write NFO to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(nfo)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, nfo: NFO):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "NFO "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
