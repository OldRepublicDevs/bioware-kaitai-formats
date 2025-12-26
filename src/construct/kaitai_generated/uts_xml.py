from construct import *
from construct.lib import *

uts_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = uts_xml
