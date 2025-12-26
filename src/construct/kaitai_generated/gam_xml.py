from construct import *
from construct.lib import *

gam_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = gam_xml
