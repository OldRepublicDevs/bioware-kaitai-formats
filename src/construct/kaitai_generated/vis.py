from construct import *
from construct.lib import *

vis = Struct(
	'raw_content' / GreedyString(encoding='ASCII'),
)

_schema = vis
