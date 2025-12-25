meta:
  id: utc
  title: BioWare UTC (Creature Template) File
  license: MIT
  endian: le
  file-extension: utc
  imports:
    - ../../gff
  xref:
    pykotor: Libraries/PyKotor/src/pykotor/resource/generics/utc.py
    reone: vendor/reone/src/libs/resource/parser/gff/utc.cpp
    xoreos: vendor/xoreos/src/aurora/gff3file.cpp
doc: |
  UTC (Creature Template) files are GFF-based format files that store creature definitions
  including stats, appearance, inventory, feats, and script hooks. UTC files are used to
  define NPCs, party members, enemies, and the player character in Knights of the Old Republic.
  
  This format inherits the complete GFF structure from gff.ksy and adds UTC-specific
  validation and documentation.
  
  UTC Root Struct Fields (Common):
  - "TemplateResRef" (ResRef): Blueprint identifier
  - "Tag" (String): Unique instance identifier
  - "FirstName", "LastName" (LocalizedString): Creature name
  - "Appearance_Type" (UInt32): Appearance ID (appearance.2da)
  - "PortraitId" (UInt16): Portrait index (portraits.2da)
  - "Gender", "Race" (UInt8/UInt16): Character attributes
  - "Str", "Dex", "Con", "Int", "Wis", "Cha" (UInt8): Ability scores
  - "HitPoints", "MaxHitPoints", "ForcePoints" (Int16): Health/Force stats
  - "ClassList" (List): Character classes with levels
  - "FeatList" (List): Known feats
  - "SkillList" (List): Skill ranks
  - "ItemList" (List): Inventory items
  - "Equip_ItemList" (List): Equipped items with slots
  - Script hooks: "ScriptAttacked", "ScriptDamaged", "ScriptDeath", etc. (ResRef)
  
  References:
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTC.md
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utc.py
  - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/utc.cpp

seq:
  - id: gff_data
    type: gff::gff
    doc: |
      Complete GFF structure. UTC files use standard GFF format with "UTC " file type.
      Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.

instances:
  file_type_valid:
    value: gff_data.header.file_type == "UTC "
    doc: Validates that this is a UTC file (file type must be "UTC ")
  
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3" or
      gff_data.header.file_version == "V4.0" or
      gff_data.header.file_version == "V4.1"
    doc: Validates GFF version is supported
