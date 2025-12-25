meta:
  id: dlg_xml
  title: BioWare DLG XML Format
  license: MIT
  endian: le
  file-extension: dlg.xml
  encoding: UTF-8
  xref:
    binary_format: ../dlg/dlg
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_dlg: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-DLG.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  Human-readable XML representation of DLG (Dialogue) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../dlg/dlg.ksy
  
  References:
  - PyKotor wiki (GFF-DLG.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
