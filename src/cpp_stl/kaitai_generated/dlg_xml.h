#ifndef DLG_XML_H_
#define DLG_XML_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class dlg_xml_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * Human-readable XML representation of DLG (Dialogue) binary files.
 * Uses GFF XML structure with <gff3> root element.
 * 
 * Binary format reference: ../dlg/dlg.ksy
 * 
 * References:
 * - PyKotor wiki (GFF-DLG.md, GFF-File-Format.md)
 */

class dlg_xml_t : public kaitai::kstruct {

public:

    dlg_xml_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, dlg_xml_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~dlg_xml_t();

private:
    std::string m_xml_content;
    dlg_xml_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * XML document content as UTF-8 text
     */
    std::string xml_content() const { return m_xml_content; }
    dlg_xml_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // DLG_XML_H_
