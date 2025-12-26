#ifndef UTP_H_
#define UTP_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class utp_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * UTP (Placeable Template) files define placeable objects (containers, furniture, etc.).
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTP Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Placeable name
 * - Appearance (UInt32): Placeable appearance ID
 * - HasInventory, ItemList (List): Container contents
 * - Locked, KeyRequired, Trap: Security settings
 * - Script hooks: OnClick, OnClosed, OnDamaged, OnDeath, OnDisarm, OnHeartbeat, etc.
 */

class utp_t : public kaitai::kstruct {

public:

    utp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, utp_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~utp_t();

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
    utp_t* m__root;
    kaitai::kstruct* m__parent;

public:
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    utp_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // UTP_H_
