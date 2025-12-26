from construct import *
from construct.lib import *

res_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = res_xml
