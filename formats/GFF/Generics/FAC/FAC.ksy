meta:
  id: fac
  title: BioWare FAC (Faction) File Format
  license: MIT
  endian: le
  file-extension: fac
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/fac.py
    reone: https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/
    pykotor_wiki_gff_fac: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-FAC.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  FAC (Faction) files are GFF-based format files that store faction relationships,
  reputation values, and faction metadata.

  This format inherits the complete GFF structure from gff.ksy and adds FAC-specific
  validation and documentation.

  FAC Root Struct Fields:
  - FactionName (String): Faction identifier
  - FactionParentID (UInt16): Parent faction ID
  - FactionGlobal (UInt16): Global faction flag
  - RepList (List): Reputation values with other factions
    - FactionID (UInt32): Target faction ID
    - FactionRep (UInt32): Reputation value (0-100)

  References:
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-FAC.md
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/fac.py

seq:
  - id: gff_data
    type: gff::gff
    doc: Complete GFF structure with "FAC " file type

instances:
  file_type_valid:
    value: gff_data.header.file_type == "FAC "
    doc: Validates FAC file type
  
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3" or
      gff_data.header.file_version == "V4.0" or
      gff_data.header.file_version == "V4.1"
    doc: Validates GFF version
