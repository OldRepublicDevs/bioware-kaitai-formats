from construct import *
from construct.lib import *

ssf_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = ssf_xml
