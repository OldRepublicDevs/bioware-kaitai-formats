"""
Binary reader for BioWare IFO (Module Information) File Format.
Auto-generated from ifo.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class IFOBinaryReader(GFFBinaryReader):
    """Binary reader for IFO files."""

    def load(self, target: IFO) -> IFO:
        """Load IFO from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.ifo import IFO as KaitaiIFO
        kaitai_obj = KaitaiIFO.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: IFO) -> IFO:
        """Convert Kaitai structure to PyKotor IFO object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare IFO (Module Information) File Format.
Auto-generated from ifo.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class IFOBinaryWriter(GFFBinaryWriter):
    """Binary writer for IFO files."""

    def write(self, ifo: IFO) -> bytes:
        """Write IFO to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(ifo)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, ifo: IFO):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "IFO "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
