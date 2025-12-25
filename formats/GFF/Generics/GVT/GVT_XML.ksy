meta:
  id: gvt_xml
  title: BioWare GVT XML Format
  license: MIT
  endian: le
  file-extension: gvt.xml
  encoding: UTF-8
  xref:
    binary_format: ../gvt/gvt
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_gvt: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GVT.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  imports:
    - ../../gff/gff
    - ../../xml/gff_xml
doc: |
  Human-readable XML representation of GVT (Global Variables Table) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../gvt/gvt.ksy
  
  References:
  - PyKotor wiki (GFF-GVT.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
