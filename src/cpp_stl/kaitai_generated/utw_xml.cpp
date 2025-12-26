// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "utw_xml.h"

utw_xml_t::utw_xml_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, utw_xml_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void utw_xml_t::_read() {
    m_xml_content = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

utw_xml_t::~utw_xml_t() {
    _clean_up();
}

void utw_xml_t::_clean_up() {
}
