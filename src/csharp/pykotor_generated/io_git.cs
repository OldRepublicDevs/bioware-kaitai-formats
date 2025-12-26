/*
Binary reader for BioWare GIT (Game Instance Template) File Format.
Auto-generated from git.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.git
{
    public class GITBinaryReader : GFFBinaryReader
    {
        public GIT Load(GIT target)
        {
            // Parse using Kaitai Struct
            var kaitaiObj = new KaitaiGenerated.GIT(Data);

            // Convert to PyKotor object
            return KaitaiToPykotor(kaitaiObj, target);
        }

        private GIT KaitaiToPykotor(object kaitaiObj, GIT target)
        {
            // TODO: Implement field mapping from .ksy spec
            return target;
        }
    }
}


/*
Binary writer for BioWare GIT (Game Instance Template) File Format.
Auto-generated from git.ksy for PyKotor compatibility
*/

using PyKotor.Resource.Generics.Base;
using PyKotor.Resource.Type;
using PyKotor.Resource.Formats.GFF;

namespace PyKotor.Resource.Formats.git
{
    public class GITBinaryWriter : GFFBinaryWriter
    {
        public byte[] Write(GIT git)
        {
            // Convert to GFF structure
            var gff = PykotorToGff(git);

            // Write binary GFF
            return WriteGff(gff);
        }

        private object PykotorToGff(GIT git)
        {
            // TODO: Implement field serialization from .ksy spec
            return null;
        }
    }
}
