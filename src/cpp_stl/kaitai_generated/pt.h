#ifndef PT_H_
#define PT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class pt_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * PT (Party Table) files are GFF-based format files that store party and game state information
 * for Odyssey Engine games (KotOR and KotOR 2). PT files use the GFF (Generic File Format) binary
 * structure with file type signature "PT  ".
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds PT-specific
 * validation and documentation.
 * 
 * PT files are typically named "PARTYTABLE.res" and are stored in savegame.sav ERF archives.
 * They contain comprehensive party and game state information including:
 * - Party composition (current members, available NPCs, leader)
 * - Resources (gold/credits, XP pool, components, chemicals)
 * - Journal entries with states, dates, and times
 * - Pazaak cards and side decks for the mini-game
 * - UI state (last panel, messages, tutorial windows shown)
 * - AI state (follow mode, AI enabled, solo mode)
 * - K2-specific: Influence values per companion
 * 
 * PT Root Struct Fields (Common):
 * - "PT_PCNAME" (String): Player character name
 * - "PT_GOLD" (Int32): Credits/gold amount
 * - "PT_XP_POOL" (Int32): Experience points
 * - "PT_PLAYEDSECONDS" (UInt32): Total playtime in seconds
 * - "PT_NUM_MEMBERS" (Int32): Party member count
 * - "PT_CONTROLLED_NPC", "PT_SOLOMODE", "PT_AISTATE", "PT_FOLLOWSTATE" (Int32): AI/party state
 * - "PT_MEMBERS" (List): Party member ResRefs and leader flags
 * - "PT_AVAIL_NPCS" (List): Available NPCs for recruitment
 * - "PT_INFLUENCE" (List): Influence values (KotOR 2 only)
 * - "PT_PAZAAKCARDS", "PT_PAZSIDELIST" (List): Pazaak card collections
 * - Journal/message lists: "PT_FB_MSG_LIST", "PT_DLG_MSG_LIST", "PT_COM_MSG_LIST"
 * 
 * Based on swkotor2.exe: SavePartyTable @ 0x0057bd70
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/extract/savedata.py
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PT.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 */

class pt_t : public kaitai::kstruct {

public:

    pt_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, pt_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~pt_t();

private:
    bool f_file_type_valid;
    bool m_file_type_valid;

public:

    /**
     * Validates that this is a PT file (file type must be "PT  ")
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
    pt_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Complete GFF structure. PT files use standard GFF format with "PT  " file type.
     * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
     */
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    pt_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // PT_H_
