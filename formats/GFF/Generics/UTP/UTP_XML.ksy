meta:
  id: utp_xml
  title: BioWare UTP XML Format
  license: MIT
  endian: le
  file-extension: utp.xml
  encoding: UTF-8
  xref:
    binary_format: ../utp/utp
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_utp: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTP.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  imports:
    - ../../GFF/GFF
    - ../../GFF/XML/GFF_XML
doc: |
  Human-readable XML representation of UTP (Placeable Template) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../utp/utp.ksy
  
  References:
  - PyKotor wiki (GFF-UTP.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
