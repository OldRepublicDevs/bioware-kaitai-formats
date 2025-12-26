/*
Binary reader for BioWare UTI (Item Template) File Format.
Auto-generated from uti.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.uti
{
    public class UTIBinaryReader : GFFBinaryReader
    {
        public UTI Load(UTI target)
        {
            // Parse using Kaitai Struct
            var kaitaiObj = new KaitaiGenerated.UTI(Data);

            // Convert to PyKotor object
            return KaitaiToPykotor(kaitaiObj, target);
        }

        private UTI KaitaiToPykotor(object kaitaiObj, UTI target)
        {
            // TODO: Implement field mapping from .ksy spec
            return target;
        }
    }
}


/*
Binary writer for BioWare UTI (Item Template) File Format.
Auto-generated from uti.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.uti
{
    public class UTIBinaryWriter : GFFBinaryWriter
    {
        public byte[] Write(UTI uti)
        {
            // Convert to GFF structure
            var gff = PykotorToGff(uti);

            // Write binary GFF
            return WriteGff(gff);
        }

        private object PykotorToGff(UTI uti)
        {
            // TODO: Implement field serialization from .ksy spec
            return null;
        }
    }
}
