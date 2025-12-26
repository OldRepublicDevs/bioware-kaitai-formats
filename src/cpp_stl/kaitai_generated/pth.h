#ifndef PTH_H_
#define PTH_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class pth_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * PTH (Path/Pathfinding) files store pathfinding waypoint graphs for AI navigation.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * PTH Root Struct Fields:
 * - Path_Points (List): Waypoint positions (X, Y coordinates)
 * - Connections (List): Connections between waypoints
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-PTH.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/pth.py
 */

class pth_t : public kaitai::kstruct {

public:

    pth_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, pth_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~pth_t();

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
    pth_t* m__root;
    kaitai::kstruct* m__parent;

public:
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    pth_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // PTH_H_
