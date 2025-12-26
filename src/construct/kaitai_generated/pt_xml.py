from construct import *
from construct.lib import *

pt_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = pt_xml
