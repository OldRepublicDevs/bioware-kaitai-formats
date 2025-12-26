import kaitai_struct_nim_runtime
import options

type
  GitXml* = ref object of KaitaiStruct
    `xmlContent`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[GitXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GitXml



##[
Human-readable XML representation of GIT (Game Instance Template) binary files.
Uses GFF XML structure with <gff3> root element.

Binary format reference: ../git/git.ksy

References:
- PyKotor wiki (GFF-GIT.md, GFF-File-Format.md)

]##
proc read*(_: typedesc[GitXml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GitXml =
  template this: untyped = result
  this = new(GitXml)
  let root = if root == nil: cast[GitXml](this) else: cast[GitXml](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XML document content as UTF-8 text
  ]##
  let xmlContentExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlContent = xmlContentExpr

proc fromFile*(_: typedesc[GitXml], filename: string): GitXml =
  GitXml.read(newKaitaiFileStream(filename), nil, nil)

