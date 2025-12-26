/*
Binary reader for BioWare GAM (Game State) File Format.
Auto-generated from gam.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.gam
{
    public class GAMBinaryReader : GFFBinaryReader
    {
        public GAM Load(GAM target)
        {
            // Parse using Kaitai Struct
            var kaitaiObj = new KaitaiGenerated.GAM(Data);

            // Convert to PyKotor object
            return KaitaiToPykotor(kaitaiObj, target);
        }

        private GAM KaitaiToPykotor(object kaitaiObj, GAM target)
        {
            // TODO: Implement field mapping from .ksy spec
            return target;
        }
    }
}


/*
Binary writer for BioWare GAM (Game State) File Format.
Auto-generated from gam.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.gam
{
    public class GAMBinaryWriter : GFFBinaryWriter
    {
        public byte[] Write(GAM gam)
        {
            // Convert to GFF structure
            var gff = PykotorToGff(gam);

            // Write binary GFF
            return WriteGff(gff);
        }

        private object PykotorToGff(GAM gam)
        {
            // TODO: Implement field serialization from .ksy spec
            return null;
        }
    }
}
