/*
Binary reader for BioWare CNV (Conversation) File Format.
Auto-generated from cnv.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.cnv
{
    public class CNVBinaryReader : GFFBinaryReader
    {
        public CNV Load(CNV target)
        {
            // Parse using Kaitai Struct
            var kaitaiObj = new KaitaiGenerated.CNV(Data);

            // Convert to PyKotor object
            return KaitaiToPykotor(kaitaiObj, target);
        }

        private CNV KaitaiToPykotor(object kaitaiObj, CNV target)
        {
            // TODO: Implement field mapping from .ksy spec
            return target;
        }
    }
}


/*
Binary writer for BioWare CNV (Conversation) File Format.
Auto-generated from cnv.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.cnv
{
    public class CNVBinaryWriter : GFFBinaryWriter
    {
        public byte[] Write(CNV cnv)
        {
            // Convert to GFF structure
            var gff = PykotorToGff(cnv);

            // Write binary GFF
            return WriteGff(gff);
        }

        private object PykotorToGff(CNV cnv)
        {
            // TODO: Implement field serialization from .ksy spec
            return null;
        }
    }
}
