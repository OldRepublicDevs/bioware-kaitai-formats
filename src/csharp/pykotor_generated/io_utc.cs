/*
Binary reader for BioWare UTC (Creature Template) File.
Auto-generated from utc.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.utc
{
    public class UTCBinaryReader : GFFBinaryReader
    {
        public UTC Load(UTC target)
        {
            // Parse using Kaitai Struct
            var kaitaiObj = new KaitaiGenerated.UTC(Data);

            // Convert to PyKotor object
            return KaitaiToPykotor(kaitaiObj, target);
        }

        private UTC KaitaiToPykotor(object kaitaiObj, UTC target)
        {
            // TODO: Implement field mapping from .ksy spec
            return target;
        }
    }
}


/*
Binary writer for BioWare UTC (Creature Template) File.
Auto-generated from utc.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.utc
{
    public class UTCBinaryWriter : GFFBinaryWriter
    {
        public byte[] Write(UTC utc)
        {
            // Convert to GFF structure
            var gff = PykotorToGff(utc);

            // Write binary GFF
            return WriteGff(gff);
        }

        private object PykotorToGff(UTC utc)
        {
            // TODO: Implement field serialization from .ksy spec
            return null;
        }
    }
}
