from construct import *
from construct.lib import *

fac = Struct(
	'gff_data' / LazyBound(lambda: gff),
	'file_type_valid' / Computed(lambda this: this.gff_data.header.file_type == u"FAC "),
	'version_valid' / Computed(lambda this:  ((this.gff_data.header.file_version == u"V3.2") or (this.gff_data.header.file_version == u"V3.3") or (this.gff_data.header.file_version == u"V4.0") or (this.gff_data.header.file_version == u"V4.1")) ),
)

_schema = fac
