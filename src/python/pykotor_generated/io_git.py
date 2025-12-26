"""
Binary reader for BioWare GIT (Game Instance Template) File Format.
Auto-generated from git.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class GITBinaryReader(GFFBinaryReader):
    """Binary reader for GIT files."""

    def load(self, target: GIT) -> GIT:
        """Load GIT from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.git import GIT as KaitaiGIT
        kaitai_obj = KaitaiGIT.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: GIT) -> GIT:
        """Convert Kaitai structure to PyKotor GIT object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare GIT (Game Instance Template) File Format.
Auto-generated from git.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class GITBinaryWriter(GFFBinaryWriter):
    """Binary writer for GIT files."""

    def write(self, git: GIT) -> bytes:
        """Write GIT to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(git)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, git: GIT):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "GIT "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
