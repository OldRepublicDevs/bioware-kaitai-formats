# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Pt(KaitaiStruct):
    """PT (Party Table) files are GFF-based format files that store party and game state information
    for Odyssey Engine games (KotOR and KotOR 2). PT files use the GFF (Generic File Format) binary
    structure with file type signature "PT  ".
    
    PT files are typically named "PARTYTABLE.res" and are stored in savegame.sav ERF archives.
    They contain comprehensive party and game state information including:
    - Party composition (current members, available NPCs, leader)
    - Resources (gold/credits, XP pool, components, chemicals)
    - Journal entries with states, dates, and times
    - Pazaak cards and side decks for the mini-game
    - UI state (last panel, messages, tutorial windows shown)
    - AI state (follow mode, AI enabled, solo mode)
    - K2-specific: Influence values per companion
    
    Based on swkotor2.exe: SavePartyTable @ 0x0057bd70
    Located via string reference: "PARTYTABLE" @ 0x007c1910
    Original implementation: Creates GFF with "PT  " signature and "V2.0" version string
    
    References:
    - vendor/PyKotor/Libraries/PyKotor/src/pykotor/extract/savedata.py
    - vendor/PyKotor/wiki/GFF-File-Format.md
    - src/Andastra/Runtime/Content/Save/SaveSerializer.cs (SerializePartyTable)
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(Pt, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.header = Pt.GffHeader(self._io, self, self._root)


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
            super(Pt.FieldArray, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.entries = []
            for i in range(self._root.header.field_count):
                self.entries.append(Pt.FieldEntry(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



    class FieldDataSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Pt.FieldDataSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.data = []
            for i in range(self._root.header.field_data_count):
                self.data.append(self._io.read_u1())



        def _fetch_instances(self):
            pass
            for i in range(len(self.data)):
                pass



    class FieldEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Pt.FieldEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.field_type = self._io.read_u4le()
            self.label_index = self._io.read_u4le()
            self.data_or_offset = self._io.read_u4le()


        def _fetch_instances(self):
            pass

        @property
        def label_name(self):
            """Field name from label array."""
            if hasattr(self, '_m_label_name'):
                return self._m_label_name

            self._m_label_name = self._root.label_array.labels[self.label_index].name
            return getattr(self, '_m_label_name', None)


    class FieldIndicesArray(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Pt.FieldIndicesArray, self).__init__(_io)
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
            super(Pt.GffHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.file_type = (self._io.read_bytes(4)).decode(u"ASCII")
            self.file_version = (self._io.read_bytes(4)).decode(u"ASCII")
            self.struct_array_offset = self._io.read_u4le()
            self.struct_count = self._io.read_u4le()
            self.field_array_offset = self._io.read_u4le()
            self.field_count = self._io.read_u4le()
            self.label_array_offset = self._io.read_u4le()
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
            super(Pt.LabelArray, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.labels = []
            for i in range(self._root.header.label_count):
                self.labels.append(Pt.LabelEntry(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.labels)):
                pass
                self.labels[i]._fetch_instances()



    class LabelEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Pt.LabelEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(16), 0, False)).decode(u"ASCII")


        def _fetch_instances(self):
            pass


    class ListEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Pt.ListEntry, self).__init__(_io)
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
            super(Pt.ListIndicesArray, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.entries = []
            i = 0
            while True:
                _ = Pt.ListEntry(self._io, self, self._root)
                self.entries.append(_)
                if self._io.pos() >= self._root.header.list_indices_offset + self._root.header.list_indices_count * 4:
                    break
                i += 1


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



    class StructArray(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Pt.StructArray, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.entries = []
            for i in range(self._root.header.struct_count):
                self.entries.append(Pt.StructEntry(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



    class StructEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Pt.StructEntry, self).__init__(_io)
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
            self._io.seek(self.header.field_array_offset)
            self._m_field_array = Pt.FieldArray(self._io, self, self._root)
            self._io.seek(_pos)

        return getattr(self, '_m_field_array', None)

    @property
    def field_data(self):
        """Field data section for complex types (strings, ResRefs, LocalizedStrings, etc.)."""
        if hasattr(self, '_m_field_data'):
            return self._m_field_data

        if self.header.field_data_count > 0:
            pass
            _pos = self._io.pos()
            self._io.seek(self.header.field_data_offset)
            self._m_field_data = Pt.FieldDataSection(self._io, self, self._root)
            self._io.seek(_pos)

        return getattr(self, '_m_field_data', None)

    @property
    def field_indices_array(self):
        """Field indices array (MultiMap) for structs with multiple fields."""
        if hasattr(self, '_m_field_indices_array'):
            return self._m_field_indices_array

        if self.header.field_indices_count > 0:
            pass
            _pos = self._io.pos()
            self._io.seek(self.header.field_indices_offset)
            self._m_field_indices_array = Pt.FieldIndicesArray(self._io, self, self._root)
            self._io.seek(_pos)

        return getattr(self, '_m_field_indices_array', None)

    @property
    def label_array(self):
        """Array of field name labels (16-byte null-terminated strings)."""
        if hasattr(self, '_m_label_array'):
            return self._m_label_array

        if self.header.label_count > 0:
            pass
            _pos = self._io.pos()
            self._io.seek(self.header.label_array_offset)
            self._m_label_array = Pt.LabelArray(self._io, self, self._root)
            self._io.seek(_pos)

        return getattr(self, '_m_label_array', None)

    @property
    def list_indices_array(self):
        """List indices array for LIST type fields (PT_MEMBERS, PT_PUPPETS, PT_AVAIL_PUPS, PT_AVAIL_NPCS, PT_INFLUENCE, etc.)."""
        if hasattr(self, '_m_list_indices_array'):
            return self._m_list_indices_array

        if self.header.list_indices_count > 0:
            pass
            _pos = self._io.pos()
            self._io.seek(self.header.list_indices_offset)
            self._m_list_indices_array = Pt.ListIndicesArray(self._io, self, self._root)
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
            self._io.seek(self.header.struct_array_offset)
            self._m_struct_array = Pt.StructArray(self._io, self, self._root)
            self._io.seek(_pos)

        return getattr(self, '_m_struct_array', None)


