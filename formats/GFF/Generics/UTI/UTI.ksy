meta:
  id: uti
  title: BioWare UTI (Item Template) File Format
  license: MIT
  endian: le
  file-extension: uti
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/uti.py
    pykotor_wiki_gff_uti: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTI.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    pykotor_wiki: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTI.md
doc: |
  UTI (Item Template) files define item properties, stats, and behavior.

  This format inherits the complete GFF structure from gff.ksy.

  UTI Root Struct Fields:
  - TemplateResRef (ResRef): Blueprint identifier
  - Tag (String): Instance identifier
  - LocalizedName (LocalizedString): Item name
  - Description (LocalizedString): Item description
  - BaseItem (Int32): Base item type (baseitems.2da)
  - Cost, StackSize, Charges: Item economics
  - ModelVariation, TextureVar, BodyVariation: Item appearance
  - PropertiesList (List): Item properties (damage, attack bonus, etc.)

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "UTI "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3"
