// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "pth.h"

pth_t::pth_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, pth_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_gff_data = 0;
    f_file_type_valid = false;
    f_version_valid = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void pth_t::_read() {
    m_gff_data = new gff_t::gff_t(m__io);
}

pth_t::~pth_t() {
    _clean_up();
}

void pth_t::_clean_up() {
    if (m_gff_data) {
        delete m_gff_data; m_gff_data = 0;
    }
}

bool pth_t::file_type_valid() {
    if (f_file_type_valid)
        return m_file_type_valid;
    f_file_type_valid = true;
    m_file_type_valid = gff_data()->header()->file_type() == std::string("PTH ");
    return m_file_type_valid;
}

bool pth_t::version_valid() {
    if (f_version_valid)
        return m_version_valid;
    f_version_valid = true;
    m_version_valid =  ((gff_data()->header()->file_version() == std::string("V3.2")) || (gff_data()->header()->file_version() == std::string("V3.3")) || (gff_data()->header()->file_version() == std::string("V4.0")) || (gff_data()->header()->file_version() == std::string("V4.1"))) ;
    return m_version_valid;
}
