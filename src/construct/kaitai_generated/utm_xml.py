from construct import *
from construct.lib import *

utm_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = utm_xml
