meta:
  id: cnv_xml
  title: BioWare CNV XML Format
  license: MIT
  endian: le
  file-extension: cnv.xml
  encoding: UTF-8
  xref:
    binary_format: ../cnv/cnv
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_cnv: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-CNV.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  imports:
    - ../../GFF/GFF
    - ../../GFF/XML/GFF_XML
doc: |
  Human-readable XML representation of CNV (Conversation) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../cnv/cnv.ksy
  
  References:
  - PyKotor wiki (GFF-CNV.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
