from construct import *
from construct.lib import *

utp = Struct(
	'gff_data' / LazyBound(lambda: gff),
	'file_type_valid' / Computed(lambda this: this.gff_data.header.file_type == u"UTP "),
	'version_valid' / Computed(lambda this:  ((this.gff_data.header.file_version == u"V3.2") or (this.gff_data.header.file_version == u"V3.3")) ),
)

_schema = utp
