meta:
  id: pth_xml
  title: BioWare PTH XML Format
  license: MIT
  endian: le
  file-extension: pth.xml
  encoding: UTF-8
  xref:
    binary_format: ../pth/pth
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_pth: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PTH.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  Human-readable XML representation of PTH (Path/Pathfinding) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../pth/pth.ksy
  
  References:
  - PyKotor wiki (GFF-PTH.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
