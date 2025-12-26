from construct import *
from construct.lib import *

ncs_minimal__instruction = Struct(
	'bytecode' / Int8ub,
	'qualifier' / Int8ub,
)

ncs_minimal = Struct(
	'file_type' / FixedSized(4, GreedyString(encoding='ASCII')),
	'file_version' / FixedSized(4, GreedyString(encoding='ASCII')),
	'size_marker' / Int8ub,
	'total_file_size' / Int32ub,
	'instructions' / RepeatUntil(lambda obj_, list_, this: stream_tell(_io) >= this._root.total_file_size, LazyBound(lambda: ncs_minimal__instruction)),
)

_schema = ncs_minimal
