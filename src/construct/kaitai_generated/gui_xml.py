from construct import *
from construct.lib import *

gui_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = gui_xml
