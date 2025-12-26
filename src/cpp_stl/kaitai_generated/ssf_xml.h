#ifndef SSF_XML_H_
#define SSF_XML_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class ssf_xml_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * SSF XML format is a human-readable XML representation of SSF (Soundset) binary files.
 * Provides easier editing than binary SSF format.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/ssf.py
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/ssf/io_ssf_xml.py
 * - https://github.com/seedhartha/reone/tree/master/src/libs/resource/parser/ssf.cpp
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/SSF-File-Format.md
 * - https://github.com/xoreos/xoreos/tree/master/src/aurora/ssffile.cpp
 */

class ssf_xml_t : public kaitai::kstruct {

public:

    ssf_xml_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, ssf_xml_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~ssf_xml_t();

private:
    std::string m_xml_content;
    ssf_xml_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * XML document content as UTF-8 text
     */
    std::string xml_content() const { return m_xml_content; }
    ssf_xml_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // SSF_XML_H_
