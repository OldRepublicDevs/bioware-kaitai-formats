from construct import *
from construct.lib import *

twoda_json = Struct(
	'json_content' / GreedyString(encoding='UTF-8'),
)

_schema = twoda_json
