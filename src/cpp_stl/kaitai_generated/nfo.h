#ifndef NFO_H_
#define NFO_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class nfo_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * NFO (Module Info) files store save game module information for KotOR.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * Note: This is different from IFO files. NFO is used in save games,
 * while IFO is used in module definitions.
 */

class nfo_t : public kaitai::kstruct {

public:

    nfo_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, nfo_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~nfo_t();

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
    nfo_t* m__root;
    kaitai::kstruct* m__parent;

public:
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    nfo_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // NFO_H_
