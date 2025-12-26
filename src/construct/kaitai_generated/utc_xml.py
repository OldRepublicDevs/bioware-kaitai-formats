from construct import *
from construct.lib import *

utc_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = utc_xml
