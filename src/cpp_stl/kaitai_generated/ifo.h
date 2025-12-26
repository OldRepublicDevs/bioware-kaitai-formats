#ifndef IFO_H_
#define IFO_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class ifo_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * IFO (Module Information) files store module metadata including entry points,
 * starting locations, and module properties.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * IFO Root Struct Fields:
 * - Mod_ID (ResRef): Module identifier
 * - Mod_Name (LocalizedString): Module display name
 * - Mod_Entry_Area (ResRef): Starting area
 * - Mod_Entry_X, Mod_Entry_Y, Mod_Entry_Z (Float): Starting position
 * - Mod_Entry_Dir_X, Mod_Entry_Dir_Y (Float): Starting orientation
 * - Mod_OnHeartbeat, Mod_OnModLoad, Mod_OnModStart (ResRef): Script hooks
 * - Mod_MinGameVer (String): Minimum game version required
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-IFO.md
 */

class ifo_t : public kaitai::kstruct {

public:

    ifo_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, ifo_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~ifo_t();

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
    ifo_t* m__root;
    kaitai::kstruct* m__parent;

public:
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    ifo_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // IFO_H_
