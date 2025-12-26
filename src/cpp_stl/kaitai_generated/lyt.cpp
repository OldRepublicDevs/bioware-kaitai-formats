// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "lyt.h"

lyt_t::lyt_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, lyt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void lyt_t::_read() {
    m_raw_content = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "ASCII");
}

lyt_t::~lyt_t() {
    _clean_up();
}

void lyt_t::_clean_up() {
}

lyt_t::artplaceable_entry_t::artplaceable_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, lyt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void lyt_t::artplaceable_entry_t::_read() {
}

lyt_t::artplaceable_entry_t::~artplaceable_entry_t() {
    _clean_up();
}

void lyt_t::artplaceable_entry_t::_clean_up() {
}

lyt_t::doorhook_entry_pykotor_t::doorhook_entry_pykotor_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, lyt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void lyt_t::doorhook_entry_pykotor_t::_read() {
}

lyt_t::doorhook_entry_pykotor_t::~doorhook_entry_pykotor_t() {
    _clean_up();
}

void lyt_t::doorhook_entry_pykotor_t::_clean_up() {
}

lyt_t::doorhook_entry_xoreos_t::doorhook_entry_xoreos_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, lyt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void lyt_t::doorhook_entry_xoreos_t::_read() {
}

lyt_t::doorhook_entry_xoreos_t::~doorhook_entry_xoreos_t() {
    _clean_up();
}

void lyt_t::doorhook_entry_xoreos_t::_clean_up() {
}

lyt_t::obstacle_entry_t::obstacle_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, lyt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void lyt_t::obstacle_entry_t::_read() {
}

lyt_t::obstacle_entry_t::~obstacle_entry_t() {
    _clean_up();
}

void lyt_t::obstacle_entry_t::_clean_up() {
}

lyt_t::room_entry_t::room_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, lyt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void lyt_t::room_entry_t::_read() {
}

lyt_t::room_entry_t::~room_entry_t() {
    _clean_up();
}

void lyt_t::room_entry_t::_clean_up() {
}

lyt_t::track_entry_t::track_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, lyt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void lyt_t::track_entry_t::_read() {
}

lyt_t::track_entry_t::~track_entry_t() {
    _clean_up();
}

void lyt_t::track_entry_t::_clean_up() {
}

lyt_t::walkmesh_room_entry_t::walkmesh_room_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, lyt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void lyt_t::walkmesh_room_entry_t::_read() {
}

lyt_t::walkmesh_room_entry_t::~walkmesh_room_entry_t() {
    _clean_up();
}

void lyt_t::walkmesh_room_entry_t::_clean_up() {
}
