"""
Binary reader for BioWare UTT (Trigger Template) File Format.
Auto-generated from utt.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTTBinaryReader(GFFBinaryReader):
    """Binary reader for UTT files."""

    def load(self, target: UTT) -> UTT:
        """Load UTT from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.utt import UTT as KaitaiUTT
        kaitai_obj = KaitaiUTT.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: UTT) -> UTT:
        """Convert Kaitai structure to PyKotor UTT object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare UTT (Trigger Template) File Format.
Auto-generated from utt.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class UTTBinaryWriter(GFFBinaryWriter):
    """Binary writer for UTT files."""

    def write(self, utt: UTT) -> bytes:
        """Write UTT to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(utt)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, utt: UTT):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "UTT "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
