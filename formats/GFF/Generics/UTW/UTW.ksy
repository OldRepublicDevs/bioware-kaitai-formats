meta:
  id: utw
  title: BioWare UTW (Waypoint Template) File Format
  license: MIT
  endian: le
  file-extension: utw
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utw.py
    pykotor_wiki_gff_utw: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTW.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    pykotor_wiki: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTW.md
doc: |
  UTW (Waypoint Template) files define navigation waypoints and spawn points.

  This format inherits the complete GFF structure from gff.ksy.

  UTW Root Struct Fields:
  - TemplateResRef (ResRef): Blueprint identifier
  - Tag (String): Instance identifier
  - LocalizedName (LocalizedString): Waypoint name
  - Appearance (UInt32): Visual appearance (if visible)
  - HasMapNote, MapNote (LocalizedString): Map markers
  - LinkedTo (String): Connected waypoint tag

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "UTW "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3"
