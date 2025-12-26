"""
Binary reader for BioWare GAM (Game State) File Format.
Auto-generated from gam.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class GAMBinaryReader(GFFBinaryReader):
    """Binary reader for GAM files."""

    def load(self, target: GAM) -> GAM:
        """Load GAM from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.gam import GAM as KaitaiGAM
        kaitai_obj = KaitaiGAM.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: GAM) -> GAM:
        """Convert Kaitai structure to PyKotor GAM object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare GAM (Game State) File Format.
Auto-generated from gam.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class GAMBinaryWriter(GFFBinaryWriter):
    """Binary writer for GAM files."""

    def write(self, gam: GAM) -> bytes:
        """Write GAM to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(gam)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, gam: GAM):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "GAM "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
