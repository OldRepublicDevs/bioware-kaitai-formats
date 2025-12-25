meta:
  id: uti_xml
  title: BioWare UTI XML Format
  license: MIT
  endian: le
  file-extension: uti.xml
  encoding: UTF-8
  xref:
    binary_format: ../uti/uti
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_uti: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTI.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  imports:
    - ../../gff/gff
    - ../../xml/gff_xml
doc: |
  Human-readable XML representation of UTI (Item Template) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../uti/uti.ksy
  
  References:
  - PyKotor wiki (GFF-UTI.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
