#ifndef UTC_H_
#define UTC_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class utc_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * UTC (Creature Template) files are GFF-based format files that store creature definitions
 * including stats, appearance, inventory, feats, and script hooks. UTC files are used to
 * define NPCs, party members, enemies, and the player character in Knights of the Old Republic.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds UTC-specific
 * validation and documentation.
 * 
 * UTC Root Struct Fields (Common):
 * - "TemplateResRef" (ResRef): Blueprint identifier
 * - "Tag" (String): Unique instance identifier
 * - "FirstName", "LastName" (LocalizedString): Creature name
 * - "Appearance_Type" (UInt32): Appearance ID (appearance.2da)
 * - "PortraitId" (UInt16): Portrait index (portraits.2da)
 * - "Gender", "Race" (UInt8/UInt16): Character attributes
 * - "Str", "Dex", "Con", "Int", "Wis", "Cha" (UInt8): Ability scores
 * - "HitPoints", "MaxHitPoints", "ForcePoints" (Int16): Health/Force stats
 * - "ClassList" (List): Character classes with levels
 * - "FeatList" (List): Known feats
 * - "SkillList" (List): Skill ranks
 * - "ItemList" (List): Inventory items
 * - "Equip_ItemList" (List): Equipped items with slots
 * - Script hooks: "ScriptAttacked", "ScriptDamaged", "ScriptDeath", etc. (ResRef)
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTC.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utc.py
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/utc.cpp
 */

class utc_t : public kaitai::kstruct {

public:

    utc_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, utc_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~utc_t();

private:
    bool f_file_type_valid;
    bool m_file_type_valid;

public:

    /**
     * Validates that this is a UTC file (file type must be "UTC ")
     */
    bool file_type_valid();

private:
    bool f_version_valid;
    bool m_version_valid;

public:

    /**
     * Validates GFF version is supported
     */
    bool version_valid();

private:
    gff_t::gff_t* m_gff_data;
    utc_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Complete GFF structure. UTC files use standard GFF format with "UTC " file type.
     * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
     */
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    utc_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // UTC_H_
