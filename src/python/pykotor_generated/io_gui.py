"""
Binary reader for BioWare GUI (Graphical User Interface) File Format.
Auto-generated from gui.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class GUIBinaryReader(GFFBinaryReader):
    """Binary reader for GUI files."""

    def load(self, target: GUI) -> GUI:
        """Load GUI from binary data.

        Uses Kaitai-generated parser internally, converts to PyKotor objects.
        """
        # Parse using Kaitai Struct
        from kaitai_generated.gui import GUI as KaitaiGUI
        kaitai_obj = KaitaiGUI.from_bytes(self._data)

        # Convert to PyKotor object
        return self._kaitai_to_pykotor(kaitai_obj, target)

    def _kaitai_to_pykotor(self, kaitai_obj, target: GUI) -> GUI:
        """Convert Kaitai structure to PyKotor GUI object."""
        # TODO: Implement field mapping from .ksy spec
        return target


"""
Binary writer for BioWare GUI (Graphical User Interface) File Format.
Auto-generated from gui.ksy for PyKotor compatibility
"""

from pykotor.resource.generics.base import GenericBase
from pykotor.resource.type import ResourceType
from pykotor.resource.formats.gff import GFFBinaryReader, GFFBinaryWriter

class GUIBinaryWriter(GFFBinaryWriter):
    """Binary writer for GUI files."""

    def write(self, gui: GUI) -> bytes:
        """Write GUI to binary format.

        Converts PyKotor object to GFF structure and serializes.
        """
        # Convert to GFF structure
        gff = self._pykotor_to_gff(gui)

        # Write binary GFF
        return self._write_gff(gff)

    def _pykotor_to_gff(self, gui: GUI):
        """Convert PyKotor object to GFF structure."""
        from pykotor.resource.formats.gff import GFF, GFFStruct

        gff = GFF()
        gff.file_type = "GUI "
        gff.file_version = "V3.2"

        # TODO: Implement field serialization from .ksy spec
        return gff
