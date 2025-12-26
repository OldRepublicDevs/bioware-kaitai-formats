from construct import *
from construct.lib import *

tlk_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = tlk_xml
