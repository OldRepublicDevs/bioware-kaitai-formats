meta:
  id: fac_xml
  title: BioWare FAC XML Format
  license: MIT
  endian: le
  file-extension: fac.xml
  encoding: UTF-8
  xref:
    binary_format: ../fac/fac
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_fac: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-FAC.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  imports:
    - ../../gff/gff
    - ../../xml/gff_xml
doc: |
  Human-readable XML representation of FAC (Faction) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../fac/fac.ksy
  
  References:
  - PyKotor wiki (GFF-FAC.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
