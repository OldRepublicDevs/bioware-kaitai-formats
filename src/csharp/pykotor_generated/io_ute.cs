/*
Binary reader for BioWare UTE (Encounter Template) File Format.
Auto-generated from ute.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.ute
{
    public class UTEBinaryReader : GFFBinaryReader
    {
        public UTE Load(UTE target)
        {
            // Parse using Kaitai Struct
            var kaitaiObj = new KaitaiGenerated.UTE(Data);

            // Convert to PyKotor object
            return KaitaiToPykotor(kaitaiObj, target);
        }

        private UTE KaitaiToPykotor(object kaitaiObj, UTE target)
        {
            // TODO: Implement field mapping from .ksy spec
            return target;
        }
    }
}


/*
Binary writer for BioWare UTE (Encounter Template) File Format.
Auto-generated from ute.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.ute
{
    public class UTEBinaryWriter : GFFBinaryWriter
    {
        public byte[] Write(UTE ute)
        {
            // Convert to GFF structure
            var gff = PykotorToGff(ute);

            // Write binary GFF
            return WriteGff(gff);
        }

        private object PykotorToGff(UTE ute)
        {
            // TODO: Implement field serialization from .ksy spec
            return null;
        }
    }
}
