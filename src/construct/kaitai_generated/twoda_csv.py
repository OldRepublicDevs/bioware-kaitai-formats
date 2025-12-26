from construct import *
from construct.lib import *

twoda_csv = Struct(
	'csv_content' / GreedyString(encoding='UTF-8'),
)

_schema = twoda_csv
