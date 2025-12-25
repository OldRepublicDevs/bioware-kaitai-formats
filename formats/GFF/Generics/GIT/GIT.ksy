meta:
  id: git
  title: BioWare GIT (Game Instance Template) File Format
  license: MIT
  endian: le
  file-extension: git
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/git.py
    reone: https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/git.cpp
    xoreos: https://github.com/xoreos/xoreos/blob/master/src/aurora/gitfile.cpp
    pykotor_wiki_gff_git: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GIT.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  GIT (Game Instance Template) files store dynamic area instance data including
  placed creatures, placeables, doors, triggers, waypoints, sounds, stores, and encounters.

  This format inherits the complete GFF structure from gff.ksy.

  GIT Root Struct Fields:
  - CreatureList (List): Placed creatures with positions, orientations
  - DoorList (List): Placed doors with states, scripts
  - PlaceableList (List): Placed placeables (chests, etc.)
  - TriggerList (List): Trigger zones
  - WaypointList (List): Navigation waypoints
  - SoundList (List): Ambient sounds
  - StoreList (List): Merchant shops
  - EncounterList (List): Spawn encounters
  - CameraList (List): Camera points

  References:
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GIT.md

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "GIT "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3" or
      gff_data.header.file_version == "V4.0" or
      gff_data.header.file_version == "V4.1"
