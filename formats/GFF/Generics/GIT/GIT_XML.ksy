meta:
  id: git_xml
  title: BioWare GIT XML Format
  license: MIT
  endian: le
  file-extension: git.xml
  encoding: UTF-8
  xref:
    binary_format: ../git/git
    gff_xml_schema: ../../xml/gff_xml
    pykotor_wiki_gff_git: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GIT.md
    pykotor_wiki_gff_format: https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
doc: |
  Human-readable XML representation of GIT (Game Instance Template) binary files.
  Uses GFF XML structure with <gff3> root element.
  
  Binary format reference: ../git/git.ksy
  
  References:
  - PyKotor wiki (GFF-GIT.md, GFF-File-Format.md)

seq:
  - id: xml_content
    type: str
    size-eos: true
    encoding: UTF-8
    doc: XML document content as UTF-8 text
