meta:
  id: uts
  title: BioWare UTS (Sound Template) File Format
  license: MIT
  endian: le
  file-extension: uts
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/uts.py
    pykotor_wiki_gff_uts: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTS.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    pykotor_wiki: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTS.md
doc: |
  UTS (Sound Template) files define ambient sound sources and properties.

  This format inherits the complete GFF structure from gff.ksy.

  UTS Root Struct Fields:
  - TemplateResRef (ResRef): Blueprint identifier
  - Tag (String): Instance identifier
  - LocalizedName (LocalizedString): Sound name
  - Sounds (List): Sound file references
  - Volume, MaxDistance, MinDistance: Audio properties
  - Looping, Random, Positional: Sound behavior

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "UTS "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3"
