meta:
  id: ifo
  title: BioWare IFO (Module Information) File Format
  license: MIT
  endian: le
  file-extension: ifo
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/ifo.py
    reone: https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/ifo.cpp
    pykotor_wiki_gff_ifo: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-IFO.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  IFO (Module Information) files store module metadata including entry points,
  starting locations, and module properties.

  This format inherits the complete GFF structure from gff.ksy.

  IFO Root Struct Fields:
  - Mod_ID (ResRef): Module identifier
  - Mod_Name (LocalizedString): Module display name
  - Mod_Entry_Area (ResRef): Starting area
  - Mod_Entry_X, Mod_Entry_Y, Mod_Entry_Z (Float): Starting position
  - Mod_Entry_Dir_X, Mod_Entry_Dir_Y (Float): Starting orientation
  - Mod_OnHeartbeat, Mod_OnModLoad, Mod_OnModStart (ResRef): Script hooks
  - Mod_MinGameVer (String): Minimum game version required

  References:
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-IFO.md

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "IFO "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3" or
      gff_data.header.file_version == "V4.0" or
      gff_data.header.file_version == "V4.1"
