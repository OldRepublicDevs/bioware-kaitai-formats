from construct import *
from construct.lib import *

ute_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = ute_xml
