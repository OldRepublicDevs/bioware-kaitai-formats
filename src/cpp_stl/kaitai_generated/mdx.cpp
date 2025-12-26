// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "mdx.h"

mdx_t::mdx_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mdx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_vertex_data = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mdx_t::_read() {
    m_vertex_data = new std::vector<uint8_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_vertex_data->push_back(m__io->read_u1());
            i++;
        }
    }
}

mdx_t::~mdx_t() {
    _clean_up();
}

void mdx_t::_clean_up() {
    if (m_vertex_data) {
        delete m_vertex_data; m_vertex_data = 0;
    }
}
