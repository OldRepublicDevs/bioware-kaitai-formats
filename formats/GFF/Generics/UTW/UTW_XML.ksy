meta:
  id: utw_xml
  title: BioWare UTW XML Format
  license: MIT
  endian: le
  file-extension: utw.xml
  encoding: UTF-8
  xref:
    binary_format: ../utw/utw
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_utw: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTW.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  imports:
    - ../../gff/gff
    - ../../xml/gff_xml
doc: |
  Human-readable XML representation of UTW (Waypoint Template) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../utw/utw.ksy
  
  References:
  - PyKotor wiki (GFF-UTW.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
