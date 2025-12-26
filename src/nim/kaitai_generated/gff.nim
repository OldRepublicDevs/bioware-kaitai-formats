import kaitai_struct_nim_runtime
import options
import bioware_common

type
  Gff* = ref object of KaitaiStruct
    `header`*: Gff_GffHeader
    `parent`*: KaitaiStruct
    `fieldArrayInst`: Gff_FieldArray
    `fieldArrayInstFlag`: bool
    `fieldDataInst`: Gff_FieldData
    `fieldDataInstFlag`: bool
    `fieldIndicesArrayInst`: Gff_FieldIndicesArray
    `fieldIndicesArrayInstFlag`: bool
    `labelArrayInst`: Gff_LabelArray
    `labelArrayInstFlag`: bool
    `listIndicesArrayInst`: Gff_ListIndicesArray
    `listIndicesArrayInstFlag`: bool
    `rootStructResolvedInst`: Gff_ResolvedStruct
    `rootStructResolvedInstFlag`: bool
    `structArrayInst`: Gff_StructArray
    `structArrayInstFlag`: bool
  Gff_GffFieldType* = enum
    uint8 = 0
    int8 = 1
    uint16 = 2
    int16 = 3
    uint32 = 4
    int32 = 5
    uint64 = 6
    int64 = 7
    single = 8
    double = 9
    string = 10
    resref = 11
    localized_string = 12
    binary = 13
    struct = 14
    list = 15
    vector4 = 16
    vector3 = 17
  Gff_FieldArray* = ref object of KaitaiStruct
    `entries`*: seq[Gff_FieldEntry]
    `parent`*: Gff
  Gff_FieldData* = ref object of KaitaiStruct
    `rawData`*: seq[byte]
    `parent`*: Gff
  Gff_FieldEntry* = ref object of KaitaiStruct
    `fieldType`*: Gff_GffFieldType
    `labelIndex`*: uint32
    `dataOrOffset`*: uint32
    `parent`*: KaitaiStruct
    `fieldDataOffsetValueInst`: int
    `fieldDataOffsetValueInstFlag`: bool
    `isComplexTypeInst`: bool
    `isComplexTypeInstFlag`: bool
    `isListTypeInst`: bool
    `isListTypeInstFlag`: bool
    `isSimpleTypeInst`: bool
    `isSimpleTypeInstFlag`: bool
    `isStructTypeInst`: bool
    `isStructTypeInstFlag`: bool
    `listIndicesOffsetValueInst`: int
    `listIndicesOffsetValueInstFlag`: bool
    `structIndexValueInst`: uint32
    `structIndexValueInstFlag`: bool
  Gff_FieldIndicesArray* = ref object of KaitaiStruct
    `indices`*: seq[uint32]
    `parent`*: Gff
  Gff_GffHeader* = ref object of KaitaiStruct
    `fileType`*: string
    `fileVersion`*: string
    `structOffset`*: uint32
    `structCount`*: uint32
    `fieldOffset`*: uint32
    `fieldCount`*: uint32
    `labelOffset`*: uint32
    `labelCount`*: uint32
    `fieldDataOffset`*: uint32
    `fieldDataCount`*: uint32
    `fieldIndicesOffset`*: uint32
    `fieldIndicesCount`*: uint32
    `listIndicesOffset`*: uint32
    `listIndicesCount`*: uint32
    `parent`*: Gff
  Gff_LabelArray* = ref object of KaitaiStruct
    `labels`*: seq[Gff_LabelEntry]
    `parent`*: Gff
  Gff_LabelEntry* = ref object of KaitaiStruct
    `name`*: string
    `parent`*: Gff_LabelArray
  Gff_LabelEntryTerminated* = ref object of KaitaiStruct
    `name`*: string
    `parent`*: Gff_ResolvedField
  Gff_ListEntry* = ref object of KaitaiStruct
    `numStructIndices`*: uint32
    `structIndices`*: seq[uint32]
    `parent`*: Gff_ResolvedField
  Gff_ListIndicesArray* = ref object of KaitaiStruct
    `rawData`*: seq[byte]
    `parent`*: Gff
  Gff_ResolvedField* = ref object of KaitaiStruct
    `fieldIndex`*: uint32
    `parent`*: Gff_ResolvedStruct
    `entryInst`: Gff_FieldEntry
    `entryInstFlag`: bool
    `fieldEntryPosInst`: int
    `fieldEntryPosInstFlag`: bool
    `labelInst`: Gff_LabelEntryTerminated
    `labelInstFlag`: bool
    `listEntryInst`: Gff_ListEntry
    `listEntryInstFlag`: bool
    `listStructsInst`: seq[Gff_ResolvedStruct]
    `listStructsInstFlag`: bool
    `valueBinaryInst`: BiowareCommon_BiowareBinaryData
    `valueBinaryInstFlag`: bool
    `valueDoubleInst`: float64
    `valueDoubleInstFlag`: bool
    `valueInt16Inst`: int16
    `valueInt16InstFlag`: bool
    `valueInt32Inst`: int32
    `valueInt32InstFlag`: bool
    `valueInt64Inst`: int64
    `valueInt64InstFlag`: bool
    `valueInt8Inst`: int8
    `valueInt8InstFlag`: bool
    `valueLocalizedStringInst`: BiowareCommon_BiowareLocstring
    `valueLocalizedStringInstFlag`: bool
    `valueResrefInst`: BiowareCommon_BiowareResref
    `valueResrefInstFlag`: bool
    `valueSingleInst`: float32
    `valueSingleInstFlag`: bool
    `valueStringInst`: BiowareCommon_BiowareCexoString
    `valueStringInstFlag`: bool
    `valueStructInst`: Gff_ResolvedStruct
    `valueStructInstFlag`: bool
    `valueUint16Inst`: uint16
    `valueUint16InstFlag`: bool
    `valueUint32Inst`: uint32
    `valueUint32InstFlag`: bool
    `valueUint64Inst`: uint64
    `valueUint64InstFlag`: bool
    `valueUint8Inst`: uint8
    `valueUint8InstFlag`: bool
    `valueVector3Inst`: BiowareCommon_BiowareVector3
    `valueVector3InstFlag`: bool
    `valueVector4Inst`: BiowareCommon_BiowareVector4
    `valueVector4InstFlag`: bool
  Gff_ResolvedStruct* = ref object of KaitaiStruct
    `structIndex`*: uint32
    `parent`*: KaitaiStruct
    `entryInst`: Gff_StructEntry
    `entryInstFlag`: bool
    `fieldIndicesInst`: seq[uint32]
    `fieldIndicesInstFlag`: bool
    `fieldsInst`: seq[Gff_ResolvedField]
    `fieldsInstFlag`: bool
    `singleFieldInst`: Gff_ResolvedField
    `singleFieldInstFlag`: bool
  Gff_StructArray* = ref object of KaitaiStruct
    `entries`*: seq[Gff_StructEntry]
    `parent`*: Gff
  Gff_StructEntry* = ref object of KaitaiStruct
    `structId`*: int32
    `dataOrOffset`*: uint32
    `fieldCount`*: uint32
    `parent`*: KaitaiStruct
    `fieldIndicesOffsetInst`: uint32
    `fieldIndicesOffsetInstFlag`: bool
    `hasMultipleFieldsInst`: bool
    `hasMultipleFieldsInstFlag`: bool
    `hasSingleFieldInst`: bool
    `hasSingleFieldInstFlag`: bool
    `singleFieldIndexInst`: uint32
    `singleFieldIndexInstFlag`: bool

proc read*(_: typedesc[Gff], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gff
proc read*(_: typedesc[Gff_FieldArray], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_FieldArray
proc read*(_: typedesc[Gff_FieldData], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_FieldData
proc read*(_: typedesc[Gff_FieldEntry], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gff_FieldEntry
proc read*(_: typedesc[Gff_FieldIndicesArray], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_FieldIndicesArray
proc read*(_: typedesc[Gff_GffHeader], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_GffHeader
proc read*(_: typedesc[Gff_LabelArray], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_LabelArray
proc read*(_: typedesc[Gff_LabelEntry], io: KaitaiStream, root: KaitaiStruct, parent: Gff_LabelArray): Gff_LabelEntry
proc read*(_: typedesc[Gff_LabelEntryTerminated], io: KaitaiStream, root: KaitaiStruct, parent: Gff_ResolvedField): Gff_LabelEntryTerminated
proc read*(_: typedesc[Gff_ListEntry], io: KaitaiStream, root: KaitaiStruct, parent: Gff_ResolvedField): Gff_ListEntry
proc read*(_: typedesc[Gff_ListIndicesArray], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_ListIndicesArray
proc read*(_: typedesc[Gff_ResolvedField], io: KaitaiStream, root: KaitaiStruct, parent: Gff_ResolvedStruct, fieldIndex: any): Gff_ResolvedField
proc read*(_: typedesc[Gff_ResolvedStruct], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, structIndex: any): Gff_ResolvedStruct
proc read*(_: typedesc[Gff_StructArray], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_StructArray
proc read*(_: typedesc[Gff_StructEntry], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gff_StructEntry

proc fieldArray*(this: Gff): Gff_FieldArray
proc fieldData*(this: Gff): Gff_FieldData
proc fieldIndicesArray*(this: Gff): Gff_FieldIndicesArray
proc labelArray*(this: Gff): Gff_LabelArray
proc listIndicesArray*(this: Gff): Gff_ListIndicesArray
proc rootStructResolved*(this: Gff): Gff_ResolvedStruct
proc structArray*(this: Gff): Gff_StructArray
proc fieldDataOffsetValue*(this: Gff_FieldEntry): int
proc isComplexType*(this: Gff_FieldEntry): bool
proc isListType*(this: Gff_FieldEntry): bool
proc isSimpleType*(this: Gff_FieldEntry): bool
proc isStructType*(this: Gff_FieldEntry): bool
proc listIndicesOffsetValue*(this: Gff_FieldEntry): int
proc structIndexValue*(this: Gff_FieldEntry): uint32
proc entry*(this: Gff_ResolvedField): Gff_FieldEntry
proc fieldEntryPos*(this: Gff_ResolvedField): int
proc label*(this: Gff_ResolvedField): Gff_LabelEntryTerminated
proc listEntry*(this: Gff_ResolvedField): Gff_ListEntry
proc listStructs*(this: Gff_ResolvedField): seq[Gff_ResolvedStruct]
proc valueBinary*(this: Gff_ResolvedField): BiowareCommon_BiowareBinaryData
proc valueDouble*(this: Gff_ResolvedField): float64
proc valueInt16*(this: Gff_ResolvedField): int16
proc valueInt32*(this: Gff_ResolvedField): int32
proc valueInt64*(this: Gff_ResolvedField): int64
proc valueInt8*(this: Gff_ResolvedField): int8
proc valueLocalizedString*(this: Gff_ResolvedField): BiowareCommon_BiowareLocstring
proc valueResref*(this: Gff_ResolvedField): BiowareCommon_BiowareResref
proc valueSingle*(this: Gff_ResolvedField): float32
proc valueString*(this: Gff_ResolvedField): BiowareCommon_BiowareCexoString
proc valueStruct*(this: Gff_ResolvedField): Gff_ResolvedStruct
proc valueUint16*(this: Gff_ResolvedField): uint16
proc valueUint32*(this: Gff_ResolvedField): uint32
proc valueUint64*(this: Gff_ResolvedField): uint64
proc valueUint8*(this: Gff_ResolvedField): uint8
proc valueVector3*(this: Gff_ResolvedField): BiowareCommon_BiowareVector3
proc valueVector4*(this: Gff_ResolvedField): BiowareCommon_BiowareVector4
proc entry*(this: Gff_ResolvedStruct): Gff_StructEntry
proc fieldIndices*(this: Gff_ResolvedStruct): seq[uint32]
proc fields*(this: Gff_ResolvedStruct): seq[Gff_ResolvedField]
proc singleField*(this: Gff_ResolvedStruct): Gff_ResolvedField
proc fieldIndicesOffset*(this: Gff_StructEntry): uint32
proc hasMultipleFields*(this: Gff_StructEntry): bool
proc hasSingleField*(this: Gff_StructEntry): bool
proc singleFieldIndex*(this: Gff_StructEntry): uint32


##[
GFF (Generic File Format) is BioWare's universal container format for structured game data.
It is used by many KotOR file types including UTC (creature), UTI (item), DLG (dialogue),
ARE (area), GIT (game instance template), IFO (module info), and many others.

GFF uses a hierarchical structure with structs containing fields, which can be simple values,
nested structs, or lists of structs. The format supports version V3.2 (KotOR) and later
versions (V3.3, V4.0, V4.1) used in other BioWare games.

Binary Format Structure:
- File Header (56 bytes): File type signature (FourCC), version, counts, and offsets to all
  data tables (structs, fields, labels, field_data, field_indices, list_indices)
- Label Array: Array of 16-byte null-padded field name labels
- Struct Array: Array of struct entries (12 bytes each) - struct_id, data_or_offset, field_count
- Field Array: Array of field entries (12 bytes each) - field_type, label_index, data_or_offset
- Field Data: Storage area for complex field types (strings, binary, vectors, etc.)
- Field Indices Array: Array of field index arrays (used when structs have multiple fields)
- List Indices Array: Array of list entry structures (count + struct indices)

Field Types:
- Simple types (0-5, 8): Stored inline in data_or_offset (uint8, int8, uint16, int16, uint32,
  int32, float)
- Complex types (6-7, 9-13, 16-17): Offset to field_data section (uint64, int64, double, string,
  resref, localized_string, binary, vector4, vector3)
- Struct (14): Struct index stored inline (nested struct)
- List (15): Offset to list_indices_array (list of structs)

Struct Access Pattern:
1. Root struct is always at struct_array index 0
2. If struct.field_count == 1: data_or_offset contains direct field index
3. If struct.field_count > 1: data_or_offset contains offset into field_indices_array
4. Use field_index to access field_array entry
5. Use field.label_index to get field name from label_array
6. Use field.data_or_offset based on field_type (inline, offset, struct index, list offset)

References:
- https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md - Complete GFF format documentation
- https://github.com/OldRepublicDevs/PyKotor/wiki/Bioware-Aurora-GFF.md - Official BioWare Aurora GFF specification
- https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/itp.html - Tim Smith/Torlack's GFF/ITP documentation
- https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/gffreader.cpp - Complete C++ GFF reader implementation
- https://github.com/xoreos/xoreos/blob/master/src/aurora/gff3file.cpp - Generic Aurora GFF implementation (shared format)
- https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/GFFObject.ts - TypeScript GFF parser
- https://github.com/KotOR-Community-Patches/KotOR-Unity/blob/master/Assets/Scripts/FileObjects/GFFObject.cs - C# Unity GFF loader
- https://github.com/KotOR-Community-Patches/Kotor.NET/tree/master/Kotor.NET/Formats/KotorGFF/ - .NET GFF reader/writer
- https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff.py - PyKotor binary reader/writer
- https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/gff_data.py - GFF data model

]##
proc read*(_: typedesc[Gff], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gff =
  template this: untyped = result
  this = new(Gff)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  GFF file header (56 bytes total)
  ]##
  let headerExpr = Gff_GffHeader.read(this.io, this.root, this)
  this.header = headerExpr

proc fieldArray(this: Gff): Gff_FieldArray = 

  ##[
  Array of field entries (12 bytes each)
  ]##
  if this.fieldArrayInstFlag:
    return this.fieldArrayInst
  if this.header.fieldCount > 0:
    let pos = this.io.pos()
    this.io.seek(int(this.header.fieldOffset))
    let fieldArrayInstExpr = Gff_FieldArray.read(this.io, this.root, this)
    this.fieldArrayInst = fieldArrayInstExpr
    this.io.seek(pos)
  this.fieldArrayInstFlag = true
  return this.fieldArrayInst

proc fieldData(this: Gff): Gff_FieldData = 

  ##[
  Storage area for complex field types (strings, binary, vectors, etc.)
  ]##
  if this.fieldDataInstFlag:
    return this.fieldDataInst
  if this.header.fieldDataCount > 0:
    let pos = this.io.pos()
    this.io.seek(int(this.header.fieldDataOffset))
    let fieldDataInstExpr = Gff_FieldData.read(this.io, this.root, this)
    this.fieldDataInst = fieldDataInstExpr
    this.io.seek(pos)
  this.fieldDataInstFlag = true
  return this.fieldDataInst

proc fieldIndicesArray(this: Gff): Gff_FieldIndicesArray = 

  ##[
  Array of field index arrays (used when structs have multiple fields)
  ]##
  if this.fieldIndicesArrayInstFlag:
    return this.fieldIndicesArrayInst
  if this.header.fieldIndicesCount > 0:
    let pos = this.io.pos()
    this.io.seek(int(this.header.fieldIndicesOffset))
    let fieldIndicesArrayInstExpr = Gff_FieldIndicesArray.read(this.io, this.root, this)
    this.fieldIndicesArrayInst = fieldIndicesArrayInstExpr
    this.io.seek(pos)
  this.fieldIndicesArrayInstFlag = true
  return this.fieldIndicesArrayInst

proc labelArray(this: Gff): Gff_LabelArray = 

  ##[
  Array of 16-byte null-padded field name labels
  ]##
  if this.labelArrayInstFlag:
    return this.labelArrayInst
  if this.header.labelCount > 0:
    let pos = this.io.pos()
    this.io.seek(int(this.header.labelOffset))
    let labelArrayInstExpr = Gff_LabelArray.read(this.io, this.root, this)
    this.labelArrayInst = labelArrayInstExpr
    this.io.seek(pos)
  this.labelArrayInstFlag = true
  return this.labelArrayInst

proc listIndicesArray(this: Gff): Gff_ListIndicesArray = 

  ##[
  Array of list entry structures (count + struct indices)
  ]##
  if this.listIndicesArrayInstFlag:
    return this.listIndicesArrayInst
  if this.header.listIndicesCount > 0:
    let pos = this.io.pos()
    this.io.seek(int(this.header.listIndicesOffset))
    let listIndicesArrayInstExpr = Gff_ListIndicesArray.read(this.io, this.root, this)
    this.listIndicesArrayInst = listIndicesArrayInstExpr
    this.io.seek(pos)
  this.listIndicesArrayInstFlag = true
  return this.listIndicesArrayInst

proc rootStructResolved(this: Gff): Gff_ResolvedStruct = 

  ##[
  Convenience "decoded" view of the root struct (struct_array[0]).
This resolves field indices to field entries, resolves labels to strings,
and decodes field values (including nested structs and lists) into typed instances.

  ]##
  if this.rootStructResolvedInstFlag:
    return this.rootStructResolvedInst
  let rootStructResolvedInstExpr = Gff_ResolvedStruct.read(this.io, this.root, this, 0)
  this.rootStructResolvedInst = rootStructResolvedInstExpr
  this.rootStructResolvedInstFlag = true
  return this.rootStructResolvedInst

proc structArray(this: Gff): Gff_StructArray = 

  ##[
  Array of struct entries (12 bytes each)
  ]##
  if this.structArrayInstFlag:
    return this.structArrayInst
  if this.header.structCount > 0:
    let pos = this.io.pos()
    this.io.seek(int(this.header.structOffset))
    let structArrayInstExpr = Gff_StructArray.read(this.io, this.root, this)
    this.structArrayInst = structArrayInstExpr
    this.io.seek(pos)
  this.structArrayInstFlag = true
  return this.structArrayInst

proc fromFile*(_: typedesc[Gff], filename: string): Gff =
  Gff.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gff_FieldArray], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_FieldArray =
  template this: untyped = result
  this = new(Gff_FieldArray)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Array of field entries (12 bytes each)
  ]##
  for i in 0 ..< int(Gff(this.root).header.fieldCount):
    let it = Gff_FieldEntry.read(this.io, this.root, this)
    this.entries.add(it)

proc fromFile*(_: typedesc[Gff_FieldArray], filename: string): Gff_FieldArray =
  Gff_FieldArray.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gff_FieldData], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_FieldData =
  template this: untyped = result
  this = new(Gff_FieldData)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Raw field data storage. Individual field data entries are accessed via
field_entry.field_data_offset_value offsets. The structure of each entry
depends on the field_type:
- UInt64/Int64/Double: 8 bytes
- String: 4-byte length + string bytes
- ResRef: 1-byte length + string bytes (max 16)
- LocalizedString: variable (see bioware_common::bioware_locstring type)
- Binary: 4-byte length + binary bytes
- Vector3: 12 bytes (3×float)
- Vector4: 16 bytes (4×float)

  ]##
  let rawDataExpr = this.io.readBytes(int(Gff(this.root).header.fieldDataCount))
  this.rawData = rawDataExpr

proc fromFile*(_: typedesc[Gff_FieldData], filename: string): Gff_FieldData =
  Gff_FieldData.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gff_FieldEntry], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gff_FieldEntry =
  template this: untyped = result
  this = new(Gff_FieldEntry)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Field data type (see gff_field_type enum):
- 0-5, 8: Simple types (stored inline in data_or_offset)
- 6-7, 9-13, 16-17: Complex types (offset to field_data in data_or_offset)
- 14: Struct (struct index in data_or_offset)
- 15: List (offset to list_indices_array in data_or_offset)

  ]##
  let fieldTypeExpr = Gff_GffFieldType(this.io.readU4le())
  this.fieldType = fieldTypeExpr

  ##[
  Index into label_array for field name
  ]##
  let labelIndexExpr = this.io.readU4le()
  this.labelIndex = labelIndexExpr

  ##[
  Inline data (simple types) or offset/index (complex types):
- Simple types (0-5, 8): Value stored directly (1-4 bytes, sign/zero extended to 4 bytes)
- Complex types (6-7, 9-13, 16-17): Byte offset into field_data section (relative to field_data_offset)
- Struct (14): Struct index (index into struct_array)
- List (15): Byte offset into list_indices_array (relative to list_indices_offset)

  ]##
  let dataOrOffsetExpr = this.io.readU4le()
  this.dataOrOffset = dataOrOffsetExpr

proc fieldDataOffsetValue(this: Gff_FieldEntry): int = 

  ##[
  Absolute file offset to field data for complex types
  ]##
  if this.fieldDataOffsetValueInstFlag:
    return this.fieldDataOffsetValueInst
  if this.isComplexType:
    let fieldDataOffsetValueInstExpr = int(Gff(this.root).header.fieldDataOffset + this.dataOrOffset)
    this.fieldDataOffsetValueInst = fieldDataOffsetValueInstExpr
  this.fieldDataOffsetValueInstFlag = true
  return this.fieldDataOffsetValueInst

proc isComplexType(this: Gff_FieldEntry): bool = 

  ##[
  True if field stores data in field_data section
  ]##
  if this.isComplexTypeInstFlag:
    return this.isComplexTypeInst
  let isComplexTypeInstExpr = bool( ((this.fieldType == gff.uint64) or (this.fieldType == gff.int64) or (this.fieldType == gff.double) or (this.fieldType == gff.string) or (this.fieldType == gff.resref) or (this.fieldType == gff.localized_string) or (this.fieldType == gff.binary) or (this.fieldType == gff.vector4) or (this.fieldType == gff.vector3)) )
  this.isComplexTypeInst = isComplexTypeInstExpr
  this.isComplexTypeInstFlag = true
  return this.isComplexTypeInst

proc isListType(this: Gff_FieldEntry): bool = 

  ##[
  True if field is a list of structs
  ]##
  if this.isListTypeInstFlag:
    return this.isListTypeInst
  let isListTypeInstExpr = bool(this.fieldType == gff.list)
  this.isListTypeInst = isListTypeInstExpr
  this.isListTypeInstFlag = true
  return this.isListTypeInst

proc isSimpleType(this: Gff_FieldEntry): bool = 

  ##[
  True if field stores data inline (simple types)
  ]##
  if this.isSimpleTypeInstFlag:
    return this.isSimpleTypeInst
  let isSimpleTypeInstExpr = bool( ((this.fieldType == gff.uint8) or (this.fieldType == gff.int8) or (this.fieldType == gff.uint16) or (this.fieldType == gff.int16) or (this.fieldType == gff.uint32) or (this.fieldType == gff.int32) or (this.fieldType == gff.single)) )
  this.isSimpleTypeInst = isSimpleTypeInstExpr
  this.isSimpleTypeInstFlag = true
  return this.isSimpleTypeInst

proc isStructType(this: Gff_FieldEntry): bool = 

  ##[
  True if field is a nested struct
  ]##
  if this.isStructTypeInstFlag:
    return this.isStructTypeInst
  let isStructTypeInstExpr = bool(this.fieldType == gff.struct)
  this.isStructTypeInst = isStructTypeInstExpr
  this.isStructTypeInstFlag = true
  return this.isStructTypeInst

proc listIndicesOffsetValue(this: Gff_FieldEntry): int = 

  ##[
  Absolute file offset to list indices for list type fields
  ]##
  if this.listIndicesOffsetValueInstFlag:
    return this.listIndicesOffsetValueInst
  if this.isListType:
    let listIndicesOffsetValueInstExpr = int(Gff(this.root).header.listIndicesOffset + this.dataOrOffset)
    this.listIndicesOffsetValueInst = listIndicesOffsetValueInstExpr
  this.listIndicesOffsetValueInstFlag = true
  return this.listIndicesOffsetValueInst

proc structIndexValue(this: Gff_FieldEntry): uint32 = 

  ##[
  Struct index for struct type fields
  ]##
  if this.structIndexValueInstFlag:
    return this.structIndexValueInst
  if this.isStructType:
    let structIndexValueInstExpr = uint32(this.dataOrOffset)
    this.structIndexValueInst = structIndexValueInstExpr
  this.structIndexValueInstFlag = true
  return this.structIndexValueInst

proc fromFile*(_: typedesc[Gff_FieldEntry], filename: string): Gff_FieldEntry =
  Gff_FieldEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gff_FieldIndicesArray], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_FieldIndicesArray =
  template this: untyped = result
  this = new(Gff_FieldIndicesArray)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Array of field indices. When a struct has multiple fields, it stores an offset
into this array, and the next N consecutive u4 values (where N = struct.field_count)
are the field indices for that struct.

  ]##
  for i in 0 ..< int(Gff(this.root).header.fieldIndicesCount):
    let it = this.io.readU4le()
    this.indices.add(it)

proc fromFile*(_: typedesc[Gff_FieldIndicesArray], filename: string): Gff_FieldIndicesArray =
  Gff_FieldIndicesArray.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gff_GffHeader], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_GffHeader =
  template this: untyped = result
  this = new(Gff_GffHeader)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  File type signature (FourCC). Examples: "GFF ", "UTC ", "UTI ", "DLG ", "ARE ", etc.
Must match a valid GFFContent enum value.

  ]##
  let fileTypeExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.fileType = fileTypeExpr

  ##[
  File format version. Must be "V3.2" for KotOR games.
Later BioWare games use "V3.3", "V4.0", or "V4.1".
Valid values: "V3.2" (KotOR), "V3.3", "V4.0", "V4.1" (other BioWare games)

  ]##
  let fileVersionExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.fileVersion = fileVersionExpr

  ##[
  Byte offset to struct array from beginning of file
  ]##
  let structOffsetExpr = this.io.readU4le()
  this.structOffset = structOffsetExpr

  ##[
  Number of struct entries in struct array
  ]##
  let structCountExpr = this.io.readU4le()
  this.structCount = structCountExpr

  ##[
  Byte offset to field array from beginning of file
  ]##
  let fieldOffsetExpr = this.io.readU4le()
  this.fieldOffset = fieldOffsetExpr

  ##[
  Number of field entries in field array
  ]##
  let fieldCountExpr = this.io.readU4le()
  this.fieldCount = fieldCountExpr

  ##[
  Byte offset to label array from beginning of file
  ]##
  let labelOffsetExpr = this.io.readU4le()
  this.labelOffset = labelOffsetExpr

  ##[
  Number of labels in label array
  ]##
  let labelCountExpr = this.io.readU4le()
  this.labelCount = labelCountExpr

  ##[
  Byte offset to field data section from beginning of file
  ]##
  let fieldDataOffsetExpr = this.io.readU4le()
  this.fieldDataOffset = fieldDataOffsetExpr

  ##[
  Size of field data section in bytes
  ]##
  let fieldDataCountExpr = this.io.readU4le()
  this.fieldDataCount = fieldDataCountExpr

  ##[
  Byte offset to field indices array from beginning of file
  ]##
  let fieldIndicesOffsetExpr = this.io.readU4le()
  this.fieldIndicesOffset = fieldIndicesOffsetExpr

  ##[
  Number of field indices (total count across all structs with multiple fields)
  ]##
  let fieldIndicesCountExpr = this.io.readU4le()
  this.fieldIndicesCount = fieldIndicesCountExpr

  ##[
  Byte offset to list indices array from beginning of file
  ]##
  let listIndicesOffsetExpr = this.io.readU4le()
  this.listIndicesOffset = listIndicesOffsetExpr

  ##[
  Number of list indices entries
  ]##
  let listIndicesCountExpr = this.io.readU4le()
  this.listIndicesCount = listIndicesCountExpr

proc fromFile*(_: typedesc[Gff_GffHeader], filename: string): Gff_GffHeader =
  Gff_GffHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gff_LabelArray], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_LabelArray =
  template this: untyped = result
  this = new(Gff_LabelArray)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Array of label entries (16 bytes each)
  ]##
  for i in 0 ..< int(Gff(this.root).header.labelCount):
    let it = Gff_LabelEntry.read(this.io, this.root, this)
    this.labels.add(it)

proc fromFile*(_: typedesc[Gff_LabelArray], filename: string): Gff_LabelArray =
  Gff_LabelArray.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gff_LabelEntry], io: KaitaiStream, root: KaitaiStruct, parent: Gff_LabelArray): Gff_LabelEntry =
  template this: untyped = result
  this = new(Gff_LabelEntry)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Field name label (null-padded to 16 bytes, null-terminated).
The actual label length is determined by the first null byte.
Application code should trim trailing null bytes when using this field.

  ]##
  let nameExpr = encode(this.io.readBytes(int(16)), "ASCII")
  this.name = nameExpr

proc fromFile*(_: typedesc[Gff_LabelEntry], filename: string): Gff_LabelEntry =
  Gff_LabelEntry.read(newKaitaiFileStream(filename), nil, nil)


##[
Label entry as a null-terminated ASCII string within a fixed 16-byte field.
This avoids leaking trailing `\0` bytes into generated-code consumers.

]##
proc read*(_: typedesc[Gff_LabelEntryTerminated], io: KaitaiStream, root: KaitaiStruct, parent: Gff_ResolvedField): Gff_LabelEntryTerminated =
  template this: untyped = result
  this = new(Gff_LabelEntryTerminated)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = encode(this.io.readBytes(int(16)).bytesTerminate(0, false), "ASCII")
  this.name = nameExpr

proc fromFile*(_: typedesc[Gff_LabelEntryTerminated], filename: string): Gff_LabelEntryTerminated =
  Gff_LabelEntryTerminated.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gff_ListEntry], io: KaitaiStream, root: KaitaiStruct, parent: Gff_ResolvedField): Gff_ListEntry =
  template this: untyped = result
  this = new(Gff_ListEntry)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Number of struct indices in this list
  ]##
  let numStructIndicesExpr = this.io.readU4le()
  this.numStructIndices = numStructIndicesExpr

  ##[
  Array of struct indices (indices into struct_array)
  ]##
  for i in 0 ..< int(this.numStructIndices):
    let it = this.io.readU4le()
    this.structIndices.add(it)

proc fromFile*(_: typedesc[Gff_ListEntry], filename: string): Gff_ListEntry =
  Gff_ListEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gff_ListIndicesArray], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_ListIndicesArray =
  template this: untyped = result
  this = new(Gff_ListIndicesArray)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Raw list indices data. List entries are accessed via offsets stored in
list-type field entries (field_entry.list_indices_offset_value).
Each entry starts with a count (u4), followed by that many struct indices (u4 each).

Note: This is a raw data block. In practice, list entries are accessed via
offsets stored in list-type field entries, not as a sequential array.
Use list_entry type to parse individual entries at specific offsets.

  ]##
  let rawDataExpr = this.io.readBytes(int(Gff(this.root).header.listIndicesCount))
  this.rawData = rawDataExpr

proc fromFile*(_: typedesc[Gff_ListIndicesArray], filename: string): Gff_ListIndicesArray =
  Gff_ListIndicesArray.read(newKaitaiFileStream(filename), nil, nil)


##[
A decoded field: includes resolved label string and decoded typed value.
Exactly one `value_*` instance (or one of `value_struct` / `list_*`) will be non-null.

]##
proc read*(_: typedesc[Gff_ResolvedField], io: KaitaiStream, root: KaitaiStruct, parent: Gff_ResolvedStruct, fieldIndex: any): Gff_ResolvedField =
  template this: untyped = result
  this = new(Gff_ResolvedField)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent
  let fieldIndexExpr = uint32(fieldIndex)
  this.fieldIndex = fieldIndexExpr


proc entry(this: Gff_ResolvedField): Gff_FieldEntry = 

  ##[
  Raw field entry at field_index
  ]##
  if this.entryInstFlag:
    return this.entryInst
  let pos = this.io.pos()
  this.io.seek(int(Gff(this.root).header.fieldOffset + this.fieldIndex * 12))
  let entryInstExpr = Gff_FieldEntry.read(this.io, this.root, this)
  this.entryInst = entryInstExpr
  this.io.seek(pos)
  this.entryInstFlag = true
  return this.entryInst

proc fieldEntryPos(this: Gff_ResolvedField): int = 

  ##[
  Absolute file offset of this field entry (start of 12-byte record)
  ]##
  if this.fieldEntryPosInstFlag:
    return this.fieldEntryPosInst
  let fieldEntryPosInstExpr = int(Gff(this.root).header.fieldOffset + this.fieldIndex * 12)
  this.fieldEntryPosInst = fieldEntryPosInstExpr
  this.fieldEntryPosInstFlag = true
  return this.fieldEntryPosInst

proc label(this: Gff_ResolvedField): Gff_LabelEntryTerminated = 

  ##[
  Resolved field label string
  ]##
  if this.labelInstFlag:
    return this.labelInst
  let pos = this.io.pos()
  this.io.seek(int(Gff(this.root).header.labelOffset + this.entry.labelIndex * 16))
  let labelInstExpr = Gff_LabelEntryTerminated.read(this.io, this.root, this)
  this.labelInst = labelInstExpr
  this.io.seek(pos)
  this.labelInstFlag = true
  return this.labelInst

proc listEntry(this: Gff_ResolvedField): Gff_ListEntry = 

  ##[
  Parsed list entry at offset (list indices)
  ]##
  if this.listEntryInstFlag:
    return this.listEntryInst
  if this.entry.fieldType == gff.list:
    let pos = this.io.pos()
    this.io.seek(int(Gff(this.root).header.listIndicesOffset + this.entry.dataOrOffset))
    let listEntryInstExpr = Gff_ListEntry.read(this.io, this.root, this)
    this.listEntryInst = listEntryInstExpr
    this.io.seek(pos)
  this.listEntryInstFlag = true
  return this.listEntryInst

proc listStructs(this: Gff_ResolvedField): seq[Gff_ResolvedStruct] = 

  ##[
  Resolved structs referenced by this list
  ]##
  if this.listStructsInstFlag:
    return this.listStructsInst
  if this.entry.fieldType == gff.list:
    for i in 0 ..< int(this.listEntry.numStructIndices):
      let it = Gff_ResolvedStruct.read(this.io, this.root, this, this.listEntry.structIndices[i])
      this.listStructsInst.add(it)
  this.listStructsInstFlag = true
  return this.listStructsInst

proc valueBinary(this: Gff_ResolvedField): BiowareCommon_BiowareBinaryData = 
  if this.valueBinaryInstFlag:
    return this.valueBinaryInst
  if this.entry.fieldType == gff.binary:
    let pos = this.io.pos()
    this.io.seek(int(Gff(this.root).header.fieldDataOffset + this.entry.dataOrOffset))
    let valueBinaryInstExpr = BiowareCommon_BiowareBinaryData.read(this.io, nil, nil)
    this.valueBinaryInst = valueBinaryInstExpr
    this.io.seek(pos)
  this.valueBinaryInstFlag = true
  return this.valueBinaryInst

proc valueDouble(this: Gff_ResolvedField): float64 = 
  if this.valueDoubleInstFlag:
    return this.valueDoubleInst
  if this.entry.fieldType == gff.double:
    let pos = this.io.pos()
    this.io.seek(int(Gff(this.root).header.fieldDataOffset + this.entry.dataOrOffset))
    let valueDoubleInstExpr = this.io.readF8le()
    this.valueDoubleInst = valueDoubleInstExpr
    this.io.seek(pos)
  this.valueDoubleInstFlag = true
  return this.valueDoubleInst

proc valueInt16(this: Gff_ResolvedField): int16 = 
  if this.valueInt16InstFlag:
    return this.valueInt16Inst
  if this.entry.fieldType == gff.int16:
    let pos = this.io.pos()
    this.io.seek(int(this.fieldEntryPos + 8))
    let valueInt16InstExpr = this.io.readS2le()
    this.valueInt16Inst = valueInt16InstExpr
    this.io.seek(pos)
  this.valueInt16InstFlag = true
  return this.valueInt16Inst

proc valueInt32(this: Gff_ResolvedField): int32 = 
  if this.valueInt32InstFlag:
    return this.valueInt32Inst
  if this.entry.fieldType == gff.int32:
    let pos = this.io.pos()
    this.io.seek(int(this.fieldEntryPos + 8))
    let valueInt32InstExpr = this.io.readS4le()
    this.valueInt32Inst = valueInt32InstExpr
    this.io.seek(pos)
  this.valueInt32InstFlag = true
  return this.valueInt32Inst

proc valueInt64(this: Gff_ResolvedField): int64 = 
  if this.valueInt64InstFlag:
    return this.valueInt64Inst
  if this.entry.fieldType == gff.int64:
    let pos = this.io.pos()
    this.io.seek(int(Gff(this.root).header.fieldDataOffset + this.entry.dataOrOffset))
    let valueInt64InstExpr = this.io.readS8le()
    this.valueInt64Inst = valueInt64InstExpr
    this.io.seek(pos)
  this.valueInt64InstFlag = true
  return this.valueInt64Inst

proc valueInt8(this: Gff_ResolvedField): int8 = 
  if this.valueInt8InstFlag:
    return this.valueInt8Inst
  if this.entry.fieldType == gff.int8:
    let pos = this.io.pos()
    this.io.seek(int(this.fieldEntryPos + 8))
    let valueInt8InstExpr = this.io.readS1()
    this.valueInt8Inst = valueInt8InstExpr
    this.io.seek(pos)
  this.valueInt8InstFlag = true
  return this.valueInt8Inst

proc valueLocalizedString(this: Gff_ResolvedField): BiowareCommon_BiowareLocstring = 
  if this.valueLocalizedStringInstFlag:
    return this.valueLocalizedStringInst
  if this.entry.fieldType == gff.localized_string:
    let pos = this.io.pos()
    this.io.seek(int(Gff(this.root).header.fieldDataOffset + this.entry.dataOrOffset))
    let valueLocalizedStringInstExpr = BiowareCommon_BiowareLocstring.read(this.io, nil, nil)
    this.valueLocalizedStringInst = valueLocalizedStringInstExpr
    this.io.seek(pos)
  this.valueLocalizedStringInstFlag = true
  return this.valueLocalizedStringInst

proc valueResref(this: Gff_ResolvedField): BiowareCommon_BiowareResref = 
  if this.valueResrefInstFlag:
    return this.valueResrefInst
  if this.entry.fieldType == gff.resref:
    let pos = this.io.pos()
    this.io.seek(int(Gff(this.root).header.fieldDataOffset + this.entry.dataOrOffset))
    let valueResrefInstExpr = BiowareCommon_BiowareResref.read(this.io, nil, nil)
    this.valueResrefInst = valueResrefInstExpr
    this.io.seek(pos)
  this.valueResrefInstFlag = true
  return this.valueResrefInst

proc valueSingle(this: Gff_ResolvedField): float32 = 
  if this.valueSingleInstFlag:
    return this.valueSingleInst
  if this.entry.fieldType == gff.single:
    let pos = this.io.pos()
    this.io.seek(int(this.fieldEntryPos + 8))
    let valueSingleInstExpr = this.io.readF4le()
    this.valueSingleInst = valueSingleInstExpr
    this.io.seek(pos)
  this.valueSingleInstFlag = true
  return this.valueSingleInst

proc valueString(this: Gff_ResolvedField): BiowareCommon_BiowareCexoString = 
  if this.valueStringInstFlag:
    return this.valueStringInst
  if this.entry.fieldType == gff.string:
    let pos = this.io.pos()
    this.io.seek(int(Gff(this.root).header.fieldDataOffset + this.entry.dataOrOffset))
    let valueStringInstExpr = BiowareCommon_BiowareCexoString.read(this.io, nil, nil)
    this.valueStringInst = valueStringInstExpr
    this.io.seek(pos)
  this.valueStringInstFlag = true
  return this.valueStringInst

proc valueStruct(this: Gff_ResolvedField): Gff_ResolvedStruct = 

  ##[
  Nested struct (struct index = entry.data_or_offset)
  ]##
  if this.valueStructInstFlag:
    return this.valueStructInst
  if this.entry.fieldType == gff.struct:
    let valueStructInstExpr = Gff_ResolvedStruct.read(this.io, this.root, this, this.entry.dataOrOffset)
    this.valueStructInst = valueStructInstExpr
  this.valueStructInstFlag = true
  return this.valueStructInst

proc valueUint16(this: Gff_ResolvedField): uint16 = 
  if this.valueUint16InstFlag:
    return this.valueUint16Inst
  if this.entry.fieldType == gff.uint16:
    let pos = this.io.pos()
    this.io.seek(int(this.fieldEntryPos + 8))
    let valueUint16InstExpr = this.io.readU2le()
    this.valueUint16Inst = valueUint16InstExpr
    this.io.seek(pos)
  this.valueUint16InstFlag = true
  return this.valueUint16Inst

proc valueUint32(this: Gff_ResolvedField): uint32 = 
  if this.valueUint32InstFlag:
    return this.valueUint32Inst
  if this.entry.fieldType == gff.uint32:
    let pos = this.io.pos()
    this.io.seek(int(this.fieldEntryPos + 8))
    let valueUint32InstExpr = this.io.readU4le()
    this.valueUint32Inst = valueUint32InstExpr
    this.io.seek(pos)
  this.valueUint32InstFlag = true
  return this.valueUint32Inst

proc valueUint64(this: Gff_ResolvedField): uint64 = 
  if this.valueUint64InstFlag:
    return this.valueUint64Inst
  if this.entry.fieldType == gff.uint64:
    let pos = this.io.pos()
    this.io.seek(int(Gff(this.root).header.fieldDataOffset + this.entry.dataOrOffset))
    let valueUint64InstExpr = this.io.readU8le()
    this.valueUint64Inst = valueUint64InstExpr
    this.io.seek(pos)
  this.valueUint64InstFlag = true
  return this.valueUint64Inst

proc valueUint8(this: Gff_ResolvedField): uint8 = 
  if this.valueUint8InstFlag:
    return this.valueUint8Inst
  if this.entry.fieldType == gff.uint8:
    let pos = this.io.pos()
    this.io.seek(int(this.fieldEntryPos + 8))
    let valueUint8InstExpr = this.io.readU1()
    this.valueUint8Inst = valueUint8InstExpr
    this.io.seek(pos)
  this.valueUint8InstFlag = true
  return this.valueUint8Inst

proc valueVector3(this: Gff_ResolvedField): BiowareCommon_BiowareVector3 = 
  if this.valueVector3InstFlag:
    return this.valueVector3Inst
  if this.entry.fieldType == gff.vector3:
    let pos = this.io.pos()
    this.io.seek(int(Gff(this.root).header.fieldDataOffset + this.entry.dataOrOffset))
    let valueVector3InstExpr = BiowareCommon_BiowareVector3.read(this.io, nil, nil)
    this.valueVector3Inst = valueVector3InstExpr
    this.io.seek(pos)
  this.valueVector3InstFlag = true
  return this.valueVector3Inst

proc valueVector4(this: Gff_ResolvedField): BiowareCommon_BiowareVector4 = 
  if this.valueVector4InstFlag:
    return this.valueVector4Inst
  if this.entry.fieldType == gff.vector4:
    let pos = this.io.pos()
    this.io.seek(int(Gff(this.root).header.fieldDataOffset + this.entry.dataOrOffset))
    let valueVector4InstExpr = BiowareCommon_BiowareVector4.read(this.io, nil, nil)
    this.valueVector4Inst = valueVector4InstExpr
    this.io.seek(pos)
  this.valueVector4InstFlag = true
  return this.valueVector4Inst

proc fromFile*(_: typedesc[Gff_ResolvedField], filename: string): Gff_ResolvedField =
  Gff_ResolvedField.read(newKaitaiFileStream(filename), nil, nil)


##[
A decoded struct node: resolves field indices -> field entries -> typed values,
and recursively resolves nested structs and lists.

]##
proc read*(_: typedesc[Gff_ResolvedStruct], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, structIndex: any): Gff_ResolvedStruct =
  template this: untyped = result
  this = new(Gff_ResolvedStruct)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent
  let structIndexExpr = uint32(structIndex)
  this.structIndex = structIndexExpr


proc entry(this: Gff_ResolvedStruct): Gff_StructEntry = 

  ##[
  Raw struct entry at struct_index
  ]##
  if this.entryInstFlag:
    return this.entryInst
  let pos = this.io.pos()
  this.io.seek(int(Gff(this.root).header.structOffset + this.structIndex * 12))
  let entryInstExpr = Gff_StructEntry.read(this.io, this.root, this)
  this.entryInst = entryInstExpr
  this.io.seek(pos)
  this.entryInstFlag = true
  return this.entryInst

proc fieldIndices(this: Gff_ResolvedStruct): seq[uint32] = 

  ##[
  Field indices for this struct (only present when field_count > 1).
When field_count == 1, the single field index is stored directly in entry.data_or_offset.

  ]##
  if this.fieldIndicesInstFlag:
    return this.fieldIndicesInst
  if this.entry.fieldCount > 1:
    let pos = this.io.pos()
    this.io.seek(int(Gff(this.root).header.fieldIndicesOffset + this.entry.dataOrOffset))
    for i in 0 ..< int(this.entry.fieldCount):
      let it = this.io.readU4le()
      this.fieldIndicesInst.add(it)
    this.io.seek(pos)
  this.fieldIndicesInstFlag = true
  return this.fieldIndicesInst

proc fields(this: Gff_ResolvedStruct): seq[Gff_ResolvedField] = 

  ##[
  Resolved fields (multi-field struct)
  ]##
  if this.fieldsInstFlag:
    return this.fieldsInst
  if this.entry.fieldCount > 1:
    for i in 0 ..< int(this.entry.fieldCount):
      let it = Gff_ResolvedField.read(this.io, this.root, this, this.fieldIndices[i])
      this.fieldsInst.add(it)
  this.fieldsInstFlag = true
  return this.fieldsInst

proc singleField(this: Gff_ResolvedStruct): Gff_ResolvedField = 

  ##[
  Resolved field (single-field struct)
  ]##
  if this.singleFieldInstFlag:
    return this.singleFieldInst
  if this.entry.fieldCount == 1:
    let singleFieldInstExpr = Gff_ResolvedField.read(this.io, this.root, this, this.entry.dataOrOffset)
    this.singleFieldInst = singleFieldInstExpr
  this.singleFieldInstFlag = true
  return this.singleFieldInst

proc fromFile*(_: typedesc[Gff_ResolvedStruct], filename: string): Gff_ResolvedStruct =
  Gff_ResolvedStruct.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gff_StructArray], io: KaitaiStream, root: KaitaiStruct, parent: Gff): Gff_StructArray =
  template this: untyped = result
  this = new(Gff_StructArray)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Array of struct entries (12 bytes each)
  ]##
  for i in 0 ..< int(Gff(this.root).header.structCount):
    let it = Gff_StructEntry.read(this.io, this.root, this)
    this.entries.add(it)

proc fromFile*(_: typedesc[Gff_StructArray], filename: string): Gff_StructArray =
  Gff_StructArray.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gff_StructEntry], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gff_StructEntry =
  template this: untyped = result
  this = new(Gff_StructEntry)
  let root = if root == nil: cast[Gff](this) else: cast[Gff](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Structure type identifier. Often 0xFFFFFFFF (-1) for generic structs.
Used to identify struct types in schema-aware parsers.

  ]##
  let structIdExpr = this.io.readS4le()
  this.structId = structIdExpr

  ##[
  Field index (if field_count == 1) or byte offset to field indices array (if field_count > 1).
If field_count == 0, this value is unused.

  ]##
  let dataOrOffsetExpr = this.io.readU4le()
  this.dataOrOffset = dataOrOffsetExpr

  ##[
  Number of fields in this struct:
- 0: No fields
- 1: Single field, data_or_offset contains the field index directly
- >1: Multiple fields, data_or_offset contains byte offset into field_indices_array

  ]##
  let fieldCountExpr = this.io.readU4le()
  this.fieldCount = fieldCountExpr

proc fieldIndicesOffset(this: Gff_StructEntry): uint32 = 

  ##[
  Byte offset into field_indices_array when struct has multiple fields
  ]##
  if this.fieldIndicesOffsetInstFlag:
    return this.fieldIndicesOffsetInst
  if this.hasMultipleFields:
    let fieldIndicesOffsetInstExpr = uint32(this.dataOrOffset)
    this.fieldIndicesOffsetInst = fieldIndicesOffsetInstExpr
  this.fieldIndicesOffsetInstFlag = true
  return this.fieldIndicesOffsetInst

proc hasMultipleFields(this: Gff_StructEntry): bool = 

  ##[
  True if struct has multiple fields (offset to field indices in data_or_offset)
  ]##
  if this.hasMultipleFieldsInstFlag:
    return this.hasMultipleFieldsInst
  let hasMultipleFieldsInstExpr = bool(this.fieldCount > 1)
  this.hasMultipleFieldsInst = hasMultipleFieldsInstExpr
  this.hasMultipleFieldsInstFlag = true
  return this.hasMultipleFieldsInst

proc hasSingleField(this: Gff_StructEntry): bool = 

  ##[
  True if struct has exactly one field (direct field index in data_or_offset)
  ]##
  if this.hasSingleFieldInstFlag:
    return this.hasSingleFieldInst
  let hasSingleFieldInstExpr = bool(this.fieldCount == 1)
  this.hasSingleFieldInst = hasSingleFieldInstExpr
  this.hasSingleFieldInstFlag = true
  return this.hasSingleFieldInst

proc singleFieldIndex(this: Gff_StructEntry): uint32 = 

  ##[
  Direct field index when struct has exactly one field
  ]##
  if this.singleFieldIndexInstFlag:
    return this.singleFieldIndexInst
  if this.hasSingleField:
    let singleFieldIndexInstExpr = uint32(this.dataOrOffset)
    this.singleFieldIndexInst = singleFieldIndexInstExpr
  this.singleFieldIndexInstFlag = true
  return this.singleFieldIndexInst

proc fromFile*(_: typedesc[Gff_StructEntry], filename: string): Gff_StructEntry =
  Gff_StructEntry.read(newKaitaiFileStream(filename), nil, nil)

