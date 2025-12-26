#ifndef UTI_H_
#define UTI_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class uti_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * UTI (Item Template) files define item properties, stats, and behavior.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTI Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Item name
 * - Description (LocalizedString): Item description
 * - BaseItem (Int32): Base item type (baseitems.2da)
 * - Cost, StackSize, Charges: Item economics
 * - ModelVariation, TextureVar, BodyVariation: Item appearance
 * - PropertiesList (List): Item properties (damage, attack bonus, etc.)
 */

class uti_t : public kaitai::kstruct {

public:

    uti_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, uti_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~uti_t();

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
    uti_t* m__root;
    kaitai::kstruct* m__parent;

public:
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    uti_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // UTI_H_
