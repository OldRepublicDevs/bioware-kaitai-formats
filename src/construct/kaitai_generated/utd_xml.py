from construct import *
from construct.lib import *

utd_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = utd_xml
