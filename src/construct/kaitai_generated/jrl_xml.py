from construct import *
from construct.lib import *

jrl_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = jrl_xml
