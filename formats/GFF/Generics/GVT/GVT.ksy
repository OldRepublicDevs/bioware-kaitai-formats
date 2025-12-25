meta:
  id: gvt
  title: BioWare GVT (Global Variables Table) File Format
  license: MIT
  endian: le
  file-extension: gvt
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  GVT (Global Variables Table) files store global game variables.

  This format inherits the complete GFF structure from gff.ksy.

  GVT Root Struct Fields:
  - ValNumber, ValBoolean, ValString lists for different variable types

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "GVT "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3" or
      gff_data.header.file_version == "V4.0" or
      gff_data.header.file_version == "V4.1"
