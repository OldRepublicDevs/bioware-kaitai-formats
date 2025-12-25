meta:
  id: utc_xml
  title: BioWare UTC XML Format
  license: MIT
  endian: le
  file-extension: utc.xml
  encoding: UTF-8
  xref:
    binary_format: ../utc/utc
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_utc: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTC.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  imports:
    - ../../gff/gff
    - ../../xml/gff_xml
doc: |
  Human-readable XML representation of UTC (Creature Template) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../utc/utc.ksy
  
  References:
  - PyKotor wiki (GFF-UTC.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
