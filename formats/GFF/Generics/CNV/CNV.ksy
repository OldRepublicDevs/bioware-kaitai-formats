meta:
  id: cnv
  title: BioWare CNV (Conversation) File Format
  license: MIT
  endian: le
  file-extension: cnv
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/cnv/
    reone: https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/cnv.cpp
    xoreos: https://github.com/xoreos/xoreos/blob/master/src/aurora/cnvfile.cpp
    pykotor_wiki_gff_cnv: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-CNV.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  CNV (Conversation) files are GFF-based format files that store conversation trees with entries, replies,
  links, and conversation metadata. CNV files use the GFF (Generic File Format) binary structure
  with file type signature "CNV ".

  This format inherits the complete GFF structure from gff.ksy and adds CNV-specific
  validation and documentation.

  CNV files are used by Eclipse Engine games (Dragon Age Origins, Dragon Age 2, Mass Effect, Mass Effect 2).
  They are similar to DLG files used by Odyssey and Aurora engines but adapted for Eclipse's conversation system.

  CNV Root Struct Fields:
  - NumWords (Int32): Word count for conversation
  - Skippable (UInt8): Whether conversation can be skipped
  - ConversationType (Int32): Conversation type identifier
  - EntryList (List): NPC dialogue lines (CNVEntry structs)
  - ReplyList (List): Player response options (CNVReply structs)
  - StartingList (List): Entry points (CNVLink structs)
  - StuntList (List): Special animations (CNVStunt structs)

  Each Entry/Reply contains:
  - Text (LocalizedString): Dialogue text
  - Script (ResRef): Conditional/action scripts
  - Camera settings, animations, links to other nodes

  References:
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-CNV.md
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md

seq:
  - id: gff_data
    type: gff::gff
    doc: |
      Complete GFF structure. CNV files use standard GFF format with "CNV " file type.
      Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.

instances:
  file_type_valid:
    value: gff_data.header.file_type == "CNV "
    doc: Validates that this is a CNV file (file type must be "CNV ")
  
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3" or
      gff_data.header.file_version == "V4.0" or
      gff_data.header.file_version == "V4.1"
    doc: Validates GFF version is supported
