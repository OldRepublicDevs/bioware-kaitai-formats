# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Gff(KaitaiStruct):
    """GFF (Generic File Format) is BioWare's universal container format for structured game data.
    It is used by many KotOR file types including UTC (creature), UTI (item), DLG (dialogue),
    ARE (area), GIT (game instance template), IFO (module info), and many others.
    
    GFF uses a hierarchical structure with structs containing fields, which can be simple values,
    nested structs, or lists of structs. The format supports version V3.2 (KotOR) and later
    versions (V3.3, V4.0, V4.1) used in other BioWare games.
    
    Binary Format Structure:
    - File Header (56 bytes): File type signature (FourCC), version, counts, and offsets to all
      data tables (structs, fields, labels, field_data, field_indices, list_indices)
    - Label Array: Array of 16-byte null-padded field name labels
    - Struct Array: Array of struct entries (12 bytes each) - struct_id, data_or_offset, field_count
    - Field Array: Array of field entries (12 bytes each) - field_type, label_index, data_or_offset
    - Field Data: Storage area for complex field types (strings, binary, vectors, etc.)
    - Field Indices Array: Array of field index arrays (used when structs have multiple fields)
    - List Indices Array: Array of list entry structures (count + struct indices)
    
    Field Types:
    - Simple types (0-5, 8): Stored inline in data_or_offset (uint8, int8, uint16, int16, uint32,
      int32, float)
    - Complex types (6-7, 9-13, 16-17): Offset to field_data section (uint64, int64, double, string,
      resref, localized_string, binary, vector4, vector3)
    - Struct (14): Struct index stored inline (nested struct)
    - List (15): Offset to list_indices_array (list of structs)
    
    Struct Access Pattern:
    1. Root struct is always at struct_array index 0
    2. If struct.field_count == 1: data_or_offset contains direct field index
    3. If struct.field_count > 1: data_or_offset contains offset into field_indices_array
    4. Use field_index to access field_array entry
    5. Use field.label_index to get field name from label_array
    6. Use field.data_or_offset based on field_type (inline, offset, struct index, list offset)
    
    References:
    - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md - Complete GFF format documentation
    - https://github.com/OldRepublicDevs/PyKotor/wiki/Bioware-Aurora-GFF.md - Official BioWare Aurora GFF specification
    - https://github.com/xoreos/xoreos-docs/blob/master/specs/torlack/itp.html - Tim Smith/Torlack's GFF/ITP documentation
    - https://github.com/seedhartha/reone/blob/master/src/libs/resource/format/gffreader.cpp - Complete C++ GFF reader implementation
    - https://github.com/xoreos/xoreos/blob/master/src/aurora/gff3file.cpp - Generic Aurora GFF implementation (shared format)
    - https://github.com/KotOR-Community-Patches/KotOR.js/blob/master/src/resource/GFFObject.ts - TypeScript GFF parser
    - https://github.com/KotOR-Community-Patches/KotOR-Unity/blob/master/Assets/Scripts/FileObjects/GFFObject.cs - C# Unity GFF loader
    - https://github.com/KotOR-Community-Patches/Kotor.NET/tree/master/Kotor.NET/Formats/KotorGFF/ - .NET GFF reader/writer
    - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff.py - PyKotor binary reader/writer
    - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/gff_data.py - GFF data model
    """

    class GffFieldType(IntEnum):
        uint8 = 0
        int8 = 1
        uint16 = 2
        int16 = 3
        uint32 = 4
        int32 = 5
        uint64 = 6
        int64 = 7
        single = 8
        double = 9
        string = 10
        resref = 11
        localized_string = 12
        binary = 13
        struct = 14
        list = 15
        vector4 = 16
        vector3 = 17
    def __init__(self, _io, _parent=None, _root=None):
        super(Gff, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.header = Gff.GffHeader(self._io, self, self._root)


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        _ = self.field_array
        if hasattr(self, '_m_field_array'):
            pass
            self._m_field_array._fetch_instances()

        _ = self.field_data
        if hasattr(self, '_m_field_data'):
            pass
            self._m_field_data._fetch_instances()

        _ = self.field_indices_array
        if hasattr(self, '_m_field_indices_array'):
            pass
            self._m_field_indices_array._fetch_instances()

        _ = self.label_array
        if hasattr(self, '_m_label_array'):
            pass
            self._m_label_array._fetch_instances()

        _ = self.list_indices_array
        if hasattr(self, '_m_list_indices_array'):
            pass
            self._m_list_indices_array._fetch_instances()

        _ = self.struct_array
        if hasattr(self, '_m_struct_array'):
            pass
            self._m_struct_array._fetch_instances()


    class FieldArray(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Gff.FieldArray, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.entries = []
            for i in range(self._root.header.field_count):
                self.entries.append(Gff.FieldEntry(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



    class FieldData(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Gff.FieldData, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.raw_data = self._io.read_bytes(self._root.header.field_data_count)


        def _fetch_instances(self):
            pass


    class FieldEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Gff.FieldEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.field_type = KaitaiStream.resolve_enum(Gff.GffFieldType, self._io.read_u4le())
            self.label_index = self._io.read_u4le()
            self.data_or_offset = self._io.read_u4le()


        def _fetch_instances(self):
            pass

        @property
        def field_data_offset_value(self):
            """Absolute file offset to field data for complex types."""
            if hasattr(self, '_m_field_data_offset_value'):
                return self._m_field_data_offset_value

            if self.is_complex_type:
                pass
                self._m_field_data_offset_value = self._root.header.field_data_offset + self.data_or_offset

            return getattr(self, '_m_field_data_offset_value', None)

        @property
        def is_complex_type(self):
            """True if field stores data in field_data section."""
            if hasattr(self, '_m_is_complex_type'):
                return self._m_is_complex_type

            self._m_is_complex_type =  ((self.field_type == Gff.GffFieldType.uint64) or (self.field_type == Gff.GffFieldType.int64) or (self.field_type == Gff.GffFieldType.double) or (self.field_type == Gff.GffFieldType.string) or (self.field_type == Gff.GffFieldType.resref) or (self.field_type == Gff.GffFieldType.localized_string) or (self.field_type == Gff.GffFieldType.binary) or (self.field_type == Gff.GffFieldType.vector4) or (self.field_type == Gff.GffFieldType.vector3)) 
            return getattr(self, '_m_is_complex_type', None)

        @property
        def is_list_type(self):
            """True if field is a list of structs."""
            if hasattr(self, '_m_is_list_type'):
                return self._m_is_list_type

            self._m_is_list_type = self.field_type == Gff.GffFieldType.list
            return getattr(self, '_m_is_list_type', None)

        @property
        def is_simple_type(self):
            """True if field stores data inline (simple types)."""
            if hasattr(self, '_m_is_simple_type'):
                return self._m_is_simple_type

            self._m_is_simple_type =  ((self.field_type == Gff.GffFieldType.uint8) or (self.field_type == Gff.GffFieldType.int8) or (self.field_type == Gff.GffFieldType.uint16) or (self.field_type == Gff.GffFieldType.int16) or (self.field_type == Gff.GffFieldType.uint32) or (self.field_type == Gff.GffFieldType.int32) or (self.field_type == Gff.GffFieldType.single)) 
            return getattr(self, '_m_is_simple_type', None)

        @property
        def is_struct_type(self):
            """True if field is a nested struct."""
            if hasattr(self, '_m_is_struct_type'):
                return self._m_is_struct_type

            self._m_is_struct_type = self.field_type == Gff.GffFieldType.struct
            return getattr(self, '_m_is_struct_type', None)

        @property
        def list_indices_offset_value(self):
            """Absolute file offset to list indices for list type fields."""
            if hasattr(self, '_m_list_indices_offset_value'):
                return self._m_list_indices_offset_value

            if self.is_list_type:
                pass
                self._m_list_indices_offset_value = self._root.header.list_indices_offset + self.data_or_offset

            return getattr(self, '_m_list_indices_offset_value', None)

        @property
        def struct_index_value(self):
            """Struct index for struct type fields."""
            if hasattr(self, '_m_struct_index_value'):
                return self._m_struct_index_value

            if self.is_struct_type:
                pass
                self._m_struct_index_value = self.data_or_offset

            return getattr(self, '_m_struct_index_value', None)


    class FieldIndicesArray(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Gff.FieldIndicesArray, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.indices = []
            for i in range(self._root.header.field_indices_count):
                self.indices.append(self._io.read_u4le())



        def _fetch_instances(self):
            pass
            for i in range(len(self.indices)):
                pass



    class GffHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Gff.GffHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.file_type = (self._io.read_bytes(4)).decode(u"ASCII")
            self.file_version = (self._io.read_bytes(4)).decode(u"ASCII")
            self.struct_offset = self._io.read_u4le()
            self.struct_count = self._io.read_u4le()
            self.field_offset = self._io.read_u4le()
            self.field_count = self._io.read_u4le()
            self.label_offset = self._io.read_u4le()
            self.label_count = self._io.read_u4le()
            self.field_data_offset = self._io.read_u4le()
            self.field_data_count = self._io.read_u4le()
            self.field_indices_offset = self._io.read_u4le()
            self.field_indices_count = self._io.read_u4le()
            self.list_indices_offset = self._io.read_u4le()
            self.list_indices_count = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class LabelArray(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Gff.LabelArray, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.labels = []
            for i in range(self._root.header.label_count):
                self.labels.append(Gff.LabelEntry(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.labels)):
                pass
                self.labels[i]._fetch_instances()



    class LabelEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Gff.LabelEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.name = (self._io.read_bytes(16)).decode(u"ASCII")


        def _fetch_instances(self):
            pass


    class ListEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Gff.ListEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_struct_indices = self._io.read_u4le()
            self.struct_indices = []
            for i in range(self.num_struct_indices):
                self.struct_indices.append(self._io.read_u4le())



        def _fetch_instances(self):
            pass
            for i in range(len(self.struct_indices)):
                pass



    class ListIndicesArray(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Gff.ListIndicesArray, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.raw_data = self._io.read_bytes(self._root.header.list_indices_count)


        def _fetch_instances(self):
            pass


    class StructArray(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Gff.StructArray, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.entries = []
            for i in range(self._root.header.struct_count):
                self.entries.append(Gff.StructEntry(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



    class StructEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Gff.StructEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.struct_id = self._io.read_s4le()
            self.data_or_offset = self._io.read_u4le()
            self.field_count = self._io.read_u4le()


        def _fetch_instances(self):
            pass

        @property
        def field_indices_offset(self):
            """Byte offset into field_indices_array when struct has multiple fields."""
            if hasattr(self, '_m_field_indices_offset'):
                return self._m_field_indices_offset

            if self.has_multiple_fields:
                pass
                self._m_field_indices_offset = self.data_or_offset

            return getattr(self, '_m_field_indices_offset', None)

        @property
        def has_multiple_fields(self):
            """True if struct has multiple fields (offset to field indices in data_or_offset)."""
            if hasattr(self, '_m_has_multiple_fields'):
                return self._m_has_multiple_fields

            self._m_has_multiple_fields = self.field_count > 1
            return getattr(self, '_m_has_multiple_fields', None)

        @property
        def has_single_field(self):
            """True if struct has exactly one field (direct field index in data_or_offset)."""
            if hasattr(self, '_m_has_single_field'):
                return self._m_has_single_field

            self._m_has_single_field = self.field_count == 1
            return getattr(self, '_m_has_single_field', None)

        @property
        def single_field_index(self):
            """Direct field index when struct has exactly one field."""
            if hasattr(self, '_m_single_field_index'):
                return self._m_single_field_index

            if self.has_single_field:
                pass
                self._m_single_field_index = self.data_or_offset

            return getattr(self, '_m_single_field_index', None)


    @property
    def field_array(self):
        """Array of field entries (12 bytes each)."""
        if hasattr(self, '_m_field_array'):
            return self._m_field_array

        if self.header.field_count > 0:
            pass
            _pos = self._io.pos()
            self._io.seek(self.header.field_offset)
            self._m_field_array = Gff.FieldArray(self._io, self, self._root)
            self._io.seek(_pos)

        return getattr(self, '_m_field_array', None)

    @property
    def field_data(self):
        """Storage area for complex field types (strings, binary, vectors, etc.)."""
        if hasattr(self, '_m_field_data'):
            return self._m_field_data

        if self.header.field_data_count > 0:
            pass
            _pos = self._io.pos()
            self._io.seek(self.header.field_data_offset)
            self._m_field_data = Gff.FieldData(self._io, self, self._root)
            self._io.seek(_pos)

        return getattr(self, '_m_field_data', None)

    @property
    def field_indices_array(self):
        """Array of field index arrays (used when structs have multiple fields)."""
        if hasattr(self, '_m_field_indices_array'):
            return self._m_field_indices_array

        if self.header.field_indices_count > 0:
            pass
            _pos = self._io.pos()
            self._io.seek(self.header.field_indices_offset)
            self._m_field_indices_array = Gff.FieldIndicesArray(self._io, self, self._root)
            self._io.seek(_pos)

        return getattr(self, '_m_field_indices_array', None)

    @property
    def label_array(self):
        """Array of 16-byte null-padded field name labels."""
        if hasattr(self, '_m_label_array'):
            return self._m_label_array

        if self.header.label_count > 0:
            pass
            _pos = self._io.pos()
            self._io.seek(self.header.label_offset)
            self._m_label_array = Gff.LabelArray(self._io, self, self._root)
            self._io.seek(_pos)

        return getattr(self, '_m_label_array', None)

    @property
    def list_indices_array(self):
        """Array of list entry structures (count + struct indices)."""
        if hasattr(self, '_m_list_indices_array'):
            return self._m_list_indices_array

        if self.header.list_indices_count > 0:
            pass
            _pos = self._io.pos()
            self._io.seek(self.header.list_indices_offset)
            self._m_list_indices_array = Gff.ListIndicesArray(self._io, self, self._root)
            self._io.seek(_pos)

        return getattr(self, '_m_list_indices_array', None)

    @property
    def struct_array(self):
        """Array of struct entries (12 bytes each)."""
        if hasattr(self, '_m_struct_array'):
            return self._m_struct_array

        if self.header.struct_count > 0:
            pass
            _pos = self._io.pos()
            self._io.seek(self.header.struct_offset)
            self._m_struct_array = Gff.StructArray(self._io, self, self._root)
            self._io.seek(_pos)

        return getattr(self, '_m_struct_array', None)


