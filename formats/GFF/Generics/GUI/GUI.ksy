meta:
  id: gui
  title: BioWare GUI (Graphical User Interface) File Format
  license: MIT
  endian: le
  file-extension: gui
  imports:
    - ../../gff
  xref:
    pykotor: https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/gui.py
    reone: https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/gui.cpp
    pykotor_wiki_gff_gui: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GUI.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  GUI (Graphical User Interface) files define UI layouts, controls, and properties.

  This format inherits the complete GFF structure from gff.ksy.

  GUI Root Struct Fields:
  - CONTROLS (List): UI control elements (buttons, labels, listboxes, etc.)
  - Each control contains:
    - CONTROLTYPE (Int32): Control type (button=4, label=5, listbox=9, etc.)
    - TAG (String): Control identifier
    - X, Y, WIDTH, HEIGHT (Int32): Position and size
    - TEXT (Struct): Text properties with STRREF, color, alignment
    - BORDER (Struct): Border properties
    - EXTENT (Struct): Dimensions
    - Various control-specific fields

  References:
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GUI.md

seq:
  - id: gff_data
    type: gff::gff

instances:
  file_type_valid:
    value: gff_data.header.file_type == "GUI "
  version_valid:
    value: |
      gff_data.header.file_version == "V3.2" or
      gff_data.header.file_version == "V3.3" or
      gff_data.header.file_version == "V4.0" or
      gff_data.header.file_version == "V4.1"
