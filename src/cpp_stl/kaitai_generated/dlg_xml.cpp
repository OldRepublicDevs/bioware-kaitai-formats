// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dlg_xml.h"

dlg_xml_t::dlg_xml_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dlg_xml_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dlg_xml_t::_read() {
    m_xml_content = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

dlg_xml_t::~dlg_xml_t() {
    _clean_up();
}

void dlg_xml_t::_clean_up() {
}
