from construct import *
from construct.lib import *

uti_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = uti_xml
