/*
Binary reader for BioWare ARE (Area) File Format.
Auto-generated from are.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.are
{
    public class AREBinaryReader : GFFBinaryReader
    {
        public ARE Load(ARE target)
        {
            // Parse using Kaitai Struct
            var kaitaiObj = new KaitaiGenerated.ARE(Data);

            // Convert to PyKotor object
            return KaitaiToPykotor(kaitaiObj, target);
        }

        private ARE KaitaiToPykotor(object kaitaiObj, ARE target)
        {
            // TODO: Implement field mapping from .ksy spec
            return target;
        }
    }
}


/*
Binary writer for BioWare ARE (Area) File Format.
Auto-generated from are.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.are
{
    public class AREBinaryWriter : GFFBinaryWriter
    {
        public byte[] Write(ARE are)
        {
            // Convert to GFF structure
            var gff = PykotorToGff(are);

            // Write binary GFF
            return WriteGff(gff);
        }

        private object PykotorToGff(ARE are)
        {
            // TODO: Implement field serialization from .ksy spec
            return null;
        }
    }
}
