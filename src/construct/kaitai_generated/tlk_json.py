from construct import *
from construct.lib import *

tlk_json = Struct(
	'json_content' / GreedyString(encoding='UTF-8'),
)

_schema = tlk_json
