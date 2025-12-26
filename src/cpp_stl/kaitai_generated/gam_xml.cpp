// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gam_xml.h"

gam_xml_t::gam_xml_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gam_xml_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gam_xml_t::_read() {
    m_xml_content = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

gam_xml_t::~gam_xml_t() {
    _clean_up();
}

void gam_xml_t::_clean_up() {
}
