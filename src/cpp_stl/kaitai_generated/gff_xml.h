#ifndef GFF_XML_H_
#define GFF_XML_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class gff_xml_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * GFF XML format is a human-readable XML representation of GFF (Generic File Format) binary files.
 * Used by xoreos-tools and other modding tools for easier editing than binary GFF format.
 * 
 * The XML format represents the hierarchical GFF structure using XML elements:
 * - Root element: <gff3>
 * - Contains a <struct> element with id attribute
 * - Struct contains field elements (byte, uint32, exostring, locstring, resref, list, etc.)
 * - Each field has a label attribute
 * - Lists contain nested <struct> elements
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/formats/gff/io_gff_xml.py
 * - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffdumper.cpp
 * - https://github.com/xoreos/xoreos-tools/blob/master/src/xml/gffcreator.cpp
 */

class gff_xml_t : public kaitai::kstruct {

public:

    gff_xml_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, gff_xml_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~gff_xml_t();

private:
    std::string m_xml_content;
    gff_xml_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * XML document content as UTF-8 text.
     * Structure: <gff3><struct id="...">...</struct></gff3>
     * Note: Kaitai Struct has limited XML parsing capabilities. For full XML parsing,
     * use an XML parser library. This definition serves as a format identifier.
     */
    std::string xml_content() const { return m_xml_content; }
    gff_xml_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // GFF_XML_H_
