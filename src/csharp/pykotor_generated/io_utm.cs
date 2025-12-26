/*
Binary reader for BioWare UTM (Store/Merchant Template) File Format.
Auto-generated from utm.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.utm
{
    public class UTMBinaryReader : GFFBinaryReader
    {
        public UTM Load(UTM target)
        {
            // Parse using Kaitai Struct
            var kaitaiObj = new KaitaiGenerated.UTM(Data);

            // Convert to PyKotor object
            return KaitaiToPykotor(kaitaiObj, target);
        }

        private UTM KaitaiToPykotor(object kaitaiObj, UTM target)
        {
            // TODO: Implement field mapping from .ksy spec
            return target;
        }
    }
}


/*
Binary writer for BioWare UTM (Store/Merchant Template) File Format.
Auto-generated from utm.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.utm
{
    public class UTMBinaryWriter : GFFBinaryWriter
    {
        public byte[] Write(UTM utm)
        {
            // Convert to GFF structure
            var gff = PykotorToGff(utm);

            // Write binary GFF
            return WriteGff(gff);
        }

        private object PykotorToGff(UTM utm)
        {
            // TODO: Implement field serialization from .ksy spec
            return null;
        }
    }
}
