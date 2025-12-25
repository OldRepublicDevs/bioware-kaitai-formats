meta:
  id: gui_xml
  title: BioWare GUI XML Format
  license: MIT
  endian: le
  file-extension: gui.xml
  encoding: UTF-8
  xref:
    binary_format: ../gui/gui
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_gui: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GUI.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
  imports:
    - ../../GFF/GFF
    - ../../GFF/XML/GFF_XML
doc: |
  Human-readable XML representation of GUI (Graphical User Interface) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../gui/gui.ksy
  
  References:
  - PyKotor wiki (GFF-GUI.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
