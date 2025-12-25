meta:
  id: utc_xml
  title: BioWare UTC XML Format
  license: MIT
  endian: le
  file-extension: utc.xml
  encoding: UTF-8
  xref:
    pykotor_library_utc_binary: https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/utc.py
    pykotor_library_utc_xml: https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
    reone_library_utc_binary: https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/gff/utc.cpp
    xoreos_library_utc_binary: https://github.com/xoreos/xoreos/tree/master/src/aurora/gff3file.cpp
    pykotor_wiki_gff_utc: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTC.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  UTC XML format is a human-readable XML representation of UTC (Creature) binary files.
  Uses GFF XML structure with root element <gff3> containing <struct> elements.
  Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).

  References:
    - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/utc.py
    - https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/gff/utc.cpp
    - https://github.com/xoreos/xoreos/tree/master/src/aurora/gff3file.cpp
    - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTC.md
    - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text




