from construct import *
from construct.lib import *

fac_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = fac_xml
