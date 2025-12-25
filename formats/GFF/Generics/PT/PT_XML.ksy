meta:
  id: pt_xml
  title: BioWare PT XML Format
  license: MIT
  endian: le
  file-extension: pt.xml
  encoding: UTF-8
  xref:
    binary_format: ../pt/pt
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_pt: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PT.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  Human-readable XML representation of PT (Party Table) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../pt/pt.ksy
  
  References:
  - PyKotor wiki (GFF-PT.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
