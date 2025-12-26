#ifndef JRL_H_
#define JRL_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class jrl_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * JRL (Journal) files store quest journal entries and categories.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * JRL Root Struct Fields:
 * - Categories (List): Journal categories
 * - Each category contains quest entries with text, states, priorities
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-JRL.md
 */

class jrl_t : public kaitai::kstruct {

public:

    jrl_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, jrl_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~jrl_t();

private:
    bool f_file_type_valid;
    bool m_file_type_valid;

public:
    bool file_type_valid();

private:
    bool f_version_valid;
    bool m_version_valid;

public:
    bool version_valid();

private:
    gff_t::gff_t* m_gff_data;
    jrl_t* m__root;
    kaitai::kstruct* m__parent;

public:
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    jrl_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // JRL_H_
