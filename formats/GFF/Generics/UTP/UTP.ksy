meta:
  id: utp
  title: BioWare UTP (Placeable Template) File Format
  license: MIT
  endian: le
  file-extension: utp
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utp.py
    pykotor_wiki_gff_utp: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTP.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    pykotor_wiki: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTP.md
doc: |
  UTP (Placeable Template) files define placeable objects (containers, furniture, etc.).

  This format inherits the complete GFF structure from gff.ksy.

  UTP Root Struct Fields:
  - TemplateResRef (ResRef): Blueprint identifier
  - Tag (String): Instance identifier
  - LocalizedName (LocalizedString): Placeable name
  - Appearance (UInt32): Placeable appearance ID
  - HasInventory, ItemList (List): Container contents
  - Locked, KeyRequired, Trap: Security settings
  - Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnHeartbeat, etc.

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "UTP "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3"
