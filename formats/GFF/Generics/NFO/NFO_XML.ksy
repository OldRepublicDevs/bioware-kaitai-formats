meta:
  id: nfo_xml
  title: BioWare NFO XML Format
  license: MIT
  endian: le
  file-extension: nfo.xml
  encoding: UTF-8
  xref:
    binary_format: ../nfo/nfo
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_nfo: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-NFO.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  Human-readable XML representation of NFO (Module Info) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../nfo/nfo.ksy
  
  References:
  - PyKotor wiki (GFF-NFO.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
