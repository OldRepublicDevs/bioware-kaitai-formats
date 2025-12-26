from construct import *
from construct.lib import *
import enum

class gff__gff_field_type(enum.IntEnum):
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

gff__field_array = Struct(
	'entries' / Array(this._root.header.field_count, LazyBound(lambda: gff__field_entry)),
)

gff__field_data = Struct(
	'raw_data' / FixedSized(this._root.header.field_data_count, GreedyBytes),
)

gff__field_entry = Struct(
	'field_type' / Enum(Int32ul, gff__gff_field_type),
	'label_index' / Int32ul,
	'data_or_offset' / Int32ul,
	'field_data_offset_value' / If(this.is_complex_type, Computed(lambda this: this._root.header.field_data_offset + this.data_or_offset)),
	'is_complex_type' / Computed(lambda this:  ((this.field_type == 'uint64') or (this.field_type == 'int64') or (this.field_type == 'double') or (this.field_type == 'string') or (this.field_type == 'resref') or (this.field_type == 'localized_string') or (this.field_type == 'binary') or (this.field_type == 'vector4') or (this.field_type == 'vector3')) ),
	'is_list_type' / Computed(lambda this: this.field_type == 'list'),
	'is_simple_type' / Computed(lambda this:  ((this.field_type == 'uint8') or (this.field_type == 'int8') or (this.field_type == 'uint16') or (this.field_type == 'int16') or (this.field_type == 'uint32') or (this.field_type == 'int32') or (this.field_type == 'single')) ),
	'is_struct_type' / Computed(lambda this: this.field_type == 'struct'),
	'list_indices_offset_value' / If(this.is_list_type, Computed(lambda this: this._root.header.list_indices_offset + this.data_or_offset)),
	'struct_index_value' / If(this.is_struct_type, Computed(lambda this: this.data_or_offset)),
)

gff__field_indices_array = Struct(
	'indices' / Array(this._root.header.field_indices_count, Int32ul),
)

gff__gff_header = Struct(
	'file_type' / FixedSized(4, GreedyString(encoding='ASCII')),
	'file_version' / FixedSized(4, GreedyString(encoding='ASCII')),
	'struct_offset' / Int32ul,
	'struct_count' / Int32ul,
	'field_offset' / Int32ul,
	'field_count' / Int32ul,
	'label_offset' / Int32ul,
	'label_count' / Int32ul,
	'field_data_offset' / Int32ul,
	'field_data_count' / Int32ul,
	'field_indices_offset' / Int32ul,
	'field_indices_count' / Int32ul,
	'list_indices_offset' / Int32ul,
	'list_indices_count' / Int32ul,
)

gff__label_array = Struct(
	'labels' / Array(this._root.header.label_count, LazyBound(lambda: gff__label_entry)),
)

gff__label_entry = Struct(
	'name' / FixedSized(16, GreedyString(encoding='ASCII')),
)

gff__label_entry_terminated = Struct(
	'name' / FixedSized(16, NullTerminated(GreedyString(encoding='ASCII'), term=b"\x00", include=False)),
)

gff__list_entry = Struct(
	'num_struct_indices' / Int32ul,
	'struct_indices' / Array(this.num_struct_indices, Int32ul),
)

gff__list_indices_array = Struct(
	'raw_data' / FixedSized(this._root.header.list_indices_count, GreedyBytes),
)

gff__resolved_field = Struct(
	'entry' / Pointer(this._root.header.field_offset + this.field_index * 12, LazyBound(lambda: gff__field_entry)),
	'field_entry_pos' / Computed(lambda this: this._root.header.field_offset + this.field_index * 12),
	'label' / Pointer(this._root.header.label_offset + this.entry.label_index * 16, LazyBound(lambda: gff__label_entry_terminated)),
	'list_entry' / Pointer(this._root.header.list_indices_offset + this.entry.data_or_offset, If(this.entry.field_type == 'list', LazyBound(lambda: gff__list_entry))),
	'list_structs' / If(this.entry.field_type == 'list', Array(this.list_entry.num_struct_indices, LazyBound(lambda: gff__resolved_struct))),
	'value_binary' / Pointer(this._root.header.field_data_offset + this.entry.data_or_offset, If(this.entry.field_type == 'binary', LazyBound(lambda: bioware_common__bioware_binary_data))),
	'value_double' / Pointer(this._root.header.field_data_offset + this.entry.data_or_offset, If(this.entry.field_type == 'double', Float64l)),
	'value_int16' / Pointer(this.field_entry_pos + 8, If(this.entry.field_type == 'int16', Int16sl)),
	'value_int32' / Pointer(this.field_entry_pos + 8, If(this.entry.field_type == 'int32', Int32sl)),
	'value_int64' / Pointer(this._root.header.field_data_offset + this.entry.data_or_offset, If(this.entry.field_type == 'int64', Int64sl)),
	'value_int8' / Pointer(this.field_entry_pos + 8, If(this.entry.field_type == 'int8', Int8sb)),
	'value_localized_string' / Pointer(this._root.header.field_data_offset + this.entry.data_or_offset, If(this.entry.field_type == 'localized_string', LazyBound(lambda: bioware_common__bioware_locstring))),
	'value_resref' / Pointer(this._root.header.field_data_offset + this.entry.data_or_offset, If(this.entry.field_type == 'resref', LazyBound(lambda: bioware_common__bioware_resref))),
	'value_single' / Pointer(this.field_entry_pos + 8, If(this.entry.field_type == 'single', Float32l)),
	'value_string' / Pointer(this._root.header.field_data_offset + this.entry.data_or_offset, If(this.entry.field_type == 'string', LazyBound(lambda: bioware_common__bioware_cexo_string))),
	'value_struct' / If(this.entry.field_type == 'struct', LazyBound(lambda: gff__resolved_struct)),
	'value_uint16' / Pointer(this.field_entry_pos + 8, If(this.entry.field_type == 'uint16', Int16ul)),
	'value_uint32' / Pointer(this.field_entry_pos + 8, If(this.entry.field_type == 'uint32', Int32ul)),
	'value_uint64' / Pointer(this._root.header.field_data_offset + this.entry.data_or_offset, If(this.entry.field_type == 'uint64', Int64ul)),
	'value_uint8' / Pointer(this.field_entry_pos + 8, If(this.entry.field_type == 'uint8', Int8ub)),
	'value_vector3' / Pointer(this._root.header.field_data_offset + this.entry.data_or_offset, If(this.entry.field_type == 'vector3', LazyBound(lambda: bioware_common__bioware_vector3))),
	'value_vector4' / Pointer(this._root.header.field_data_offset + this.entry.data_or_offset, If(this.entry.field_type == 'vector4', LazyBound(lambda: bioware_common__bioware_vector4))),
)

gff__resolved_struct = Struct(
	'entry' / Pointer(this._root.header.struct_offset + this.struct_index * 12, LazyBound(lambda: gff__struct_entry)),
	'field_indices' / Pointer(this._root.header.field_indices_offset + this.entry.data_or_offset, If(this.entry.field_count > 1, Array(this.entry.field_count, Int32ul))),
	'fields' / If(this.entry.field_count > 1, Array(this.entry.field_count, LazyBound(lambda: gff__resolved_field))),
	'single_field' / If(this.entry.field_count == 1, LazyBound(lambda: gff__resolved_field)),
)

gff__struct_array = Struct(
	'entries' / Array(this._root.header.struct_count, LazyBound(lambda: gff__struct_entry)),
)

gff__struct_entry = Struct(
	'struct_id' / Int32sl,
	'data_or_offset' / Int32ul,
	'field_count' / Int32ul,
	'field_indices_offset' / If(this.has_multiple_fields, Computed(lambda this: this.data_or_offset)),
	'has_multiple_fields' / Computed(lambda this: this.field_count > 1),
	'has_single_field' / Computed(lambda this: this.field_count == 1),
	'single_field_index' / If(this.has_single_field, Computed(lambda this: this.data_or_offset)),
)

gff = Struct(
	'header' / LazyBound(lambda: gff__gff_header),
	'field_array' / Pointer(this.header.field_offset, If(this.header.field_count > 0, LazyBound(lambda: gff__field_array))),
	'field_data' / Pointer(this.header.field_data_offset, If(this.header.field_data_count > 0, LazyBound(lambda: gff__field_data))),
	'field_indices_array' / Pointer(this.header.field_indices_offset, If(this.header.field_indices_count > 0, LazyBound(lambda: gff__field_indices_array))),
	'label_array' / Pointer(this.header.label_offset, If(this.header.label_count > 0, LazyBound(lambda: gff__label_array))),
	'list_indices_array' / Pointer(this.header.list_indices_offset, If(this.header.list_indices_count > 0, LazyBound(lambda: gff__list_indices_array))),
	'root_struct_resolved' / LazyBound(lambda: gff__resolved_struct),
	'struct_array' / Pointer(this.header.struct_offset, If(this.header.struct_count > 0, LazyBound(lambda: gff__struct_array))),
)

_schema = gff
