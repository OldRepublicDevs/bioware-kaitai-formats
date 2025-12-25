meta:
  id: utd_xml
  title: BioWare UTD XML Format
  license: MIT
  endian: le
  file-extension: utd.xml
  encoding: UTF-8
  xref:
    binary_format: ../utd/utd
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_utd: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTD.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  Human-readable XML representation of UTD (Door Template) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../utd/utd.ksy
  
  References:
  - PyKotor wiki (GFF-UTD.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
