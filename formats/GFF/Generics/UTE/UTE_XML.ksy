meta:
  id: ute_xml
  title: BioWare UTE XML Format
  license: MIT
  endian: le
  file-extension: ute.xml
  encoding: UTF-8
  xref:
    binary_format: ../ute/ute
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_ute: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTE.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  imports:
    - ../../GFF/GFF
    - ../../GFF/XML/GFF_XML
doc: |
  Human-readable XML representation of UTE (Encounter Template) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../ute/ute.ksy
  
  References:
  - PyKotor wiki (GFF-UTE.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
