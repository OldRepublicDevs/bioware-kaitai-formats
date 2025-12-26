from construct import *
from construct.lib import *

gff_json = Struct(
	'json_content' / GreedyString(encoding='UTF-8'),
)

_schema = gff_json
