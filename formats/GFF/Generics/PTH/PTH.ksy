meta:
  id: pth
  title: BioWare PTH (Path/Pathfinding) File Format
  license: MIT
  endian: le
  file-extension: pth
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/pth.py
    pykotor_wiki_gff_pth: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PTH.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  PTH (Path/Pathfinding) files store pathfinding waypoint graphs for AI navigation.

  This format inherits the complete GFF structure from gff.ksy.

  PTH Root Struct Fields:
  - Path_Points (List): Waypoint positions (X, Y coordinates)
  - Connections (List): Connections between waypoints

  References:
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PTH.md
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/pth.py

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "PTH "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3" or
      gff_data.header.file_version == "V4.0" or
      gff_data.header.file_version == "V4.1"
