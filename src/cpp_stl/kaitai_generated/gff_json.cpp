// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gff_json.h"

gff_json_t::gff_json_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gff_json_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gff_json_t::_read() {
    m_json_content = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

gff_json_t::~gff_json_t() {
    _clean_up();
}

void gff_json_t::_clean_up() {
}
