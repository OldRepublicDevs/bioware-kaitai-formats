#ifndef RES_XML_H_
#define RES_XML_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class res_xml_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * RES XML format is a human-readable XML representation of RES (Save Data) binary files.
 * Uses GFF XML structure with root element <gff3> containing <struct> elements.
 * Each field has a label attribute and appropriate type element (byte, uint32, exostring, etc.).
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 */

class res_xml_t : public kaitai::kstruct {

public:

    res_xml_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, res_xml_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~res_xml_t();

private:
    std::string m_xml_content;
    res_xml_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * XML document content as UTF-8 text
     */
    std::string xml_content() const { return m_xml_content; }
    res_xml_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // RES_XML_H_
