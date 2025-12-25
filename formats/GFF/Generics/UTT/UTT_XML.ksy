meta:
  id: utt_xml
  title: BioWare UTT XML Format
  license: MIT
  endian: le
  file-extension: utt.xml
  encoding: UTF-8
  xref:
    binary_format: ../utt/utt
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_utt: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTT.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  imports:
    - ../../gff/gff
    - ../../xml/gff_xml
doc: |
  Human-readable XML representation of UTT (Trigger Template) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../utt/utt.ksy
  
  References:
  - PyKotor wiki (GFF-UTT.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
