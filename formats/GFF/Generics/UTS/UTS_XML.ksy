meta:
  id: uts_xml
  title: BioWare UTS XML Format
  license: MIT
  endian: le
  file-extension: uts.xml
  encoding: UTF-8
  xref:
    binary_format: ../uts/uts
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_uts: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTS.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  imports:
    - ../../GFF/GFF
    - ../../GFF/XML/GFF_XML
doc: |
  Human-readable XML representation of UTS (Sound Template) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../uts/uts.ksy
  
  References:
  - PyKotor wiki (GFF-UTS.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
