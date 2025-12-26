from construct import *
from construct.lib import *

gff_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = gff_xml
