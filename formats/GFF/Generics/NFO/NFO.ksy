meta:
  id: nfo
  title: BioWare NFO (Module Info) File Format
  license: MIT
  endian: le
  file-extension: nfo
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/extract/savedata.py
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  NFO (Module Info) files store save game module information for KotOR.

  This format inherits the complete GFF structure from gff.ksy.

  Note: This is different from IFO files. NFO is used in save games,
  while IFO is used in module definitions.

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "NFO "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3" or
      gff_data.header.file_version == "V4.0" or
      gff_data.header.file_version == "V4.1"
