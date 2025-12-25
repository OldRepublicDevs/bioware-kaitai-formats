meta:
  id: are_xml
  title: BioWare ARE XML Format
  license: MIT
  endian: le
  file-extension: are.xml
  encoding: UTF-8
  xref:
    binary_format: ../are/are
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_are: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-ARE.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  imports:
    - ../../gff/gff
    - ../../xml/gff_xml
doc: |
  Human-readable XML representation of ARE (Area) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../are/are.ksy
  
  References:
  - PyKotor wiki (GFF-ARE.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
