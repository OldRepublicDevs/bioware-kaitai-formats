meta:
  id: are
  title: BioWare ARE (Area) File Format
  license: MIT
  endian: le
  file-extension: are
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/are.py
    reone: https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/are.cpp
    xoreos: https://github.com/xoreos/xoreos/blob/master/src/aurora/arefile.cpp
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    pykotor_wiki_gff_are: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-ARE.md
doc: |
  ARE (Area) files are GFF-based format files that store static area information including
  lighting, fog, grass, weather, script hooks, and map data. ARE files use the GFF (Generic File Format)
  binary structure with file type signature "ARE ".

  This format inherits the complete GFF structure from gff.ksy and adds ARE-specific
  validation and documentation.

  ARE Root Struct Fields (Common):
  - "Tag" (String): Unique area identifier
  - "Name" (LocalizedString): Area display name
  - "SunAmbientColor", "SunDiffuseColor" (UInt32): Lighting colors (BGR format)
  - "SunFogOn", "SunFogNear", "SunFogFar", "SunFogColor": Fog settings
  - "Grass_*": Grass rendering properties
  - "OnEnter", "OnExit", "OnHeartbeat", "OnUserDefined": Script hooks (ResRef)
  - "Map" (Struct): Minimap coordinate mapping
  - "Rooms" (List): Audio zones and weather regions

  KotOR 2 adds weather fields:
  - "ChanceRain", "ChanceSnow", "ChanceLightning" (Int32)
  - "Dirty*" fields for dust particle effects

  References:
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-ARE.md
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/are.py
  - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/are.cpp

seq:
  - id: gff_data
    type: gff::gff
    doc: |
      Complete GFF structure. ARE files use standard GFF format with "ARE " file type.
      Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.

instances:
  file_type_valid:
    value: gff_data.header.file_type == "ARE "
    doc: Validates that this is an ARE file (file type must be "ARE ")
  
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3" or
      gff_data.header.file_version == "V4.0" or
      gff_data.header.file_version == "V4.1"
    doc: Validates GFF version is supported

  root_struct_resolved:
    value: gff_data.root_struct_resolved
    doc: |
      Convenience access to the decoded GFF root struct (struct_array[0]).
      Use this to iterate all resolved fields (label + typed value), including:
      "Tag", "Name", "AlphaTest", "Map" (struct), "Rooms" (list), and all KotOR2/deprecated keys.