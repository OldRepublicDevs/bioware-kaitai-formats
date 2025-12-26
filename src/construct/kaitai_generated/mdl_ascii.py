from construct import *
from construct.lib import *
import enum

class mdl_ascii__controller_type_common(enum.IntEnum):
	position = 8
	orientation = 20
	scale = 36
	alpha = 132

class mdl_ascii__controller_type_emitter(enum.IntEnum):
	alpha_end = 80
	alpha_start = 84
	birthrate = 88
	bounce_co = 92
	combinetime = 96
	drag = 100
	fps = 104
	frame_end = 108
	frame_start = 112
	grav = 116
	life_exp = 120
	mass = 124
	p2p_bezier2 = 128
	p2p_bezier3 = 132
	particle_rot = 136
	randvel = 140
	size_start = 144
	size_end = 148
	size_start_y = 152
	size_end_y = 156
	spread = 160
	threshold = 164
	velocity = 168
	xsize = 172
	ysize = 176
	blurlength = 180
	lightning_delay = 184
	lightning_radius = 188
	lightning_scale = 192
	lightning_sub_div = 196
	lightningzigzag = 200
	alpha_mid = 216
	percent_start = 220
	percent_mid = 224
	percent_end = 228
	size_mid = 232
	size_mid_y = 236
	m_f_random_birth_rate = 240
	targetsize = 252
	numcontrolpts = 256
	controlptradius = 260
	controlptdelay = 264
	tangentspread = 268
	tangentlength = 272
	color_mid = 284
	color_end = 380
	color_start = 392
	detonate = 502

class mdl_ascii__controller_type_light(enum.IntEnum):
	color = 76
	radius = 88
	shadowradius = 96
	verticaldisplacement = 100
	multiplier = 140

class mdl_ascii__controller_type_mesh(enum.IntEnum):
	selfillumcolor = 100

class mdl_ascii__model_classification(enum.IntEnum):
	other = 0
	effect = 1
	tile = 2
	character = 4
	door = 8
	lightsaber = 16
	placeable = 32
	flyer = 64

class mdl_ascii__node_type(enum.IntEnum):
	dummy = 1
	light = 3
	emitter = 5
	reference = 17
	trimesh = 33
	skinmesh = 97
	animmesh = 161
	danglymesh = 289
	aabb = 545
	lightsaber = 2081

mdl_ascii__animation_section = Struct(
	'newanim' / LazyBound(lambda: mdl_ascii__line_text),
	'doneanim' / LazyBound(lambda: mdl_ascii__line_text),
	'length' / LazyBound(lambda: mdl_ascii__line_text),
	'transtime' / LazyBound(lambda: mdl_ascii__line_text),
	'animroot' / LazyBound(lambda: mdl_ascii__line_text),
	'event' / LazyBound(lambda: mdl_ascii__line_text),
	'eventlist' / LazyBound(lambda: mdl_ascii__line_text),
	'endlist' / LazyBound(lambda: mdl_ascii__line_text),
)

mdl_ascii__ascii_line = Struct(
	'content' / NullTerminated(GreedyString(encoding='UTF-8'), term=b"\x0A", include=False, consume=True),
)

mdl_ascii__controller_bezier = Struct(
	'controller_name' / LazyBound(lambda: mdl_ascii__line_text),
	'keyframes' / GreedyRange(LazyBound(lambda: mdl_ascii__controller_bezier_keyframe)),
)

mdl_ascii__controller_bezier_keyframe = Struct(
	'time' / GreedyString(encoding='UTF-8'),
	'value_data' / GreedyString(encoding='UTF-8'),
)

mdl_ascii__controller_keyed = Struct(
	'controller_name' / LazyBound(lambda: mdl_ascii__line_text),
	'keyframes' / GreedyRange(LazyBound(lambda: mdl_ascii__controller_keyframe)),
)

mdl_ascii__controller_keyframe = Struct(
	'time' / GreedyString(encoding='UTF-8'),
	'values' / GreedyString(encoding='UTF-8'),
)

mdl_ascii__controller_single = Struct(
	'controller_name' / LazyBound(lambda: mdl_ascii__line_text),
	'values' / LazyBound(lambda: mdl_ascii__line_text),
)

mdl_ascii__danglymesh_properties = Struct(
	'displacement' / LazyBound(lambda: mdl_ascii__line_text),
	'tightness' / LazyBound(lambda: mdl_ascii__line_text),
	'period' / LazyBound(lambda: mdl_ascii__line_text),
)

mdl_ascii__data_arrays = Struct(
	'verts' / LazyBound(lambda: mdl_ascii__line_text),
	'faces' / LazyBound(lambda: mdl_ascii__line_text),
	'tverts' / LazyBound(lambda: mdl_ascii__line_text),
	'tverts1' / LazyBound(lambda: mdl_ascii__line_text),
	'lightmaptverts' / LazyBound(lambda: mdl_ascii__line_text),
	'tverts2' / LazyBound(lambda: mdl_ascii__line_text),
	'tverts3' / LazyBound(lambda: mdl_ascii__line_text),
	'texindices1' / LazyBound(lambda: mdl_ascii__line_text),
	'texindices2' / LazyBound(lambda: mdl_ascii__line_text),
	'texindices3' / LazyBound(lambda: mdl_ascii__line_text),
	'colors' / LazyBound(lambda: mdl_ascii__line_text),
	'colorindices' / LazyBound(lambda: mdl_ascii__line_text),
	'weights' / LazyBound(lambda: mdl_ascii__line_text),
	'constraints' / LazyBound(lambda: mdl_ascii__line_text),
	'aabb' / LazyBound(lambda: mdl_ascii__line_text),
	'saber_verts' / LazyBound(lambda: mdl_ascii__line_text),
	'saber_norms' / LazyBound(lambda: mdl_ascii__line_text),
	'name' / LazyBound(lambda: mdl_ascii__line_text),
)

mdl_ascii__emitter_flags = Struct(
	'p2p' / LazyBound(lambda: mdl_ascii__line_text),
	'p2p_sel' / LazyBound(lambda: mdl_ascii__line_text),
	'affected_by_wind' / LazyBound(lambda: mdl_ascii__line_text),
	'm_is_tinted' / LazyBound(lambda: mdl_ascii__line_text),
	'bounce' / LazyBound(lambda: mdl_ascii__line_text),
	'random' / LazyBound(lambda: mdl_ascii__line_text),
	'inherit' / LazyBound(lambda: mdl_ascii__line_text),
	'inheritvel' / LazyBound(lambda: mdl_ascii__line_text),
	'inherit_local' / LazyBound(lambda: mdl_ascii__line_text),
	'splat' / LazyBound(lambda: mdl_ascii__line_text),
	'inherit_part' / LazyBound(lambda: mdl_ascii__line_text),
	'depth_texture' / LazyBound(lambda: mdl_ascii__line_text),
	'emitterflag13' / LazyBound(lambda: mdl_ascii__line_text),
)

mdl_ascii__emitter_properties = Struct(
	'deadspace' / LazyBound(lambda: mdl_ascii__line_text),
	'blast_radius' / LazyBound(lambda: mdl_ascii__line_text),
	'blast_length' / LazyBound(lambda: mdl_ascii__line_text),
	'num_branches' / LazyBound(lambda: mdl_ascii__line_text),
	'controlptsmoothing' / LazyBound(lambda: mdl_ascii__line_text),
	'xgrid' / LazyBound(lambda: mdl_ascii__line_text),
	'ygrid' / LazyBound(lambda: mdl_ascii__line_text),
	'spawntype' / LazyBound(lambda: mdl_ascii__line_text),
	'update' / LazyBound(lambda: mdl_ascii__line_text),
	'render' / LazyBound(lambda: mdl_ascii__line_text),
	'blend' / LazyBound(lambda: mdl_ascii__line_text),
	'texture' / LazyBound(lambda: mdl_ascii__line_text),
	'chunkname' / LazyBound(lambda: mdl_ascii__line_text),
	'twosidedtex' / LazyBound(lambda: mdl_ascii__line_text),
	'loop' / LazyBound(lambda: mdl_ascii__line_text),
	'renderorder' / LazyBound(lambda: mdl_ascii__line_text),
	'm_b_frame_blending' / LazyBound(lambda: mdl_ascii__line_text),
	'm_s_depth_texture_name' / LazyBound(lambda: mdl_ascii__line_text),
)

mdl_ascii__light_properties = Struct(
	'flareradius' / LazyBound(lambda: mdl_ascii__line_text),
	'flarepositions' / LazyBound(lambda: mdl_ascii__line_text),
	'flaresizes' / LazyBound(lambda: mdl_ascii__line_text),
	'flarecolorshifts' / LazyBound(lambda: mdl_ascii__line_text),
	'texturenames' / LazyBound(lambda: mdl_ascii__line_text),
	'ambientonly' / LazyBound(lambda: mdl_ascii__line_text),
	'ndynamictype' / LazyBound(lambda: mdl_ascii__line_text),
	'affectdynamic' / LazyBound(lambda: mdl_ascii__line_text),
	'flare' / LazyBound(lambda: mdl_ascii__line_text),
	'lightpriority' / LazyBound(lambda: mdl_ascii__line_text),
	'fadinglight' / LazyBound(lambda: mdl_ascii__line_text),
)

mdl_ascii__line_text = Struct(
	'value' / NullTerminated(GreedyString(encoding='UTF-8'), term=b"\x0A", include=False, consume=True),
)

mdl_ascii__reference_properties = Struct(
	'refmodel' / LazyBound(lambda: mdl_ascii__line_text),
	'reattachable' / LazyBound(lambda: mdl_ascii__line_text),
)

mdl_ascii = Struct(
	'lines' / GreedyRange(LazyBound(lambda: mdl_ascii__ascii_line)),
)

_schema = mdl_ascii
