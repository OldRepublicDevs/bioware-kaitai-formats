/*
Binary reader for BioWare UTP (Placeable Template) File Format.
Auto-generated from utp.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.utp
{
    public class UTPBinaryReader : GFFBinaryReader
    {
        public UTP Load(UTP target)
        {
            // Parse using Kaitai Struct
            var kaitaiObj = new KaitaiGenerated.UTP(Data);

            // Convert to PyKotor object
            return KaitaiToPykotor(kaitaiObj, target);
        }

        private UTP KaitaiToPykotor(object kaitaiObj, UTP target)
        {
            // TODO: Implement field mapping from .ksy spec
            return target;
        }
    }
}


/*
Binary writer for BioWare UTP (Placeable Template) File Format.
Auto-generated from utp.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.utp
{
    public class UTPBinaryWriter : GFFBinaryWriter
    {
        public byte[] Write(UTP utp)
        {
            // Convert to GFF structure
            var gff = PykotorToGff(utp);

            // Write binary GFF
            return WriteGff(gff);
        }

        private object PykotorToGff(UTP utp)
        {
            // TODO: Implement field serialization from .ksy spec
            return null;
        }
    }
}
