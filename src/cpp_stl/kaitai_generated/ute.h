#ifndef UTE_H_
#define UTE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class ute_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * UTE (Encounter Template) files define spawn encounters with creature lists and probabilities.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * UTE Root Struct Fields:
 * - TemplateResRef (ResRef): Blueprint identifier
 * - Tag (String): Instance identifier
 * - LocalizedName (LocalizedString): Encounter name
 * - CreatureList (List): Creatures to spawn with probabilities
 * - Difficulty, MaxCreatures, RecCreatures, SpawnOption: Spawn behavior
 * - Script hooks: OnEntered, OnExhausted, OnExit, OnHeartbeat, OnUserDefined
 */

class ute_t : public kaitai::kstruct {

public:

    ute_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, ute_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~ute_t();

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
    ute_t* m__root;
    kaitai::kstruct* m__parent;

public:
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    ute_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // UTE_H_
