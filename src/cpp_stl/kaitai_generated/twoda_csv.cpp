// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "twoda_csv.h"

twoda_csv_t::twoda_csv_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, twoda_csv_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void twoda_csv_t::_read() {
    m_csv_content = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

twoda_csv_t::~twoda_csv_t() {
    _clean_up();
}

void twoda_csv_t::_clean_up() {
}
