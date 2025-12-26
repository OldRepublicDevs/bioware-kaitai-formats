from construct import *
from construct.lib import *
import enum

class lip__lip_shapes(enum.IntEnum):
	neutral = 0
	ee = 1
	eh = 2
	ah = 3
	oh = 4
	ooh = 5
	y = 6
	sts = 7
	fv = 8
	ng = 9
	th = 10
	mpb = 11
	td = 12
	sh = 13
	l = 14
	kg = 15

lip__keyframe_entry = Struct(
	'timestamp' / Float32l,
	'shape' / Enum(Int8ub, lip__lip_shapes),
)

lip = Struct(
	'file_type' / FixedSized(4, GreedyString(encoding='ASCII')),
	'file_version' / FixedSized(4, GreedyString(encoding='ASCII')),
	'length' / Float32l,
	'num_keyframes' / Int32ul,
	'keyframes' / Array(this.num_keyframes, LazyBound(lambda: lip__keyframe_entry)),
)

_schema = lip
