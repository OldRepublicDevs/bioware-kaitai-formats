from construct import *
from construct.lib import *

lyt__artplaceable_entry = Struct(
)

lyt__doorhook_entry_pykotor = Struct(
)

lyt__doorhook_entry_xoreos = Struct(
)

lyt__obstacle_entry = Struct(
)

lyt__room_entry = Struct(
)

lyt__track_entry = Struct(
)

lyt__walkmesh_room_entry = Struct(
)

lyt = Struct(
	'raw_content' / GreedyString(encoding='ASCII'),
)

_schema = lyt
