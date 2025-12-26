from construct import *
from construct.lib import *

dlg_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = dlg_xml
