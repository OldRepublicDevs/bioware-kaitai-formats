from construct import *
from construct.lib import *

ncs__instruction = Struct(
	'opcode' / Int8ub,
	'qualifier' / Int8ub,
	'arguments' / RepeatUntil(lambda obj_, list_, this: stream_tell(_io) >= stream_size(_io), Int8ub),
)

ncs = Struct(
	'file_type' / FixedSized(4, GreedyString(encoding='ASCII')),
	'file_version' / FixedSized(4, GreedyString(encoding='ASCII')),
	'size_marker' / Int8ub,
	'file_size' / Int32ub,
	'instructions' / RepeatUntil(lambda obj_, list_, this: stream_tell(_io) >= this.file_size, LazyBound(lambda: ncs__instruction)),
)

_schema = ncs
