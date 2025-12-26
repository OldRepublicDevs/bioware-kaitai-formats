from construct import *
from construct.lib import *

cnv_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = cnv_xml
