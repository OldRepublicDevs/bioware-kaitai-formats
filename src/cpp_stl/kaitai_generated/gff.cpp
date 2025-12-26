// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gff.h"
std::set<gff_t::gff_field_type_t> gff_t::_build_values_gff_field_type_t() {
    std::set<gff_t::gff_field_type_t> _t;
    _t.insert(gff_t::GFF_FIELD_TYPE_UINT8);
    _t.insert(gff_t::GFF_FIELD_TYPE_INT8);
    _t.insert(gff_t::GFF_FIELD_TYPE_UINT16);
    _t.insert(gff_t::GFF_FIELD_TYPE_INT16);
    _t.insert(gff_t::GFF_FIELD_TYPE_UINT32);
    _t.insert(gff_t::GFF_FIELD_TYPE_INT32);
    _t.insert(gff_t::GFF_FIELD_TYPE_UINT64);
    _t.insert(gff_t::GFF_FIELD_TYPE_INT64);
    _t.insert(gff_t::GFF_FIELD_TYPE_SINGLE);
    _t.insert(gff_t::GFF_FIELD_TYPE_DOUBLE);
    _t.insert(gff_t::GFF_FIELD_TYPE_STRING);
    _t.insert(gff_t::GFF_FIELD_TYPE_RESREF);
    _t.insert(gff_t::GFF_FIELD_TYPE_LOCALIZED_STRING);
    _t.insert(gff_t::GFF_FIELD_TYPE_BINARY);
    _t.insert(gff_t::GFF_FIELD_TYPE_STRUCT);
    _t.insert(gff_t::GFF_FIELD_TYPE_LIST);
    _t.insert(gff_t::GFF_FIELD_TYPE_VECTOR4);
    _t.insert(gff_t::GFF_FIELD_TYPE_VECTOR3);
    return _t;
}
const std::set<gff_t::gff_field_type_t> gff_t::_values_gff_field_type_t = gff_t::_build_values_gff_field_type_t();
bool gff_t::_is_defined_gff_field_type_t(gff_t::gff_field_type_t v) {
    return gff_t::_values_gff_field_type_t.find(v) != gff_t::_values_gff_field_type_t.end();
}

gff_t::gff_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = 0;
    m_field_array = 0;
    m_field_data = 0;
    m_field_indices_array = 0;
    m_label_array = 0;
    m_list_indices_array = 0;
    m_struct_array = 0;
    f_field_array = false;
    f_field_data = false;
    f_field_indices_array = false;
    f_label_array = false;
    f_list_indices_array = false;
    f_struct_array = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gff_t::_read() {
    m_header = new gff_header_t(m__io, this, m__root);
}

gff_t::~gff_t() {
    _clean_up();
}

void gff_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (f_field_array && !n_field_array) {
        if (m_field_array) {
            delete m_field_array; m_field_array = 0;
        }
    }
    if (f_field_data && !n_field_data) {
        if (m_field_data) {
            delete m_field_data; m_field_data = 0;
        }
    }
    if (f_field_indices_array && !n_field_indices_array) {
        if (m_field_indices_array) {
            delete m_field_indices_array; m_field_indices_array = 0;
        }
    }
    if (f_label_array && !n_label_array) {
        if (m_label_array) {
            delete m_label_array; m_label_array = 0;
        }
    }
    if (f_list_indices_array && !n_list_indices_array) {
        if (m_list_indices_array) {
            delete m_list_indices_array; m_list_indices_array = 0;
        }
    }
    if (f_struct_array && !n_struct_array) {
        if (m_struct_array) {
            delete m_struct_array; m_struct_array = 0;
        }
    }
}

gff_t::field_array_t::field_array_t(kaitai::kstream* p__io, gff_t* p__parent, gff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gff_t::field_array_t::_read() {
    m_entries = new std::vector<field_entry_t*>();
    const int l_entries = _root()->header()->field_count();
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(new field_entry_t(m__io, this, m__root));
    }
}

gff_t::field_array_t::~field_array_t() {
    _clean_up();
}

void gff_t::field_array_t::_clean_up() {
    if (m_entries) {
        for (std::vector<field_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

gff_t::field_data_t::field_data_t(kaitai::kstream* p__io, gff_t* p__parent, gff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gff_t::field_data_t::_read() {
    m_raw_data = m__io->read_bytes(_root()->header()->field_data_count());
}

gff_t::field_data_t::~field_data_t() {
    _clean_up();
}

void gff_t::field_data_t::_clean_up() {
}

gff_t::field_entry_t::field_entry_t(kaitai::kstream* p__io, gff_t::field_array_t* p__parent, gff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_field_data_offset_value = false;
    f_is_complex_type = false;
    f_is_list_type = false;
    f_is_simple_type = false;
    f_is_struct_type = false;
    f_list_indices_offset_value = false;
    f_struct_index_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gff_t::field_entry_t::_read() {
    m_field_type = static_cast<gff_t::gff_field_type_t>(m__io->read_u4le());
    m_label_index = m__io->read_u4le();
    m_data_or_offset = m__io->read_u4le();
}

gff_t::field_entry_t::~field_entry_t() {
    _clean_up();
}

void gff_t::field_entry_t::_clean_up() {
}

int32_t gff_t::field_entry_t::field_data_offset_value() {
    if (f_field_data_offset_value)
        return m_field_data_offset_value;
    f_field_data_offset_value = true;
    n_field_data_offset_value = true;
    if (is_complex_type()) {
        n_field_data_offset_value = false;
        m_field_data_offset_value = _root()->header()->field_data_offset() + data_or_offset();
    }
    return m_field_data_offset_value;
}

bool gff_t::field_entry_t::is_complex_type() {
    if (f_is_complex_type)
        return m_is_complex_type;
    f_is_complex_type = true;
    m_is_complex_type =  ((field_type() == gff_t::GFF_FIELD_TYPE_UINT64) || (field_type() == gff_t::GFF_FIELD_TYPE_INT64) || (field_type() == gff_t::GFF_FIELD_TYPE_DOUBLE) || (field_type() == gff_t::GFF_FIELD_TYPE_STRING) || (field_type() == gff_t::GFF_FIELD_TYPE_RESREF) || (field_type() == gff_t::GFF_FIELD_TYPE_LOCALIZED_STRING) || (field_type() == gff_t::GFF_FIELD_TYPE_BINARY) || (field_type() == gff_t::GFF_FIELD_TYPE_VECTOR4) || (field_type() == gff_t::GFF_FIELD_TYPE_VECTOR3)) ;
    return m_is_complex_type;
}

bool gff_t::field_entry_t::is_list_type() {
    if (f_is_list_type)
        return m_is_list_type;
    f_is_list_type = true;
    m_is_list_type = field_type() == gff_t::GFF_FIELD_TYPE_LIST;
    return m_is_list_type;
}

bool gff_t::field_entry_t::is_simple_type() {
    if (f_is_simple_type)
        return m_is_simple_type;
    f_is_simple_type = true;
    m_is_simple_type =  ((field_type() == gff_t::GFF_FIELD_TYPE_UINT8) || (field_type() == gff_t::GFF_FIELD_TYPE_INT8) || (field_type() == gff_t::GFF_FIELD_TYPE_UINT16) || (field_type() == gff_t::GFF_FIELD_TYPE_INT16) || (field_type() == gff_t::GFF_FIELD_TYPE_UINT32) || (field_type() == gff_t::GFF_FIELD_TYPE_INT32) || (field_type() == gff_t::GFF_FIELD_TYPE_SINGLE)) ;
    return m_is_simple_type;
}

bool gff_t::field_entry_t::is_struct_type() {
    if (f_is_struct_type)
        return m_is_struct_type;
    f_is_struct_type = true;
    m_is_struct_type = field_type() == gff_t::GFF_FIELD_TYPE_STRUCT;
    return m_is_struct_type;
}

int32_t gff_t::field_entry_t::list_indices_offset_value() {
    if (f_list_indices_offset_value)
        return m_list_indices_offset_value;
    f_list_indices_offset_value = true;
    n_list_indices_offset_value = true;
    if (is_list_type()) {
        n_list_indices_offset_value = false;
        m_list_indices_offset_value = _root()->header()->list_indices_offset() + data_or_offset();
    }
    return m_list_indices_offset_value;
}

uint32_t gff_t::field_entry_t::struct_index_value() {
    if (f_struct_index_value)
        return m_struct_index_value;
    f_struct_index_value = true;
    n_struct_index_value = true;
    if (is_struct_type()) {
        n_struct_index_value = false;
        m_struct_index_value = data_or_offset();
    }
    return m_struct_index_value;
}

gff_t::field_indices_array_t::field_indices_array_t(kaitai::kstream* p__io, gff_t* p__parent, gff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_indices = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gff_t::field_indices_array_t::_read() {
    m_indices = new std::vector<uint32_t>();
    const int l_indices = _root()->header()->field_indices_count();
    for (int i = 0; i < l_indices; i++) {
        m_indices->push_back(m__io->read_u4le());
    }
}

gff_t::field_indices_array_t::~field_indices_array_t() {
    _clean_up();
}

void gff_t::field_indices_array_t::_clean_up() {
    if (m_indices) {
        delete m_indices; m_indices = 0;
    }
}

gff_t::gff_header_t::gff_header_t(kaitai::kstream* p__io, gff_t* p__parent, gff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gff_t::gff_header_t::_read() {
    m_file_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
    m_file_version = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
    m_struct_offset = m__io->read_u4le();
    m_struct_count = m__io->read_u4le();
    m_field_offset = m__io->read_u4le();
    m_field_count = m__io->read_u4le();
    m_label_offset = m__io->read_u4le();
    m_label_count = m__io->read_u4le();
    m_field_data_offset = m__io->read_u4le();
    m_field_data_count = m__io->read_u4le();
    m_field_indices_offset = m__io->read_u4le();
    m_field_indices_count = m__io->read_u4le();
    m_list_indices_offset = m__io->read_u4le();
    m_list_indices_count = m__io->read_u4le();
}

gff_t::gff_header_t::~gff_header_t() {
    _clean_up();
}

void gff_t::gff_header_t::_clean_up() {
}

gff_t::label_array_t::label_array_t(kaitai::kstream* p__io, gff_t* p__parent, gff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_labels = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gff_t::label_array_t::_read() {
    m_labels = new std::vector<label_entry_t*>();
    const int l_labels = _root()->header()->label_count();
    for (int i = 0; i < l_labels; i++) {
        m_labels->push_back(new label_entry_t(m__io, this, m__root));
    }
}

gff_t::label_array_t::~label_array_t() {
    _clean_up();
}

void gff_t::label_array_t::_clean_up() {
    if (m_labels) {
        for (std::vector<label_entry_t*>::iterator it = m_labels->begin(); it != m_labels->end(); ++it) {
            delete *it;
        }
        delete m_labels; m_labels = 0;
    }
}

gff_t::label_entry_t::label_entry_t(kaitai::kstream* p__io, gff_t::label_array_t* p__parent, gff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gff_t::label_entry_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(16), "ASCII");
}

gff_t::label_entry_t::~label_entry_t() {
    _clean_up();
}

void gff_t::label_entry_t::_clean_up() {
}

gff_t::list_entry_t::list_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_struct_indices = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gff_t::list_entry_t::_read() {
    m_num_struct_indices = m__io->read_u4le();
    m_struct_indices = new std::vector<uint32_t>();
    const int l_struct_indices = num_struct_indices();
    for (int i = 0; i < l_struct_indices; i++) {
        m_struct_indices->push_back(m__io->read_u4le());
    }
}

gff_t::list_entry_t::~list_entry_t() {
    _clean_up();
}

void gff_t::list_entry_t::_clean_up() {
    if (m_struct_indices) {
        delete m_struct_indices; m_struct_indices = 0;
    }
}

gff_t::list_indices_array_t::list_indices_array_t(kaitai::kstream* p__io, gff_t* p__parent, gff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gff_t::list_indices_array_t::_read() {
    m_raw_data = m__io->read_bytes(_root()->header()->list_indices_count());
}

gff_t::list_indices_array_t::~list_indices_array_t() {
    _clean_up();
}

void gff_t::list_indices_array_t::_clean_up() {
}

gff_t::struct_array_t::struct_array_t(kaitai::kstream* p__io, gff_t* p__parent, gff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gff_t::struct_array_t::_read() {
    m_entries = new std::vector<struct_entry_t*>();
    const int l_entries = _root()->header()->struct_count();
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(new struct_entry_t(m__io, this, m__root));
    }
}

gff_t::struct_array_t::~struct_array_t() {
    _clean_up();
}

void gff_t::struct_array_t::_clean_up() {
    if (m_entries) {
        for (std::vector<struct_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

gff_t::struct_entry_t::struct_entry_t(kaitai::kstream* p__io, gff_t::struct_array_t* p__parent, gff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_field_indices_offset = false;
    f_has_multiple_fields = false;
    f_has_single_field = false;
    f_single_field_index = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gff_t::struct_entry_t::_read() {
    m_struct_id = m__io->read_s4le();
    m_data_or_offset = m__io->read_u4le();
    m_field_count = m__io->read_u4le();
}

gff_t::struct_entry_t::~struct_entry_t() {
    _clean_up();
}

void gff_t::struct_entry_t::_clean_up() {
}

uint32_t gff_t::struct_entry_t::field_indices_offset() {
    if (f_field_indices_offset)
        return m_field_indices_offset;
    f_field_indices_offset = true;
    n_field_indices_offset = true;
    if (has_multiple_fields()) {
        n_field_indices_offset = false;
        m_field_indices_offset = data_or_offset();
    }
    return m_field_indices_offset;
}

bool gff_t::struct_entry_t::has_multiple_fields() {
    if (f_has_multiple_fields)
        return m_has_multiple_fields;
    f_has_multiple_fields = true;
    m_has_multiple_fields = field_count() > 1;
    return m_has_multiple_fields;
}

bool gff_t::struct_entry_t::has_single_field() {
    if (f_has_single_field)
        return m_has_single_field;
    f_has_single_field = true;
    m_has_single_field = field_count() == 1;
    return m_has_single_field;
}

uint32_t gff_t::struct_entry_t::single_field_index() {
    if (f_single_field_index)
        return m_single_field_index;
    f_single_field_index = true;
    n_single_field_index = true;
    if (has_single_field()) {
        n_single_field_index = false;
        m_single_field_index = data_or_offset();
    }
    return m_single_field_index;
}

gff_t::field_array_t* gff_t::field_array() {
    if (f_field_array)
        return m_field_array;
    f_field_array = true;
    n_field_array = true;
    if (header()->field_count() > 0) {
        n_field_array = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(header()->field_offset());
        m_field_array = new field_array_t(m__io, this, m__root);
        m__io->seek(_pos);
    }
    return m_field_array;
}

gff_t::field_data_t* gff_t::field_data() {
    if (f_field_data)
        return m_field_data;
    f_field_data = true;
    n_field_data = true;
    if (header()->field_data_count() > 0) {
        n_field_data = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(header()->field_data_offset());
        m_field_data = new field_data_t(m__io, this, m__root);
        m__io->seek(_pos);
    }
    return m_field_data;
}

gff_t::field_indices_array_t* gff_t::field_indices_array() {
    if (f_field_indices_array)
        return m_field_indices_array;
    f_field_indices_array = true;
    n_field_indices_array = true;
    if (header()->field_indices_count() > 0) {
        n_field_indices_array = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(header()->field_indices_offset());
        m_field_indices_array = new field_indices_array_t(m__io, this, m__root);
        m__io->seek(_pos);
    }
    return m_field_indices_array;
}

gff_t::label_array_t* gff_t::label_array() {
    if (f_label_array)
        return m_label_array;
    f_label_array = true;
    n_label_array = true;
    if (header()->label_count() > 0) {
        n_label_array = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(header()->label_offset());
        m_label_array = new label_array_t(m__io, this, m__root);
        m__io->seek(_pos);
    }
    return m_label_array;
}

gff_t::list_indices_array_t* gff_t::list_indices_array() {
    if (f_list_indices_array)
        return m_list_indices_array;
    f_list_indices_array = true;
    n_list_indices_array = true;
    if (header()->list_indices_count() > 0) {
        n_list_indices_array = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(header()->list_indices_offset());
        m_list_indices_array = new list_indices_array_t(m__io, this, m__root);
        m__io->seek(_pos);
    }
    return m_list_indices_array;
}

gff_t::struct_array_t* gff_t::struct_array() {
    if (f_struct_array)
        return m_struct_array;
    f_struct_array = true;
    n_struct_array = true;
    if (header()->struct_count() > 0) {
        n_struct_array = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(header()->struct_offset());
        m_struct_array = new struct_array_t(m__io, this, m__root);
        m__io->seek(_pos);
    }
    return m_struct_array;
}
