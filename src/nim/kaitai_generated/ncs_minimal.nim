import kaitai_struct_nim_runtime
import options

type
  NcsMinimal* = ref object of KaitaiStruct
    `fileType`*: string
    `fileVersion`*: string
    `sizeMarker`*: uint8
    `totalFileSize`*: uint32
    `instructions`*: seq[NcsMinimal_Instruction]
    `parent`*: KaitaiStruct
  NcsMinimal_Instruction* = ref object of KaitaiStruct
    `bytecode`*: uint8
    `qualifier`*: uint8
    `parent`*: NcsMinimal

proc read*(_: typedesc[NcsMinimal], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NcsMinimal
proc read*(_: typedesc[NcsMinimal_Instruction], io: KaitaiStream, root: KaitaiStruct, parent: NcsMinimal): NcsMinimal_Instruction


proc read*(_: typedesc[NcsMinimal], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NcsMinimal =
  template this: untyped = result
  this = new(NcsMinimal)
  let root = if root == nil: cast[NcsMinimal](this) else: cast[NcsMinimal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fileTypeExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.fileType = fileTypeExpr
  let fileVersionExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.fileVersion = fileVersionExpr
  let sizeMarkerExpr = this.io.readU1()
  this.sizeMarker = sizeMarkerExpr
  let totalFileSizeExpr = this.io.readU4be()
  this.totalFileSize = totalFileSizeExpr
  block:
    var i: int
    while true:
      let it = NcsMinimal_Instruction.read(this.io, this.root, this)
      this.instructions.add(it)
      if this.io.pos >= NcsMinimal(this.root).totalFileSize:
        break
      inc i

proc fromFile*(_: typedesc[NcsMinimal], filename: string): NcsMinimal =
  NcsMinimal.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NcsMinimal_Instruction], io: KaitaiStream, root: KaitaiStruct, parent: NcsMinimal): NcsMinimal_Instruction =
  template this: untyped = result
  this = new(NcsMinimal_Instruction)
  let root = if root == nil: cast[NcsMinimal](this) else: cast[NcsMinimal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let bytecodeExpr = this.io.readU1()
  this.bytecode = bytecodeExpr
  let qualifierExpr = this.io.readU1()
  this.qualifier = qualifierExpr

proc fromFile*(_: typedesc[NcsMinimal_Instruction], filename: string): NcsMinimal_Instruction =
  NcsMinimal_Instruction.read(newKaitaiFileStream(filename), nil, nil)

