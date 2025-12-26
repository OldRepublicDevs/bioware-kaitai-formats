#ifndef GFF_JSON_H_
#define GFF_JSON_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class gff_json_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * GFF JSON format is a human-readable JSON representation of GFF (Generic File Format) binary files.
 * Provides easier editing and interoperability with modern tools than binary GFF format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 */

class gff_json_t : public kaitai::kstruct {

public:

    gff_json_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, gff_json_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~gff_json_t();

private:
    std::string m_json_content;
    gff_json_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * JSON document content as UTF-8 text
     */
    std::string json_content() const { return m_json_content; }
    gff_json_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // GFF_JSON_H_
