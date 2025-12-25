meta:
  id: gam
  title: BioWare GAM (Game State) File Format
  license: MIT
  endian: le
  file-extension: gam
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/
    reone: https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/
    xoreos: https://github.com/xoreos/xoreos/blob/master/src/aurora/
    pykotor_wiki_gff_gam: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GAM.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  GAM (Game State) files are GFF-based format files that store game state information
  including party members, global variables, game time, and time played.

  This format inherits the complete GFF structure from gff.ksy and adds GAM-specific
  validation and documentation.

  GAM files are used by:
  - Aurora Engine (Neverwinter Nights, Neverwinter Nights 2)
  - Infinity Engine (Mass Effect, Dragon Age Origins, Dragon Age 2)
  
  NOTE: Odyssey Engine (Knights of the Old Republic) does NOT use GAM format -
  it uses NFO format for save games instead.

  GAM Root Struct Fields:
  - GameTimeHour, GameTimeMinute, GameTimeSecond, GameTimeMillisecond (Int32): Game time
  - TimePlayed (Int32): Total playtime in seconds
  - PartyList (List): Party member ResRefs
  - GlobalBooleans, GlobalNumbers, GlobalStrings (Lists): Global variable storage
  
  Aurora-specific: ModuleName, CurrentArea, PlayerCharacter
  Infinity-specific: GameName, Chapter, JournalEntries

  References:
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GAM.md
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md

seq:
  - id: gff_data
    type: gff::gff
    doc: |
      Complete GFF structure. GAM files use standard GFF format with "GAM " file type.
      Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.

instances:
  file_type_valid:
    value: gff_data.header.file_type == "GAM "
    doc: Validates that this is a GAM file (file type must be "GAM ")
  
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3" or
      gff_data.header.file_version == "V4.0" or
      gff_data.header.file_version == "V4.1"
    doc: Validates GFF version is supported
