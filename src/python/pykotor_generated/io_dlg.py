"""
Binary reader for BioWare DLG (Dialogue) File Format.
Auto-generated from dlg.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class DLGBinaryReader(GFFBinaryReader):
    """Binary reader for DLG files."""

    def load(self, target: DLG) -> DLG:
        """Load DLG from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.dlg import DLG as KaitaiDLG
        kaitai_obj = KaitaiDLG.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: DLG) -> DLG:
        """Convert Kaitai structure to PyKotor DLG object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare DLG (Dialogue) File Format.
Auto-generated from dlg.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class DLGBinaryWriter(GFFBinaryWriter):
    """Binary writer for DLG files."""

    def write(self, dlg: DLG) -> bytes:
        """Write DLG to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(dlg)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, dlg: DLG):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "DLG "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
