/*
Binary reader for BioWare UTD (Door Template) File Format.
Auto-generated from utd.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.utd
{
    public class UTDBinaryReader : GFFBinaryReader
    {
        public UTD Load(UTD target)
        {
            // Parse using Kaitai Struct
            var kaitaiObj = new KaitaiGenerated.UTD(Data);

            // Convert to PyKotor object
            return KaitaiToPykotor(kaitaiObj, target);
        }

        private UTD KaitaiToPykotor(object kaitaiObj, UTD target)
        {
            // TODO: Implement field mapping from .ksy spec
            return target;
        }
    }
}


/*
Binary writer for BioWare UTD (Door Template) File Format.
Auto-generated from utd.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.utd
{
    public class UTDBinaryWriter : GFFBinaryWriter
    {
        public byte[] Write(UTD utd)
        {
            // Convert to GFF structure
            var gff = PykotorToGff(utd);

            // Write binary GFF
            return WriteGff(gff);
        }

        private object PykotorToGff(UTD utd)
        {
            // TODO: Implement field serialization from .ksy spec
            return null;
        }
    }
}
