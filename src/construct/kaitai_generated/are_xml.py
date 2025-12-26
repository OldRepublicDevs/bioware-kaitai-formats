from construct import *
from construct.lib import *

are_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = are_xml
