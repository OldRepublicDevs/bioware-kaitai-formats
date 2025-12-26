/*
Binary reader for BioWare UTW (Waypoint Template) File Format.
Auto-generated from utw.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.utw
{
    public class UTWBinaryReader : GFFBinaryReader
    {
        public UTW Load(UTW target)
        {
            // Parse using Kaitai Struct
            var kaitaiObj = new KaitaiGenerated.UTW(Data);

            // Convert to PyKotor object
            return KaitaiToPykotor(kaitaiObj, target);
        }

        private UTW KaitaiToPykotor(object kaitaiObj, UTW target)
        {
            // TODO: Implement field mapping from .ksy spec
            return target;
        }
    }
}


/*
Binary writer for BioWare UTW (Waypoint Template) File Format.
Auto-generated from utw.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.utw
{
    public class UTWBinaryWriter : GFFBinaryWriter
    {
        public byte[] Write(UTW utw)
        {
            // Convert to GFF structure
            var gff = PykotorToGff(utw);

            // Write binary GFF
            return WriteGff(gff);
        }

        private object PykotorToGff(UTW utw)
        {
            // TODO: Implement field serialization from .ksy spec
            return null;
        }
    }
}
