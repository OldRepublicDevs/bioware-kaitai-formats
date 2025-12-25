meta:
  id: gam_xml
  title: BioWare GAM XML Format
  license: MIT
  endian: le
  file-extension: gam.xml
  encoding: UTF-8
  xref:
    binary_format: ../gam/gam
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_gam: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GAM.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  imports:
    - ../../GFF/GFF
    - ../../GFF/XML/GFF_XML
doc: |
  Human-readable XML representation of GAM (Game State) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../gam/gam.ksy
  
  References:
  - PyKotor wiki (GFF-GAM.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
