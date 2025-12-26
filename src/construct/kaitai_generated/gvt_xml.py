from construct import *
from construct.lib import *

gvt_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = gvt_xml
