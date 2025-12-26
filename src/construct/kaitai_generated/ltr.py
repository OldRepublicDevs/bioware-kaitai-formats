from construct import *
from construct.lib import *

ltr__double_letter_blocks_array = Struct(
	'blocks' / Array(this._root.letter_count, LazyBound(lambda: ltr__letter_block)),
)

ltr__letter_block = Struct(
	'start_probabilities' / Array(this._root.letter_count, Float32l),
	'middle_probabilities' / Array(this._root.letter_count, Float32l),
	'end_probabilities' / Array(this._root.letter_count, Float32l),
)

ltr__triple_letter_blocks_array = Struct(
	'rows' / Array(this._root.letter_count, LazyBound(lambda: ltr__triple_letter_row)),
)

ltr__triple_letter_row = Struct(
	'blocks' / Array(this._root.letter_count, LazyBound(lambda: ltr__letter_block)),
)

ltr = Struct(
	'file_type' / FixedSized(4, GreedyString(encoding='ASCII')),
	'file_version' / FixedSized(4, GreedyString(encoding='ASCII')),
	'letter_count' / Int8ub,
	'single_letter_block' / LazyBound(lambda: ltr__letter_block),
	'double_letter_blocks' / LazyBound(lambda: ltr__double_letter_blocks_array),
	'triple_letter_blocks' / LazyBound(lambda: ltr__triple_letter_blocks_array),
)

_schema = ltr
