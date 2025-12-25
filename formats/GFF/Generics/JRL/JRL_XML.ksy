meta:
  id: jrl_xml
  title: BioWare JRL XML Format
  license: MIT
  endian: le
  file-extension: jrl.xml
  encoding: UTF-8
doc: |
  JRL XML format is a human-readable XML representation of JRL (Journal) binary files.
  Uses GFF XML structure with root element <gff3> containing <struct> elements.
  Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text

