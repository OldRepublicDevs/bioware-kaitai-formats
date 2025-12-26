"""
Binary reader for BioWare FAC (Faction) File Format.
Auto-generated from fac.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class FACBinaryReader(GFFBinaryReader):
    """Binary reader for FAC files."""

    def load(self, target: FAC) -> FAC:
        """Load FAC from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.fac import FAC as KaitaiFAC
        kaitai_obj = KaitaiFAC.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: FAC) -> FAC:
        """Convert Kaitai structure to PyKotor FAC object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare FAC (Faction) File Format.
Auto-generated from fac.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class FACBinaryWriter(GFFBinaryWriter):
    """Binary writer for FAC files."""

    def write(self, fac: FAC) -> bytes:
        """Write FAC to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(fac)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, fac: FAC):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "FAC "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
