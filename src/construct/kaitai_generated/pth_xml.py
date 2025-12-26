from construct import *
from construct.lib import *

pth_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = pth_xml
