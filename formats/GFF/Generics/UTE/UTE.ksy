meta:
  id: ute
  title: BioWare UTE (Encounter Template) File Format
  license: MIT
  endian: le
  file-extension: ute
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/ute.py
    pykotor_wiki_gff_ute: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTE.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  UTE (Encounter Template) files define spawn encounters with creature lists and probabilities.

  This format inherits the complete GFF structure from gff.ksy.

  UTE Root Struct Fields:
  - TemplateResRef (ResRef): Blueprint identifier
  - Tag (String): Instance identifier
  - LocalizedName (LocalizedString): Encounter name
  - CreatureList (List): Creatures to spawn with probabilities
  - Difficulty, MaxCreatures, RecCreatures, SpawnOption: Spawn behavior
  - Script hooks: OnEntered, OnExhausted, OnExit, OnHeartbeat, OnUserDefined

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "UTE "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3"
