/*
Binary reader for BioWare UTS (Sound Template) File Format.
Auto-generated from uts.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.uts
{
    public class UTSBinaryReader : GFFBinaryReader
    {
        public UTS Load(UTS target)
        {
            // Parse using Kaitai Struct
            var kaitaiObj = new KaitaiGenerated.UTS(Data);

            // Convert to PyKotor object
            return KaitaiToPykotor(kaitaiObj, target);
        }

        private UTS KaitaiToPykotor(object kaitaiObj, UTS target)
        {
            // TODO: Implement field mapping from .ksy spec
            return target;
        }
    }
}


/*
Binary writer for BioWare UTS (Sound Template) File Format.
Auto-generated from uts.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.uts
{
    public class UTSBinaryWriter : GFFBinaryWriter
    {
        public byte[] Write(UTS uts)
        {
            // Convert to GFF structure
            var gff = PykotorToGff(uts);

            // Write binary GFF
            return WriteGff(gff);
        }

        private object PykotorToGff(UTS uts)
        {
            // TODO: Implement field serialization from .ksy spec
            return null;
        }
    }
}
