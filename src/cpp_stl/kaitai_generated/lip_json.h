#ifndef LIP_JSON_H_
#define LIP_JSON_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class lip_json_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * LIP JSON format is a human-readable JSON representation of LIP (Lipsync) binary files.
 * Provides easier editing than binary LIP format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/io_lip_xml.py
 */

class lip_json_t : public kaitai::kstruct {

public:

    lip_json_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, lip_json_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~lip_json_t();

private:
    std::string m_json_content;
    lip_json_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * JSON document content as UTF-8 text
     */
    std::string json_content() const { return m_json_content; }
    lip_json_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // LIP_JSON_H_
