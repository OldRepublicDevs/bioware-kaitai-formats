meta:
  id: jrl
  title: BioWare JRL (Journal) File Format
  license: MIT
  endian: le
  file-extension: jrl
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/jrl.py
    pykotor_wiki_gff_jrl: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-JRL.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    pykotor_wiki: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-JRL.md
doc: |
  JRL (Journal) files store quest journal entries and categories.

  This format inherits the complete GFF structure from gff.ksy.

  JRL Root Struct Fields:
  - Categories (List): Journal categories
  - Each category contains quest entries with text, states, priorities

  References:
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-JRL.md

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "JRL "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3" or
      gff_data.header.file_version == "V4.0" or
      gff_data.header.file_version == "V4.1"
