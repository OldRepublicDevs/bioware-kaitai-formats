from construct import *
from construct.lib import *

ifo_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = ifo_xml
