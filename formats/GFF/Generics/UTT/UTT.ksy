meta:
  id: utt
  title: BioWare UTT (Trigger Template) File Format
  license: MIT
  endian: le
  file-extension: utt
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utt.py
    pykotor_wiki_gff_utt: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTT.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    pykotor_wiki: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTT.md
doc: |
  UTT (Trigger Template) files define trigger zones and their properties.

  This format inherits the complete GFF structure from gff.ksy.

  UTT Root Struct Fields:
  - TemplateResRef (ResRef): Blueprint identifier
  - Tag (String): Instance identifier
  - LocalizedName (LocalizedString): Trigger name
  - Geometry (List): Trigger zone vertices
  - TriggerType, Cursor, Faction: Trigger behavior
  - Script hooks: OnClick, OnDisarm, OnHeartbeat, OnTrapTriggered, OnUserDefined

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "UTT "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3"
