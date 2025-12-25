meta:
  id: pth_xml
  title: BioWare PTH XML Format
  license: MIT
  endian: le
  file-extension: pth.xml
  encoding: UTF-8
  xref:
    pykotor_library_pth_binary: https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/pth.py
    pykotor_library_pth_xml: https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
    reone: https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/gff/pth.cpp
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
    pykotor_wiki_gff_pth: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PTH.md
    xoreos: https://github.com/xoreos/xoreos/tree/master/src/aurora/gff3file.cpp
doc: |
  PTH XML format is a human-readable XML representation of PTH (Path) binary files.
  Uses GFF XML structure with root element <gff3> containing <struct> elements.
  Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).

  References:
  - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/pth.py
  - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
  - https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/gff/pth.cpp
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PTH.md
  - https://github.com/xoreos/xoreos/tree/master/src/aurora/gff3file.cpp

imports:
  - ../../GFF
  - ../../XML/GFF_XML
  - ../PTH/PTH

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text

