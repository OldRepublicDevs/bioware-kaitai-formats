from construct import *
from construct.lib import *

mdx = Struct(
	'vertex_data' / GreedyRange(Int8ub),
)

_schema = mdx
