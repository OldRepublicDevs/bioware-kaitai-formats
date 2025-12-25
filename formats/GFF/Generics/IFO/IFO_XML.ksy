meta:
  id: ifo_xml
  title: BioWare IFO XML Format
  license: MIT
  endian: le
  file-extension: ifo.xml
  encoding: UTF-8
  xref:
    binary_format: ../ifo/ifo
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_ifo: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-IFO.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  Human-readable XML representation of IFO (Module Information) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../ifo/ifo.ksy
  
  References:
  - PyKotor wiki (GFF-IFO.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
