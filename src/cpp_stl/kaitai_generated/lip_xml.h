#ifndef LIP_XML_H_
#define LIP_XML_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class lip_xml_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * LIP XML format is a human-readable XML representation of LIP (Lipsync) binary files.
 * Provides easier editing than binary LIP format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/lip.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/lip/io_lip_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/graphics/format/lipreader.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/LIP-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/graphics/aurora/lipfile.cpp
 * 
 * - ../GFF/GFF
 * - ../GFF/XML/GFF_XML
 * - ../LIP/LIP
 */

class lip_xml_t : public kaitai::kstruct {

public:

    lip_xml_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, lip_xml_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~lip_xml_t();

private:
    std::string m_xml_content;
    lip_xml_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * XML document content as UTF-8 text
     */
    std::string xml_content() const { return m_xml_content; }
    lip_xml_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // LIP_XML_H_
