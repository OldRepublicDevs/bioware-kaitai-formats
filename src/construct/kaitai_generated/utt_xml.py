from construct import *
from construct.lib import *

utt_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = utt_xml
