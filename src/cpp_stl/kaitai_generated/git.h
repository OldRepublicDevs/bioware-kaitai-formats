#ifndef GIT_H_
#define GIT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class git_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * GIT (Game Instance Template) files store dynamic area instance data including
 * placed creatures, placeables, doors, triggers, waypoints, sounds, stores, and encounters.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * GIT Root Struct Fields:
 * - CreatureList (List): Placed creatures with positions, orientations
 * - DoorList (List): Placed doors with states, scripts
 * - PlaceableList (List): Placed placeables (chests, etc.)
 * - TriggerList (List): Trigger zones
 * - WaypointList (List): Navigation waypoints
 * - SoundList (List): Ambient sounds
 * - StoreList (List): Merchant shops
 * - EncounterList (List): Spawn encounters
 * - CameraList (List): Camera points
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GIT.md
 */

class git_t : public kaitai::kstruct {

public:

    git_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, git_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~git_t();

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
    git_t* m__root;
    kaitai::kstruct* m__parent;

public:
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    git_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // GIT_H_
