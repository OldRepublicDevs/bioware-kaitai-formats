#ifndef TLK_JSON_H_
#define TLK_JSON_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class tlk_json_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * TLK JSON format is a human-readable JSON representation of TLK (Talk Table) binary files.
 * Provides easier editing and translation than binary TLK format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/io_tlk_xml.py
 */

class tlk_json_t : public kaitai::kstruct {

public:

    tlk_json_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, tlk_json_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~tlk_json_t();

private:
    std::string m_json_content;
    tlk_json_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * JSON document content as UTF-8 text
     */
    std::string json_content() const { return m_json_content; }
    tlk_json_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // TLK_JSON_H_
