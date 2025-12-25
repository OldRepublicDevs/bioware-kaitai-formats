meta:
  id: jrl_xml
  title: BioWare JRL XML Format
  license: MIT
  endian: le
  file-extension: jrl.xml
  encoding: UTF-8
  xref:
    binary_format: ../jrl/jrl
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_jrl: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-JRL.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  Human-readable XML representation of JRL (Journal) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../jrl/jrl.ksy
  
  References:
  - PyKotor wiki (GFF-JRL.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
