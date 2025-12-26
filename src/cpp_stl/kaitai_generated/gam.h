#ifndef GAM_H_
#define GAM_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class gam_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * GAM (Game State) files are GFF-based format files that store game state information
 * including party members, global variables, game time, and time played.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds GAM-specific
 * validation and documentation.
 * 
 * GAM files are used by:
 * - Aurora Engine (Neverwinter Nights, Neverwinter Nights 2)
 * - Infinity Engine (Mass Effect, Dragon Age Origins, Dragon Age 2)
 * 
 * NOTE: Odyssey Engine (Knights of the Old Republic) does NOT use GAM format -
 * it uses NFO format for save games instead.
 * 
 * GAM Root Struct Fields:
 * - GameTimeHour, GameTimeMinute, GameTimeSecond, GameTimeMillisecond (Int32): Game time
 * - TimePlayed (Int32): Total playtime in seconds
 * - PartyList (List): Party member ResRefs
 * - GlobalBooleans, GlobalNumbers, GlobalStrings (Lists): Global variable storage
 * 
 * Aurora-specific: ModuleName, CurrentArea, PlayerCharacter
 * Infinity-specific: GameName, Chapter, JournalEntries
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GAM.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 */

class gam_t : public kaitai::kstruct {

public:

    gam_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, gam_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~gam_t();

private:
    bool f_file_type_valid;
    bool m_file_type_valid;

public:

    /**
     * Validates that this is a GAM file (file type must be "GAM ")
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
    gam_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Complete GFF structure. GAM files use standard GFF format with "GAM " file type.
     * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
     */
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    gam_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // GAM_H_
