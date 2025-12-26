from construct import *
from construct.lib import *

utc = Struct(
	'gff_data' / LazyBound(lambda: gff),
	'file_type_valid' / Computed(lambda this: this.gff_data.header.file_type == u"UTC "),
	'version_valid' / Computed(lambda this:  ((this.gff_data.header.file_version == u"V3.2") or (this.gff_data.header.file_version == u"V3.3") or (this.gff_data.header.file_version == u"V4.0") or (this.gff_data.header.file_version == u"V4.1")) ),
)

_schema = utc
