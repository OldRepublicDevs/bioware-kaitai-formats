/*
Binary reader for BioWare GUI (Graphical User Interface) File Format.
Auto-generated from gui.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.gui
{
    public class GUIBinaryReader : GFFBinaryReader
    {
        public GUI Load(GUI target)
        {
            // Parse using Kaitai Struct
            var kaitaiObj = new KaitaiGenerated.GUI(Data);

            // Convert to PyKotor object
            return KaitaiToPykotor(kaitaiObj, target);
        }

        private GUI KaitaiToPykotor(object kaitaiObj, GUI target)
        {
            // TODO: Implement field mapping from .ksy spec
            return target;
        }
    }
}


/*
Binary writer for BioWare GUI (Graphical User Interface) File Format.
Auto-generated from gui.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.gui
{
    public class GUIBinaryWriter : GFFBinaryWriter
    {
        public byte[] Write(GUI gui)
        {
            // Convert to GFF structure
            var gff = PykotorToGff(gui);

            // Write binary GFF
            return WriteGff(gff);
        }

        private object PykotorToGff(GUI gui)
        {
            // TODO: Implement field serialization from .ksy spec
            return null;
        }
    }
}
