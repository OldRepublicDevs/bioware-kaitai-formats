meta:
  id: utd
  title: BioWare UTD (Door Template) File Format
  license: MIT
  endian: le
  file-extension: utd
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utd.py
    pykotor_wiki_gff_utd: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTD.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    pykotor_wiki: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTD.md
doc: |
  UTD (Door Template) files define door properties, scripts, and behavior.

  This format inherits the complete GFF structure from gff.ksy.

  UTD Root Struct Fields:
  - TemplateResRef (ResRef): Blueprint identifier
  - Tag (String): Instance identifier
  - LocalizedName (LocalizedString): Door name
  - Appearance (UInt32): Door appearance ID
  - Locked, KeyRequired, Trap, Faction (various): Door state/behavior
  - Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnFailToOpen, etc.

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "UTD "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3"
