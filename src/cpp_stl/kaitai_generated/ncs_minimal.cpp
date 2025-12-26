// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ncs_minimal.h"

ncs_minimal_t::ncs_minimal_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ncs_minimal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_instructions = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ncs_minimal_t::_read() {
    m_file_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
    m_file_version = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
    m_size_marker = m__io->read_u1();
    m_total_file_size = m__io->read_u4be();
    m_instructions = new std::vector<instruction_t*>();
    {
        int i = 0;
        instruction_t* _;
        do {
            _ = new instruction_t(m__io, this, m__root);
            m_instructions->push_back(_);
            i++;
        } while (!(_io()->pos() >= _root()->total_file_size()));
    }
}

ncs_minimal_t::~ncs_minimal_t() {
    _clean_up();
}

void ncs_minimal_t::_clean_up() {
    if (m_instructions) {
        for (std::vector<instruction_t*>::iterator it = m_instructions->begin(); it != m_instructions->end(); ++it) {
            delete *it;
        }
        delete m_instructions; m_instructions = 0;
    }
}

ncs_minimal_t::instruction_t::instruction_t(kaitai::kstream* p__io, ncs_minimal_t* p__parent, ncs_minimal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ncs_minimal_t::instruction_t::_read() {
    m_bytecode = m__io->read_u1();
    m_qualifier = m__io->read_u1();
}

ncs_minimal_t::instruction_t::~instruction_t() {
    _clean_up();
}

void ncs_minimal_t::instruction_t::_clean_up() {
}
