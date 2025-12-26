// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "twoda_json.h"

twoda_json_t::twoda_json_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, twoda_json_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void twoda_json_t::_read() {
    m_json_content = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

twoda_json_t::~twoda_json_t() {
    _clean_up();
}

void twoda_json_t::_clean_up() {
}
