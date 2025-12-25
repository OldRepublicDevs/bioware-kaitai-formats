meta:
  id: dlg
  title: BioWare DLG (Dialogue) File Format
  license: MIT
  endian: le
  file-extension: dlg
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/dlg/
    reone: https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/gff/dlg.cpp
    xoreos: https://github.com/xoreos/xoreos/tree/master/src/aurora/dlgfile.cpp
    pykotor_wiki_gff_dlg: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-DLG.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  DLG (Dialogue) files are GFF-based format files that store conversation trees with entries, replies,
  links, and conversation metadata for Odyssey and Aurora engines.

  This format inherits the complete GFF structure from gff.ksy and adds DLG-specific
  validation and documentation.

  DLG files contain:
  - Root struct with conversation metadata (NumWords, Skippable, ConversationType, etc.)
  - EntryList: Array of dialogue entries (NPC lines)
  - ReplyList: Array of reply options (player responses)
  - StartingList: Array of entry points into conversation tree
  - StuntList: Array of cutscene/animation sequences

  References:
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-DLG.md
  - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/dlg/

seq:
  - id: gff_data
    type: gff::gff
    doc: Complete GFF structure with "DLG " file type

instances:
  file_type_valid:
    value: gff_data.header.file_type == "DLG "
    doc: Validates DLG file type
  
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3" or
      gff_data.header.file_version == "V4.0" or
      gff_data.header.file_version == "V4.1"
    doc: Validates GFF version
