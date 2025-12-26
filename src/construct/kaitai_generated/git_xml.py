from construct import *
from construct.lib import *

git_xml = Struct(
	'xml_content' / GreedyString(encoding='UTF-8'),
)

_schema = git_xml
