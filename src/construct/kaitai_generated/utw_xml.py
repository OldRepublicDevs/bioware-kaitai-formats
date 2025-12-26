from construct import *
from construct.lib import *

utw_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = utw_xml
