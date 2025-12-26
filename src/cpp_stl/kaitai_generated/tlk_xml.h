#ifndef TLK_XML_H_
#define TLK_XML_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class tlk_xml_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * TLK XML format is a human-readable XML representation of TLK (Talk Table) binary files.
 * Provides easier editing and translation than binary TLK format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/tlk.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/tlk/io_tlk_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/resource/format/tlkreader.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/TLK-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/aurora/talktable.cpp
 * 
 * - ../GFF/GFF
 * - ../GFF/XML/GFF_XML
 * - ../TLK/TLK
 */

class tlk_xml_t : public kaitai::kstruct {

public:

    tlk_xml_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, tlk_xml_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~tlk_xml_t();

private:
    std::string m_xml_content;
    tlk_xml_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * XML document content as UTF-8 text
     */
    std::string xml_content() const { return m_xml_content; }
    tlk_xml_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // TLK_XML_H_
